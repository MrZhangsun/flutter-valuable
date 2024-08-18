import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import '../services/constants.dart';

final _logger = Logger();

class Dashboard extends StatelessWidget {
  final String name;
  const Dashboard({Key? key, required this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(name),
        actions: [
          IconButton(
              onPressed: () {
                _logger.i("app bar search...");
              },
              icon: Icon(IconFont.creation)),
          IconButton(
              onPressed: () {
                _logger.i("app bar more...");
              },
              icon: const Icon(Icons.more))
        ],
      ),
    );
  }
}
