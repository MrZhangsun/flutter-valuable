import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:valuable/features/list.dart';
import 'profile.dart';
import '../services/constants.dart';
import 'create_dialog.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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

  void _push2ListPage(String name) {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => Dashboard(name: name)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Valuable Your Business!',
            style: TextStyle(
                fontSize: 16.sp,
                color: AppColors.textHead1Color,
                fontWeight: FontWeight.bold),
          ),
          titleSpacing: ScreenUtil().setWidth(0.01.sw),
          leadingWidth: 0.1.sw,
          iconTheme: IconThemeData(
            color: AppColors.iconColor,
            size: 16.sp,
          ),
          actions: [
            IconButton(
                onPressed: () {
                  _logger.i("app bar search...");
                },
                icon: const Icon(
                  Icons.search,
                )),
            IconButton(
                onPressed: () {
                  _logger.i("app bar more...");
                },
                icon:
                    const Icon(Icons.notifications, color: AppColors.iconColor))
          ],
          backgroundColor: AppColors.primaryColor,
          toolbarHeight: 0.1.sh,
        ),
        drawer: const Profile(),
        body: Padding(
          padding: EdgeInsets.only(left: 0.01.sw),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            verticalDirection: VerticalDirection.down,
            children: [
              Expanded(
                flex: 9,
                child: ListView.builder(
                  itemCount: categories.length,
                  itemExtent: 40.h,
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: Icon(
                        categories[index]['icon'],
                        color: AppColors.iconColor,
                        size: 16.sp,
                      ),
                      horizontalTitleGap: 0.02.sw,
                      title: Text(categories[index]['name']),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min, // 确保Row使用最小空间
                        children: [
                          Text(
                            categories[index]['count'].toString(),
                            style: TextStyle(fontSize: 16.sp),
                          ), // 显示数字
                          SizedBox(width: 0.02.sw), // 设置数字和图标之间的间距
                          Icon(
                            Icons.arrow_forward_ios,
                            size: 16.sp,
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
              Expanded(
                  flex: 2,
                  child: TextButton(
                      onPressed: () {
                        showProjectCreateDialog(context);
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            IconFont.creation,
                            color: AppColors.iconColor,
                            size: 22.sp,
                          ),
                          SizedBox(
                            width: 3.w,
                          ),
                          Text('新建项目',
                              style: TextStyle(
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.iconColor))
                        ],
                      )))
            ],
          ),
        ));
  }
}
