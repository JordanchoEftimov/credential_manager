import 'package:credential_manager/data/db/app_db.dart';
import 'package:credential_manager/notifier/credential_change_notifier.dart';
import 'package:credential_manager/services/encrypter.dart';
import 'package:credential_manager/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:drift/drift.dart' as drift;
import 'package:provider/provider.dart';

class EditCredential extends StatefulWidget {
  final int id;

  const EditCredential({required this.id, Key? key}) : super(key: key);

  @override
  State<EditCredential> createState() => _EditCredentialState();
}

class _EditCredentialState extends State<EditCredential> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    getCredential();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Credential'),
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
                onPressed: _editCredential,
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

  Future<void> _editCredential() async {
    final isValid = _formKey.currentState?.validate();

    if (isValid != null && isValid) {
      final entity = CredentialCompanion(
        id: drift.Value(widget.id),
        name: drift.Value(_nameController.text),
        username: drift.Value(_usernameController.text),
        password: drift.Value(CustomEncrypter.encrypt(_passwordController.text)),
      );
      Provider.of<CredentialChangeNotifier>(context, listen: false).updateCredentialFeature(entity).then(
            (value) => {
              Navigator.pop(context),
            },
          );
    }
  }

  Future<void> getCredential() async {
    CredentialData credentialData =
        await Provider.of<AppDb>(context, listen: false).getCredential(widget.id);
    _nameController.text = credentialData.name;
    _usernameController.text = credentialData.username;
    _passwordController.text = credentialData.password;
  }
}
