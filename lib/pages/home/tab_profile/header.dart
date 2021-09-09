import 'package:flutter/material.dart';
import 'package:hook_up_rent/config/application_routes.dart';

var loginRegisterStyle = TextStyle(color: Colors.white, fontSize: 20.0);

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({Key? key}) : super(key: key);

  Widget _notLoginBuilder(BuildContext context) {
    return Container(
      height: 95.0,
      padding: EdgeInsets.only(left: 20.0),
      decoration: BoxDecoration(
        color: Colors.green,
      ),
      child: Row(
        children: [
          Container(
            width: 65.0,
            height: 65.0,
            child: CircleAvatar(
              backgroundImage: NetworkImage(
                  'https://tva1.sinaimg.cn/large/008i3skNgy1gsuh24kjbnj30do0duaad.jpg'),
            ),
          ),
          SizedBox(width: 15.0),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 20.0,
              ),
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      ApplicationRoutes.router.navigateTo(context, '/login');
                    },
                    child: Text(
                      '登录',
                      style: loginRegisterStyle,
                    ),
                  ),
                  Text(
                    '/',
                    style: loginRegisterStyle,
                  ),
                  GestureDetector(
                    onTap: () {
                      ApplicationRoutes.router.navigateTo(context, '/register');
                    },
                    child: Text(
                      '注册',
                      style: loginRegisterStyle,
                    ),
                  ),
                ],
              ),
              Text(
                '登录后体验更多',
                style: TextStyle(color: Colors.white),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _LoginBuilder(BuildContext context) {
    String userName = '已登录用户名';
    String userImage =
        'https://tva1.sinaimg.cn/large/008i3skNgy1gsuhtensa6j30lk0li76f.jpg';
    return Container(
      height: 95.0,
      padding: EdgeInsets.only(left: 20.0),
      decoration: BoxDecoration(
        color: Colors.green,
      ),
      child: Row(
        children: [
          Container(
            width: 65.0,
            height: 65.0,
            child: CircleAvatar(
              backgroundImage: NetworkImage(userImage),
            ),
          ),
          SizedBox(width: 15.0),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 20.0,
              ),
              Text(userName, style: loginRegisterStyle),
              Text(
                '查看编辑个人资料',
                style: TextStyle(color: Colors.white),
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var isLogin = true;
    return isLogin ? _LoginBuilder(context) : _notLoginBuilder(context);
  }
}
