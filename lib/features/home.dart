import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:valuable/features/list.dart';
import 'profile.dart';
import '../services/constants.dart';
import 'create_dialog.dart';

final _logger = Logger();

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Map<String, dynamic>> categories = [
    {
      'name': '所有项目',
      'filter': 'all',
      'count': 10,
      'icon': Icons.grid_view_outlined
    },
    {
      'name': '最近使用',
      'filter': 'recent',
      'count': 2,
      'icon': Icons.schedule_outlined
    },
    {'name': '共享', 'filter': 'share', 'count': 33, 'icon': Icons.share},
    {
      'name': '个人收藏',
      'filter': 'favorite',
      'count': 10,
      'icon': Icons.favorite_outline
    },
  ];

  // void _push2NewPage() {
  //   Navigator.push(context,
  //       MaterialPageRoute(builder: (context) => const StartBusinssPage()));
  // }

  void _push2ListPage(String name) {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => Dashboard(name: name)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Valuable Your Business!',
            style: TextStyle(
                fontSize: 18.0,
                color: AppColors.textHead1Color,
                fontWeight: FontWeight.bold),
          ),
          titleSpacing: 2.0,
          iconTheme: const IconThemeData(color: AppColors.iconColor),
          actions: [
            IconButton(
              onPressed: () {
                _logger.i("app bar search...");
              },
              icon: const Icon(Icons.search),
              color: AppColors.accentColor,
            ),
            IconButton(
                onPressed: () {
                  _logger.i("app bar more...");
                },
                icon: const Icon(
                  Icons.notifications,
                  color: AppColors.iconColor,
                ))
          ],
          backgroundColor: AppColors.primaryColor,
        ),
        drawer: const Profile(),
        body: Padding(
          padding: const EdgeInsets.fromLTRB(15, 20, 15, 50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            verticalDirection: VerticalDirection.down,
            children: [
              SizedBox(
                height: 600,
                child: ListView.builder(
                  itemCount: categories.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: Icon(
                        categories[index]['icon'],
                        color: AppColors.iconColor,
                      ),
                      title: Text(categories[index]['name']),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min, // 确保Row使用最小空间
                        children: [
                          Text(
                            categories[index]['count'].toString(),
                            style: const TextStyle(fontSize: 16),
                          ), // 显示数字
                          const SizedBox(width: 8), // 设置数字和图标之间的间距
                          const Icon(
                            Icons.arrow_forward_ios,
                            size: 16,
                          ), // 显示图标
                        ],
                      ),
                      onTap: () {
                        _push2ListPage(categories[index]['name']);
                      },
                    );
                  },
                ),
              ),
              TextButton(
                  onPressed: () {
                    showProjectCreateDialog(context);
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        IconFont.creation,
                        color: AppColors.iconColor,
                        size: 22,
                      ),
                      const SizedBox(
                        width: 3,
                      ),
                      const Text('新建项目',
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: AppColors.iconColor))
                    ],
                  ))
            ],
          ),
        ));
  }
}
