import 'package:flutter/material.dart';
import 'package:hook_up_rent/config/application_routes.dart';
import 'package:hook_up_rent/routes.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool showPassword = false;

  @override
  Widget build(BuildContext context) {
    IconData eyesIcon = showPassword ? Icons.visibility : Icons.visibility_off;
    return Scaffold(
      appBar: AppBar(title: Text('登录')),
      body: SafeArea(
        minimum: EdgeInsets.all(20),
        child: ListView(
          children: [
            TextField(
              decoration: InputDecoration(labelText: '用户名', hintText: '请输入用户名'),
            ),
            SizedBox(height: 10),
            TextField(
              obscureText: !showPassword,
              decoration: InputDecoration(
                labelText: '密码',
                hintText: '请输入密码',
                suffixIcon: IconButton(
                  icon: Icon(eyesIcon),
                  onPressed: () {
                    setState(() {
                      showPassword = !showPassword;
                    });
                  },
                ),
              ),
            ),
            SizedBox(height: 40),
            ElevatedButton(
              child: Text('登录', style: TextStyle(color: Colors.white)),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.green),
              ),
              onPressed: () {
                print('登录');
              },
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('还没有账号，'),
                TextButton(
                  child: Text(
                    '去注册~',
                    style: TextStyle(color: Colors.green),
                  ),
                  onPressed: () {
                    ApplicationRoutes.router
                        .navigateTo(context, Routes.register);
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
