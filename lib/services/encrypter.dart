import 'package:encrypt/encrypt.dart';

class CustomEncrypter {
  static late Encrypter encrypter;
  static late IV iv;
  static const String _password = "ASDFHEFDHTGDAFGH";

  static void init() {
    final key = Key.fromUtf8(_password);
    iv = IV.fromLength(16);
    encrypter = Encrypter(AES(key));
  }

  static String decrypt(String text) {
    init();
    return encrypter.decrypt64(text, iv: iv);
  }

  static String encrypt(String text) {
    init();
    return encrypter.encrypt(text, iv: iv).base64;
  }
}