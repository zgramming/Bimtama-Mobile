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
const routeDosenScheduleMeetingForm = 'dosen/schedule-meeting/form';
const routeDosenSettingActiveGroup = 'dosen/setting/active-group';
const routeDosenSettingProfile = 'dosen/setting/profile';
const routeDosenGuidanceForm = 'dosen/guidance/form';

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
      return dosen.GroupFormPage(id: id.isEmpty ? 0 : int.parse(id));
    },
  ),
  GoRoute(
    path: "/dosen/schedule-meeting/form/type/:type/:id",
    name: routeDosenScheduleMeetingForm,
    builder: (context, state) {
      final id = state.params['id'] ?? "0";
      final type = state.params['type'] ?? "group";
      return dosen.ScheduleMeetingGroupFormPage(
        id: id.isEmpty ? 0 : int.parse(id),
        type: type,
      );
    },
  ),
  GoRoute(
    path: "/dosen/guidance/form/:id",
    name: routeDosenGuidanceForm,
    builder: (context, state) {
      final id = state.params['id'] ?? "0";
      return dosen.GuidanceFormPage(
        id: id,
      );
    },
  ),
  GoRoute(
    path: "/dosen/setting/active-group",
    name: routeDosenSettingActiveGroup,
    builder: (context, state) => const dosen.SettingActiveGroupPage(),
  ),
  GoRoute(
    path: "/dosen/setting/profile",
    name: routeDosenSettingProfile,
    builder: (context, state) => const dosen.SettingProfilePage(),
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
