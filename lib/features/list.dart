import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import '../services/constants.dart';
import 'create_dialog.dart';

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
                showProjectCreateDialog(context);
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
      body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Center(
                child: Container(
                  width: 900,
                  height: 40, // 设置搜索框的宽度
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0), // 设置圆角
                    border: Border.all(color: Colors.grey, width: 1), // 设置边框
                  ),
                  child: const TextField(
                    decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.search,
                        color: AppColors.iconColor,
                      ), // 搜索图标
                      hintText: '搜索', // 提示文本
                      border: InputBorder.none, // 移除默认边框
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 16.0), // 设置内边距
                    ),
                  ),
                ),
              ),
            ],
          )),
    );
  }
}
