import 'package:dosen/dosen.dart' as dosen;
import 'package:go_router/go_router.dart';

import 'package:mahasiswa/mahasiswa.dart' as mahasiswa;

import 'src/view/login/login_page.dart';
import 'src/view/register/register_page.dart';
import 'src/view/splash/splash_page.dart';

const routeLogin = 'login';
const routeRegister = 'register';
const routeSplash = 'splash';

/// Dosen
const routeHomeDosen = 'dosen/home';

/// Mahasiswa
const routeHomeMahasiswa = 'mahasiswa/home';

final routerConfig = GoRouter(
  initialLocation: "/splash",
  routes: [
    GoRoute(
      path: "/splash",
      name: routeSplash,
      builder: (context, state) => const SplashPage(),
    ),
    GoRoute(
      path: "/login",
      name: routeLogin,
      builder: (context, state) => const LoginPage(),
    ),
    GoRoute(
      path: "/register",
      name: routeRegister,
      builder: (context, state) => const RegisterPage(),
    ),
    GoRoute(
      path: "/dosen/home",
      name: routeHomeDosen,
      builder: (context, state) => const dosen.HomePage(),
    ),
    GoRoute(
      path: "/mahasiswa/home",
      name: routeHomeMahasiswa,
      builder: (context, state) => const mahasiswa.HomePage(),
    ),
  ],
);
