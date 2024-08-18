import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

final _logger = Logger();

class StartBusinssPage extends StatelessWidget {
  const StartBusinssPage({super.key});

  @override
  Widget build(Object context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("新建"),
        actions: [
          IconButton(
              onPressed: () {
                _logger.i("app bar back...");
              },
              icon: const Icon(Icons.search))
        ],
      ),
    );
  }
}
