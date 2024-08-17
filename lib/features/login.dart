import 'package:flutter/material.dart';
import 'register.dart';
import 'package:logging/logging.dart';
import 'package:http/http.dart' as http;
import '../config/constants.dart';
import 'dart:convert';
import 'dashborad.dart';

final _logger = Logger('login');

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);
  @override
  LoginPageState createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  // 定义登录请求的函数
  Future<void> userLogin(String email, String password) async {
    final url = Uri.parse('$baseUrl/login'); // 替换为你的后端服务地址

    final response = await http.post(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'email': email,
        'password': password,
      }),
    );

    if (response.statusCode == 200) {
      // 请求成功
      _logger.info('登录成功: ${response.body}');
    } else {
      // 请求失败
      _logger.severe('登录失败: ${response.statusCode}');
    }
  }

  void _login() {
    final email = _emailController.text;
    final password = _passwordController.text;
    userLogin(email, password).then((_) {
      // 登录成功后，跳转到首页或显示成功消息
      if (mounted) {
        // Navigator.pop(context);
        // 登录成功，跳转到仪表盘页面
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const Dashboard()),
        );
      }
    }).catchError((error) {
      // 处理错误
      _logger.severe('登录请求失败: $error');
      if (mounted) {
        // 你可以在这里显示错误消息
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('登录请求失败: $error')),
        );
      }
    });
  }

  void _reset() {
    _logger.info("clicked reset button");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('登录'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: _emailController,
              decoration: const InputDecoration(
                labelText: '电子邮件',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16.0),
            TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: const InputDecoration(
                labelText: '密码',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: _login,
              child: const Text('登录'),
            ),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const RegisterPage()),
                );
              },
              child: const Text('没有账号？注册'),
            ),
            TextButton(
              onPressed: _reset,
              child: const Text('忘记密码'),
            ),
          ],
        ),
      ),
    );
  }
}
