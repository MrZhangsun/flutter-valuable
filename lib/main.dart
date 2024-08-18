import 'package:flutter/material.dart';
import 'features/home.dart';
import 'features/start.dart';

const appName = 'Valuable App';

void main() {
  runApp(const ValuableApp());
}

class ValuableApp extends StatelessWidget {
  const ValuableApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // 应用的顶层组件，管理整个应用的路由、主题设置、导航器等
    return MaterialApp(
      title: appName,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomePage(),
      // routes: {
      //   '/start': (context) => const StartBusinssPage(),
      // },
      debugShowCheckedModeBanner: false,
    );
  }
}
