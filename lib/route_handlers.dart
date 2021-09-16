import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:hook_up_rent/pages/home/index.dart';
import 'package:hook_up_rent/pages/login.dart';
import 'package:hook_up_rent/pages/not_found.dart';
import 'package:hook_up_rent/pages/register.dart';
import 'package:hook_up_rent/pages/room_add/index.dart';
import 'package:hook_up_rent/pages/room_detail/index.dart';
import 'package:hook_up_rent/pages/room_manage/index.dart';
import 'package:hook_up_rent/pages/setting.dart';
import 'package:hook_up_rent/pages/test_image_picker_demo.dart';

var notFoundHandler = Handler(
    handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
  return NotFoundPage();
});

var homeHandler = Handler(
    handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
  return HomePage();
});

var loginHandler = Handler(
    handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
  return LoginPage();
});

var registerHandler = Handler(
    handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
  return RegisterPage();
});

var roomDetailHandler = Handler(
    handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
  String? roomId = params['roomId']?.first;
  return RoomDetailPage(roomId: roomId);
});

var settingHandler = Handler(
    handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
  return SettingPage();
});

var roomManageHandler = Handler(
    handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
  return RoomManagePage();
});

var roomAddPageHandler = Handler(
    handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
  return RoomAddPage();
});

var testImagePickerPageHandler = Handler(
    handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
  return TestImagePickerPage();
});
