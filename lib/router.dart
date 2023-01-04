import 'package:go_router/go_router.dart';

import 'src/view/home/home_page.dart';
import 'src/view/login/login_page.dart';
import 'src/view/register/register_page.dart';
import 'src/view/splash/splash_page.dart';

const routeSplash = 'splash';
const routeLogin = 'login';
const routeRegister = 'register';
const routeHome = 'home';

final routerConfig = GoRouter(
  initialLocation: "/splash",
  routes: [
    GoRoute(
      path: "/splash",
      name: routeSplash,
      builder: (context, state) => SplashPage(),
    ),
    GoRoute(
      path: "/login",
      name: routeLogin,
      builder: (context, state) => LoginPage(),
    ),
    GoRoute(
      path: "/register",
      name: routeRegister,
      builder: (context, state) => RegisterPage(),
    ),
    GoRoute(
      path: "/home",
      name: routeHome,
      builder: (context, state) => HomePage(),
    ),
  ],
);
