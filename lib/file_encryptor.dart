import 'dart:io';
import 'package:encrypt/encrypt.dart';

export 'package:path_provider/path_provider.dart';
export 'package:path/path.dart';

class FileEncryptor {
  static Key key = Key.fromSecureRandom(16);
  static IV iv = IV.fromSecureRandom(16);

  Encrypter get encrypter => Encrypter(AES(key));

  Future<bool> encrypt(String path, String content) async {
    final file = File("$path.aes");

    file.writeAsString(encrypter.encrypt(content, iv: iv).base64);

    return file.exists();
  }

  Future<String> decrypt(String path) async {
    final file = File("$path.aes");

    final data = await file.readAsString();

    return encrypter.decrypt64(data, iv: iv);
  }
}
