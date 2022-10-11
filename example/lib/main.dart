import 'dart:io';

import 'package:flutter/material.dart';
import 'dart:async';
import 'package:file_encryptor/file_encryptor.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String text = "";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("FileEncryptor"),
        ),
        body: Center(
            child: Column(
          children: [
            Text(
              text,
              style: const TextStyle(fontSize: 25),
            ),
            ElevatedButton(
                onPressed: encyrptFile, child: const Text("Encyrpt")),
            ElevatedButton(
                onPressed: decyrptFile, child: const Text("Decyrpt")),
          ],
        )),
      ),
    );
  }

  Future<void> encyrptFile() async {
    Directory appDocDir = await getApplicationDocumentsDirectory();

    /// this is include in this package

    final String path = join(appDocDir.path, "test_file");

    const String content = "test data";

    bool file = await FileEncryptor().encrypt(path, content);

    setState(() {
      text = (file) ? "File Encyrpted" : "please try again";
    });
  }

  void decyrptFile() async {
    Directory appDocDir = await getApplicationDocumentsDirectory();

    /// this is include in this package

    final String path = join(appDocDir.path, "test_file");
    final String decryptedData = await FileEncryptor().decrypt(path);

    print(decryptedData);
    // setState(() {
    //   text = decryptedData;
    // });
  }
}
