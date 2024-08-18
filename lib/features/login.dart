import 'package:flutter/material.dart';
import 'package:valuable/features/home.dart';
import 'register.dart';
import 'package:logger/logger.dart';
import 'package:http/http.dart' as http;
import '../services/constants.dart';
import 'dart:convert';
import '../services/database.dart';

final _db = AppDatabase();

final _logger = Logger();

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
      final result = jsonDecode(response.body);
      final token = Token(
          id: result['id'] as int,
          name: result['name'] as String,
          nickName: result['nickName'] as String,
          email: result['email'] as String,
          token: result['token'] as String,
          loginTime: DateTime.parse(result['loginTime'] as String));
      _db.insertToken(token);
      _logger.i('登录成功: ${response.body}');
    } else {
      // 请求失败
      _logger.i('登录失败: ${response.statusCode}');
    }
  }

  void _login() {
    final email = _emailController.text;
    final password = _passwordController.text;
    userLogin(email, password).then((_) {
      // 登录成功后，跳转到首页或显示成功消息
      if (mounted) {
        // 登录成功，跳转到仪表盘页面
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const HomePage()),
        );
      }
    }).catchError((error) {
      // 处理错误
      _logger.e('登录请求失败: $error');
      if (mounted) {
        // 你可以在这里显示错误消息
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('登录请求失败: $error')),
        );
      }
    });
  }

  void _reset() {
    _logger.i("clicked reset button");
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
