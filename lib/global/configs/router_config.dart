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
  ],
);
