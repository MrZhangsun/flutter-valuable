import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:logging/logging.dart';
import 'config/constants.dart';

final _logger = Logger('register');

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  RegisterPageState createState() => RegisterPageState();
}

class RegisterPageState extends State<RegisterPage> {
  final _usernameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  // 定义注册请求的函数
  Future<void> registerUser(
      String username, String email, String password) async {
    final url = Uri.parse('$baseUrl/register'); // 替换为你的后端服务地址

    final response = await http.post(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'username': username,
        'email': email,
        'password': password,
      }),
    );

    if (response.statusCode == 200) {
      // 请求成功
      _logger.info('注册成功: ${response.body}');
    } else {
      // 请求失败
      _logger.severe('注册失败: ${response.statusCode}');
    }
  }

  void _register() {
    final username = _usernameController.text;
    final email = _emailController.text;
    final password = _passwordController.text;
    final confirmPassword = _confirmPasswordController.text;

    if (password == confirmPassword) {
      registerUser(username, email, password).then((_) {
        // 注册成功后，跳转到登录页面或显示成功消息
        if (mounted) {
          Navigator.pop(context);
        }
      }).catchError((error) {
        // 处理错误
        _logger.severe('注册请求失败: $error');
        if (mounted) {
          // 你可以在这里显示错误消息
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('注册请求失败: $error')),
          );
        }
      });
    } else {
      // 密码不匹配的处理
      _logger.severe('密码不匹配');
      if (mounted) {
        // 显示密码不匹配的消息
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('密码不匹配')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('注册'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: _usernameController,
              decoration: const InputDecoration(
                labelText: '用户名',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16.0),
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
            TextField(
              controller: _confirmPasswordController,
              obscureText: true,
              decoration: const InputDecoration(
                labelText: '确认密码',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: _register,
              child: const Text('注册'),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('已有账号？登录'),
            ),
          ],
        ),
      ),
    );
  }
}
