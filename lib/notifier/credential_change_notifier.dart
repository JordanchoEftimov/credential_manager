import 'package:credential_manager/data/db/app_db.dart';
import 'package:flutter/material.dart';

class CredentialChangeNotifier extends ChangeNotifier {
  AppDb? _appDb;

  void initAppDb(AppDb appDb) {
    _appDb = appDb;
  }

  List<CredentialData> _credentialListFeature = [];

  List<CredentialData> get credentialListFeature => _credentialListFeature;

  late CredentialData _credentialData;

  CredentialData get credentialData => _credentialData;

  void getCredentialsFeature() {
    _appDb?.getCredentials().then((value) => _credentialListFeature = value);
    notifyListeners();
  }

  void getCredentialFeature(int id) {
    _appDb?.getCredential(id).then((value) => _credentialData = value);
    notifyListeners();
  }

  Future<void> updateCredentialFeature(CredentialCompanion entity) async {
    await _appDb?.updateCredential(entity);
    getCredentialsFeature();
    notifyListeners();
  }

  Future<void> insertCredentialFeature(CredentialCompanion entity) async {
    await _appDb?.insertCredential(entity);
    getCredentialsFeature();
    notifyListeners();
  }

  Future<void> deleteCredentialFeature(int id) async {
    await _appDb?.deleteCredential(id);
    getCredentialsFeature();
    notifyListeners();
  }
}
