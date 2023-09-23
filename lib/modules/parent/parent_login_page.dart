import 'package:flutter/material.dart';
import 'package:fun_nance_rewritten/global/themes/color_theme.dart';
import 'package:fun_nance_rewritten/global/widgets/buttons/submit_button.dart';
import 'package:fun_nance_rewritten/global/widgets/fields/highlighted_text_form_field.dart';
import 'package:go_router/go_router.dart';
import 'package:iconly/iconly.dart';

class ParentLoginPage extends StatelessWidget {
  const ParentLoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController emailHpController = TextEditingController();
    TextEditingController passwordController = TextEditingController();

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        forceMaterialTransparency: true,
        leading: IconButton(
          onPressed: () {
            context.go("/welcome");
          },
          icon: const Icon(
            IconlyLight.arrow_left_2,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.asset(
              "assets/images/auth/bird_wallpaper.png",
              width: MediaQuery.of(context).size.width,
            ),
            const SizedBox(height: 24),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    "Selamat Datang",
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(height: 12),
                  Text("Yuk masuk terlebih dahulu ke akunmu!",
                      style: Theme.of(context).textTheme.labelMedium),
                ],
              ),
            ),
            const SizedBox(height: 24),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  HighlightedTextFormField(
                    hintText: "Email atau nomor hp",
                    controller: emailHpController,
                  ),
                  const SizedBox(height: 24),
                  HighlightedTextFormField(
                    hintText: "password",
                    controller: passwordController,
                    obscureText: true,
                  ),
                  const SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        style: TextButton.styleFrom(
                          padding: EdgeInsets.zero,
                          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                          minimumSize: Size.zero,
                          foregroundColor: ColorTheme().mainLighterOrange,
                          alignment: Alignment.centerRight,
                          textStyle: Theme.of(context).textTheme.bodyLarge,
                        ),
                        onPressed: () {},
                        child: const Text("lupa password?"),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  SubmitButton(
                    onPressed: () {},
                    label: "MASUK",
                    icon: IconlyBold.arrow_right_2,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Belum mempunyai akun? ",
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                      TextButton(
                        style: TextButton.styleFrom(
                          padding: EdgeInsets.zero,
                          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                          minimumSize: Size.zero,
                          foregroundColor: ColorTheme().mainLighterOrange,
                          alignment: Alignment.centerRight,
                          textStyle: Theme.of(context).textTheme.bodyLarge,
                        ),
                        onPressed: () {},
                        child: const Text("daftar"),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Text(
                    "atau",
                    style: Theme.of(context).textTheme.bodyLarge,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
