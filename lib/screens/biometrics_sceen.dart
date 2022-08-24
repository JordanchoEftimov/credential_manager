import 'package:credential_manager/services/local_auth.dart';
import 'package:flutter/material.dart';

class BiometricsScreen extends StatefulWidget {
  const BiometricsScreen({Key? key}) : super(key: key);

  @override
  State<BiometricsScreen> createState() => _BiometricsScreenState();
}

class _BiometricsScreenState extends State<BiometricsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Authenticate',
        ),
        centerTitle: true,
      ),
      body: Center(
        child: OutlinedButton(
          onPressed: () async {
            final isAuth = await LocalAuthService.auth();
            if (isAuth) {
              Navigator.pushNamed(context, 'home');
            }
          },
          style: OutlinedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                50.0,
              ),
            ),
          ),
          child: const Text(
            'Authenticate with fingerprint',
            style: TextStyle(
              fontSize: 20,
            ),
          ),
        ),
      ),
    );
  }
}
