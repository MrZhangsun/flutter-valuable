import 'package:flutter/material.dart';
import 'package:valuable/features/home.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<StatefulWidget> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 44, 130, 200),
            ),
            child: Text('Personal Center'),
          ),
          ListTile(
            title: const Text('账户'),
            onTap: () {
              // 处理主页点击事件
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const HomePage()));
            },
          ),
          ListTile(
            title: const Text('分析'),
            onTap: () {
              // 处理分析点击事件
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: const Text('设置'),
            onTap: () {
              // 处理设置点击事件
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
