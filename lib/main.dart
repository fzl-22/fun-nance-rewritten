import 'package:flutter/material.dart';
import 'package:fun_nance_rewritten/global/configs/router_config.dart';
import 'package:fun_nance_rewritten/global/themes/text_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: MaterialApp.router(
        title: 'Flutter Demo',
        theme: ThemeData(
          useMaterial3: true,
          fontFamily: "Poppins",
          textTheme: textTheme,
        ),
        routerConfig: routerConfig,
      ),
    );
  }
}
