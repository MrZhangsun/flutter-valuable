import 'package:flutter/material.dart';
import 'features/home.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
    return ScreenUtilInit(
      designSize: const Size(431, 932),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MaterialApp(
        title: appName,
        theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(
                seedColor: const Color.fromARGB(255, 153, 138, 180)),
            useMaterial3: true,
            textTheme: TextTheme(
              bodySmall: TextStyle(fontSize: 12.sp),
              bodyMedium: TextStyle(fontSize: 14.sp),
              bodyLarge: TextStyle(fontSize: 16.sp),
              displaySmall: TextStyle(fontSize: 18.sp),
              displayMedium: TextStyle(fontSize: 20.sp),
              displayLarge: TextStyle(fontSize: 22.sp),
            )),
        home: const HomePage(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
