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
        title: Center(
          child: Text(
            name,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ),
        iconTheme: const IconThemeData(color: AppColors.iconColor),
        actions: [
          IconButton(
              onPressed: () {
                _logger.i("app bar search...");
              },
              icon: Icon(
                IconFont.creation,
                color: AppColors.iconColor,
              )),
          IconButton(
              onPressed: () {
                _logger.i("app bar more...");
              },
              icon: const Icon(
                Icons.more_horiz_outlined,
                color: AppColors.iconColor,
              ))
        ],
      ),
    );
  }
}
