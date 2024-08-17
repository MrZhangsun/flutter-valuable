import 'package:flutter/material.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('首页'),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications),
            onPressed: () {
              // 处理通知点击事件
            },
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text('菜单'),
            ),
            ListTile(
              title: const Text('主页'),
              onTap: () {
                // 处理主页点击事件
                Navigator.pop(context);
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
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '欢迎回来, 用户!',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: () {
                    // 创建新分析的处理逻辑
                  },
                  child: const Text('创建新分析'),
                ),
                ElevatedButton(
                  onPressed: () {
                    // 查看历史分析的处理逻辑
                  },
                  child: const Text('查看历史分析'),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView(
                children: [
                  ListTile(
                    title: const Text('最近活动 1'),
                    subtitle: const Text('活动描述'),
                    onTap: () {
                      // 处理最近活动点击事件
                    },
                  ),
                  ListTile(
                    title: const Text('最近活动 2'),
                    subtitle: const Text('活动描述'),
                    onTap: () {
                      // 处理最近活动点击事件
                    },
                  ),
                  // 可以添加更多最近活动
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
