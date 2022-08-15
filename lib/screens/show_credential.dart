import 'package:credential_manager/data/db/app_db.dart';
import 'package:credential_manager/notifier/credential_change_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class ShowCredential extends StatefulWidget {
  final int id;

  const ShowCredential({required this.id, Key? key}) : super(key: key);

  @override
  State<ShowCredential> createState() => _ShowCredentialState();
}

class _ShowCredentialState extends State<ShowCredential> {
  bool _isVisiblePassword = false;

  void _togglePasswordVisible() {
    setState(() {
      _isVisiblePassword = !_isVisiblePassword;
    });
  }

  void _copyToClipboard(String message) {
    Clipboard.setData(ClipboardData(text: message));
  }

  void deleteCredential() {
    Provider.of<CredentialChangeNotifier>(context, listen: false)
        .deleteCredentialFeature(widget.id)
        .then((value) => Navigator.pop(context));
  }

  void editCredential(int id) {
    Navigator.pushNamed(
      context,
      'edit_credential',
      arguments: id,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Show Credential'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () => editCredential(widget.id),
            icon: const Icon(
              Icons.edit,
            ),
          ),
          IconButton(
            onPressed: deleteCredential,
            icon: const Icon(
              Icons.delete,
            ),
          ),
        ],
      ),
      body: FutureBuilder<CredentialData>(
        future: Provider.of<AppDb>(context).getCredential(widget.id),
        builder: (context, snapshot) {
          final CredentialData? credential = snapshot.data;

          if (snapshot.connectionState != ConnectionState.done) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (snapshot.hasError) {
            return Center(
              child: Text(
                snapshot.error.toString(),
              ),
            );
          }

          if (credential != null) {
            return Column(
              children: [
                Center(
                  child: Padding(
                    padding: const EdgeInsets.all(
                      15.0,
                    ),
                    child: Text(
                      'Credential for: ${credential.name}',
                    ),
                  ),
                ),
                ListTile(
                  title: const Text(
                    'Name',
                  ),
                  subtitle: Text(
                    credential.name,
                  ),
                  trailing: IconButton(
                    icon: const Icon(
                      Icons.save,
                    ),
                    onPressed: () => _copyToClipboard(credential.name),
                  ),
                ),
                ListTile(
                  title: const Text(
                    'Username',
                  ),
                  subtitle: Text(
                    credential.username,
                  ),
                  trailing: IconButton(
                    icon: const Icon(
                      Icons.save,
                    ),
                    onPressed: () => _copyToClipboard(credential.username),
                  ),
                ),
                ListTile(
                  title: const Text(
                    'Password',
                  ),
                  subtitle: Text(
                    _isVisiblePassword
                        ? credential.password
                        : credential.password.replaceAll(RegExp('.'), '*'),
                  ),
                  trailing: Wrap(
                    children: [
                      IconButton(
                        icon: Icon(
                          _isVisiblePassword
                              ? Icons.visibility_off
                              : Icons.visibility,
                        ),
                        onPressed: _togglePasswordVisible,
                      ),
                      IconButton(
                        icon: const Icon(
                          Icons.save,
                        ),
                        onPressed: () => _copyToClipboard(credential.password),
                      ),
                    ],
                  ),
                ),
              ],
            );
          }

          return const Center(
            child: Text(
              'Credential not found',
            ),
          );
        },
      ),
    );
  }
}
