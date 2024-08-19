import 'package:flutter/material.dart';
import '../services/constants.dart';
import 'start.dart';

void showProjectCreateDialog(BuildContext context) {
  showDialog(
      context: context,
      // 防止点击对话框外部的空白区域时被关闭
      barrierDismissible: false,
      builder: (BuildContext context) {
        String projectName = "New";
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.0), // 设置圆角
          ),
          title: const Center(
            child: Text('New'),
          ),
          titleTextStyle:
              const TextStyle(fontSize: 18, color: AppColors.textColor),
          content: TextField(
            onChanged: (value) {
              projectName = value;
            },
            decoration: InputDecoration(
              prefixIcon: Icon(
                IconFont.creation,
                color: AppColors.iconColor,
              ),
              hintText: 'Input Project Name',
              border: const UnderlineInputBorder(
                  borderSide: BorderSide(width: 0.5, color: Colors.black12)),
            ),
          ),
          actions: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text('取消')),
                TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  StartBusinssPage(projectName: projectName)));
                    },
                    child: const Text('创建'))
              ],
            )
          ],
        );
      });
}
