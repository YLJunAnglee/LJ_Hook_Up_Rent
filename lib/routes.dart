import 'package:fluro/fluro.dart';
import 'package:hook_up_rent/route_handlers.dart';

class Routes {
  static String home = "/";
  static String login = "/login";
  static String register = "/register";
  static String roomDetail = "/roomDetail";

  static void configureRoutes(FluroRouter router) {
    router.notFoundHandler = notFoundHandler;
    router.define(home, handler: homeHandler);
    router.define(login, handler: loginHandler);
    router.define(register, handler: registerHandler);
    router.define(roomDetail, handler: roomDetailHandler);
  }
}
