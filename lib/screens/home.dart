import 'package:credential_manager/data/db/app_db.dart';
import 'package:credential_manager/notifier/credential_change_notifier.dart';
import 'package:credential_manager/widgets/credential_item_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Credential Manager'),
        centerTitle: true,
      ),
      body: Consumer<CredentialChangeNotifier>(
        builder: (context, snapshot, child) {
          final List<CredentialData> list = snapshot.credentialListFeature;
          if (list.isEmpty) {
            return const Center(
              child: Text(
                'You do not have any credentials yet!',
              ),
            );
          }
          return ListView.builder(
            itemCount: list.length,
            itemBuilder: (context, index) {
              final credential = list[index];
              return Padding(
                padding: const EdgeInsets.all(10.0),
                child: CredentialItemCard(
                  credential: credential,
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, 'add_credential');
        },
        child: const Icon(
          Icons.add,
        ),
      ),
    );
  }
}
