import 'package:flutter/material.dart';
import 'package:logging/logging.dart';
import 'features/login.dart';

const appName = 'Valuable App';
final _logger = Logger('main');

void main() {
  // 设定日志级别
  Logger.root.level = Level.ALL;
  Logger.root.onRecord.listen((record) {
    _logger.info('${record.level.name}: ${record.time}: ${record.message}');
  });
  runApp(const ValuableApp());
}

class ValuableApp extends StatelessWidget {
  const ValuableApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: appName,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const LoginPage(),
    );
  }
}
