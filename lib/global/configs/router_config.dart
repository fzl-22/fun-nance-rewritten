import 'package:fun_nance_rewritten/modules/child/child_login_page.dart';
import 'package:fun_nance_rewritten/modules/parent/auth/parent_login_page.dart';
import 'package:fun_nance_rewritten/modules/parent/auth/parent_register_page.dart';
import 'package:fun_nance_rewritten/modules/welcome/welcome_page.dart';
import 'package:go_router/go_router.dart';

final routerConfig = GoRouter(
  initialLocation: "/welcome",
  routes: [
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
      name: "child-login",
      path: "/child/login",
      builder: (context, state) => ChildLoginPage(),
    ),
  ],
);
