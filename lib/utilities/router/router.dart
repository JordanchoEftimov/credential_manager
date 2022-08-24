import 'package:credential_manager/screens/add_credential.dart';
import 'package:credential_manager/screens/biometrics_sceen.dart';
import 'package:credential_manager/screens/edit_credential.dart';
import 'package:credential_manager/screens/home.dart';
import 'package:credential_manager/screens/pin_screen.dart';
import 'package:credential_manager/screens/show_credential.dart';
import 'package:flutter/material.dart';

class RouterGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case 'biometrics_screen':
        return MaterialPageRoute(
          builder: (_) => const BiometricsScreen(),
        );
      case 'pin_screen':
        return MaterialPageRoute(
          builder: (_) => const PinScreen(),
        );
      case 'home':
        return MaterialPageRoute(
          builder: (_) => const Home(),
        );
      case 'add_credential':
        return MaterialPageRoute(
          builder: (_) => const AddCredential(),
        );
      case 'edit_credential':
        if (args is int) {
          return MaterialPageRoute(
            builder: (_) => EditCredential(
              id: args,
            ),
          );
        }
        return _error();
      case 'show_credential':
        if (args is int) {
          return MaterialPageRoute(
            builder: (_) => ShowCredential(
              id: args,
            ),
          );
        }
        return _error();
      default:
        return _error();
    }
  }

  static String homeRoute = 'biometrics_screen';

  static Route<dynamic> _error() {
    return MaterialPageRoute(
      builder: (_) => const Text(
        '404: Not Found',
      ),
    );
  }
}
