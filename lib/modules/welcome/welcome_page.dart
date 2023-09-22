import 'package:flutter/material.dart';
import 'package:fun_nance_rewritten/global/widgets/buttons/submit_button.dart';
import 'package:iconly/iconly.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.all(48),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/welcome_cats.png',
                  height: 165,
                ),
                const SizedBox(
                  height: 64,
                ),
                Column(
                  children: [
                    Text(
                      "Selamat Datang",
                      style: Theme.of(context).textTheme.displayLarge,
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    Text(
                      "Selamat datang di aplikasi Fun-Nance, Yuk mulai kegiatanmu!",
                      style: Theme.of(context).textTheme.displayMedium,
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 64,
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 48),
                  child: Column(
                    children: [
                      SubmitButton(
                        onPressed: () {},
                        label: "ANAK",
                        icon: IconlyBold.arrow_right_2,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      SubmitButton(
                        onPressed: () {},
                        label: "ORANG TUA",
                        icon: IconlyBold.arrow_right_2,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
