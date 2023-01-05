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
const routeDosenHome = 'dosen/home';
const routeDosenGroupForm = 'dosen/group/form';

/// Mahasiswa
const routeMahasiswaHome = 'mahasiswa/home';

final dosenRoutes = <RouteBase>[
  GoRoute(
    path: "/dosen/home",
    name: routeDosenHome,
    builder: (context, state) => const dosen.HomePage(),
  ),
  GoRoute(
    path: "/dosen/group/form/:id",
    name: routeDosenGroupForm,
    builder: (context, state) {
      final id = state.params['id'] ?? "0";
      return dosen.GroupFormPage(
        id: id.isEmpty ? 0 : int.parse(id),
      );
    },
  ),
];

final mahasiswaRoutes = <RouteBase>[
  GoRoute(
    path: "/mahasiswa/home",
    name: routeMahasiswaHome,
    builder: (context, state) => const mahasiswa.HomePage(),
  ),
];

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
    ...dosenRoutes,
    ...mahasiswaRoutes,
  ],
);
