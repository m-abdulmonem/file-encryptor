import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:file_encryptor/file_encryptor.dart';

void main() {
  const String content = "test data";

  test('encyrptFile', () async {
    Directory appDocDir = await getApplicationDocumentsDirectory();

    final String path = join(appDocDir.path, "test_file");

    bool encyrpted = await FileEncryptor().encrypt(path, content);

    expect(encyrpted, true);
  });

  test('decyrptFile', () async {
    Directory appDocDir = await getApplicationDocumentsDirectory();

    final String path = join(appDocDir.path, "test_file");

    final String decryptedData = await FileEncryptor().decrypt(path);

    expect(decryptedData, content);
  });
}
