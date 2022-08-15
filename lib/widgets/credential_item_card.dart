import 'package:credential_manager/data/db/app_db.dart';
import 'package:flutter/material.dart';

class CredentialItemCard extends StatelessWidget {
  final CredentialData? credential;

  const CredentialItemCard({Key? key, required this.credential})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context,
          'show_credential',
          arguments: credential?.id,
        );
      },
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(14.0),
          child: Column(
            children: [
              Text(
                'Credential Name: ${credential?.name}',
              ),
              Text(
                'Credential Username: ${credential?.username}',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
