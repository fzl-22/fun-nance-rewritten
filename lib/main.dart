import 'package:flutter/material.dart';
import 'package:fun_nance_rewritten/global/configs/router_config.dart';
import 'package:fun_nance_rewritten/global/themes/text_theme.dart';

void main() {
  runApp(const FunNanceApp());
}

class FunNanceApp extends StatelessWidget {
  const FunNanceApp({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: MaterialApp.router(
        title: 'Fun-Nance',
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
