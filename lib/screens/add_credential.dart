import 'package:credential_manager/data/db/app_db.dart';
import 'package:credential_manager/notifier/credential_change_notifier.dart';
import 'package:credential_manager/services/encrypter.dart';
import 'package:credential_manager/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:drift/drift.dart' as drift;
import 'package:provider/provider.dart';

class AddCredential extends StatefulWidget {
  const AddCredential({Key? key}) : super(key: key);

  @override
  State<AddCredential> createState() => _AddCredentialState();
}

class _AddCredentialState extends State<AddCredential> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Credential'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Padding(
                  padding: const EdgeInsets.only(bottom: 15.0),
                  child: CustomTextFormField(
                    controller: _nameController,
                    label: 'Name',
                    obscureText: false,
                    autocorrect: true,
                    enableSuggestions: true,
                  )),
              Padding(
                padding: const EdgeInsets.only(bottom: 15.0),
                child: CustomTextFormField(
                  controller: _usernameController,
                  label: 'Username',
                  obscureText: false,
                  autocorrect: true,
                  enableSuggestions: true,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 15.0),
                child: CustomTextFormField(
                  controller: _passwordController,
                  label: 'Password',
                  obscureText: true,
                  autocorrect: false,
                  enableSuggestions: false,
                ),
              ),
              ElevatedButton(
                onPressed: _addCredential,
                child: const Text(
                  'Save',
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _addCredential() async {
    final isValid = _formKey.currentState?.validate();

    if (isValid != null && isValid) {
      final entity = CredentialCompanion(
        name: drift.Value(_nameController.text),
        username: drift.Value(_usernameController.text),
        password: drift.Value(CustomEncrypter.encrypt(_passwordController.text)),
      );
      Provider.of<CredentialChangeNotifier>(context, listen: false).insertCredentialFeature(entity).then(
            (value) => {
              Navigator.pop(context),
            },
          );
    }
  }
}
