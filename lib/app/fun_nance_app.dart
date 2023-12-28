import 'package:flutter/material.dart';
import 'package:fun_nance_rewritten/core/configs/router_config.dart';
import 'package:fun_nance_rewritten/core/themes/color_theme.dart';
import 'package:fun_nance_rewritten/core/themes/text_theme.dart';

class FunNanceApp extends StatelessWidget {
  const FunNanceApp({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: MaterialApp.router(
        title: 'Fun-Nance',
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(
            seedColor: ColorTheme().mainDarkerOrange,
            primary: ColorTheme().mainDarkerOrange,
          ),
          fontFamily: "Poppins",
          textTheme: textTheme,
        ),
        routerConfig: routerConfig,
      ),
    );
  }
}
