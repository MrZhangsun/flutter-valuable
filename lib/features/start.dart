import 'package:flutter/material.dart';

class StartBusinssPage extends StatelessWidget {
  final String projectName;
  const StartBusinssPage({Key? key, required this.projectName})
      : super(key: key);

  @override
  Widget build(Object context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(projectName),
      ),
      body: const Text("data"),
    );
  }
}
