import 'package:credential_manager/data/db/app_db.dart';
import 'package:credential_manager/notifier/credential_change_notifier.dart';
import 'package:credential_manager/themes/custom_theme.dart';
import 'package:credential_manager/utilities/router/router.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        Provider.value(value: AppDb()),
        ChangeNotifierProxyProvider<AppDb, CredentialChangeNotifier>(
          create: (context) => CredentialChangeNotifier(),
          update: (context, db, notifier) => notifier!..initAppDb(db)..getCredentialsFeature(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Credential Manager',
      theme: CustomTheme.redTheme,
      debugShowCheckedModeBanner: false,
      initialRoute: RouterGenerator.homeRoute,
      onGenerateRoute: RouterGenerator.generateRoute,
    );
  }
}
