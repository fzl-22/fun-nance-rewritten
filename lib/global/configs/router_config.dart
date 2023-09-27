import 'package:fun_nance_rewritten/modules/child/child_login_page.dart';
import 'package:fun_nance_rewritten/modules/parent/auth/parent_login_page.dart';
import 'package:fun_nance_rewritten/modules/parent/auth/parent_register_page.dart';
import 'package:fun_nance_rewritten/modules/parent/home/parent_home_page.dart';
import 'package:fun_nance_rewritten/modules/splash/splash_page.dart';
import 'package:fun_nance_rewritten/modules/welcome/welcome_page.dart';
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
      builder: (context, state) => ParentLoginPage(),
    ),
    GoRoute(
      name: "parent-register",
      path: "/parent/register",
      builder: (context, state) => ParentRegisterPage(),
    ),
    GoRoute(
      name: "parent-home",
      path: "/parent/home",
      builder: (context, state) => const ParentHomePage(),
    ),
    GoRoute(
      name: "child-login",
      path: "/child/login",
      builder: (context, state) => ChildLoginPage(),
    ),
  ],
);
