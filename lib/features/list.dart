import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import '../services/constants.dart';
import 'create_dialog.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

final _logger = Logger();

class Dashboard extends StatelessWidget {
  final String name;
  const Dashboard({Key? key, required this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0.08.sh,
        leadingWidth: 0.1.sw,
        title: Center(
          child: Text(
            name,
            style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
          ),
        ),
        iconTheme: IconThemeData(
          color: AppColors.iconColor,
          size: 16.sp,
        ),
        actions: [
          IconButton(
              onPressed: () {
                showProjectCreateDialog(context);
                _logger.i("app bar search...");
              },
              icon: Icon(
                IconFont.creation,
              )),
          IconButton(
              onPressed: () {
                _logger.i("app bar more...");
              },
              icon: const Icon(
                Icons.more_horiz_outlined,
              ))
        ],
      ),
      body: Column(
        children: [
          Center(
            child: Container(
              width: 0.9.sw,
              height: 40.h, // 设置搜索框的宽度
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0.r), // 设置圆角
                border: Border.all(color: Colors.grey, width: 1.r), // 设置边框
              ),
              child: TextField(
                decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.search,
                    color: AppColors.iconColor,
                    size: 16.sp,
                  ), // 搜索图标
                  hintText: '搜索', // 提示文本
                  hintStyle: TextStyle(color: Colors.black38, fontSize: 16.sp),
                  border: InputBorder.none, // 移除默认边框
                  // contentPadding:
                  //     EdgeInsets.symmetric(horizontal: 0.0), // 设置内边距
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
