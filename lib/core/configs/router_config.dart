import 'package:fun_nance_rewritten/features/child/auth/child_login_page.dart';
import 'package:fun_nance_rewritten/features/child/home/child_home_page.dart';
import 'package:fun_nance_rewritten/features/parent/auth/pages/parent_login_page.dart';
import 'package:fun_nance_rewritten/features/parent/auth/pages/parent_register_page.dart';
import 'package:fun_nance_rewritten/features/parent/home/parent_home_page.dart';
import 'package:fun_nance_rewritten/features/parent/profile/parent_profile_page.dart';
import 'package:fun_nance_rewritten/features/splash/splash_page.dart';
import 'package:fun_nance_rewritten/features/welcome/welcome_page.dart';
import 'package:go_router/go_router.dart';

final routerConfig = GoRouter(
  initialLocation: "/",
  routes: [
    GoRoute(
      name: "splash",
      path: "/",
      builder: (context, state) => const SplashPage(),
    ),
    GoRoute(
      name: "welcome",
      path: "/welcome",
      builder: (context, state) => const WelcomePage(),
    ),
    GoRoute(
      name: "parent-login",
      path: "/parent/login",
      builder: (context, state) => const ParentLoginPage(),
    ),
    GoRoute(
      name: "parent-register",
      path: "/parent/register",
      builder: (context, state) => const ParentRegisterPage(),
    ),
    GoRoute(
      name: "parent-home",
      path: "/parent/home",
      builder: (context, state) => const ParentHomePage(),
    ),
    GoRoute(
      name: "parent-profile",
      path: "/parent/profile",
      builder: (context, state) => const ParentProfilePage(),
    ),
    GoRoute(
      name: "child-login",
      path: "/child/login",
      builder: (context, state) => ChildLoginPage(),
    ),
    GoRoute(
      name: "child-home",
      path: "/child/home",
      builder: (context, state) => const ChildHomePage(),
    ),
  ],
);
