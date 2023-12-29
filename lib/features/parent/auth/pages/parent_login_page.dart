import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fun_nance_rewritten/core/providers/parent_provider.dart';
import 'package:fun_nance_rewritten/core/widgets/buttons/submit_button.dart';
import 'package:fun_nance_rewritten/core/widgets/fields/highlighted_text_form_field.dart';
import 'package:fun_nance_rewritten/core/widgets/toast/toast.dart';
import 'package:fun_nance_rewritten/features/parent/auth/widgets/auth_navigation_button.dart';
import 'package:fun_nance_rewritten/features/parent/auth/widgets/forgot_password_button.dart';
import 'package:go_router/go_router.dart';
import 'package:iconly/iconly.dart';

class ParentLoginPage extends ConsumerStatefulWidget {
  const ParentLoginPage({super.key});

  @override
  ConsumerState<ParentLoginPage> createState() => _ParentLoginPageState();
}

class _ParentLoginPageState extends ConsumerState<ParentLoginPage> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  void onLoginParent() async {
    formKey.currentState!.save();

    if (!formKey.currentState!.validate()) {
      return;
    }

    final email = emailController.text;
    final password = passwordController.text;

    String? errorMessage =
        await ref.read(parentProvider.notifier).loginParentUser(
              email: email,
              password: password,
            );

    if (errorMessage != null) {
      showToast(message: errorMessage);
      return;
    }

    if (context.mounted) {
      context.go("/parent/home");
    }
  }

  @override
  Widget build(BuildContext context) {
    final parentNotifier = ref.watch(parentProvider);
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        forceMaterialTransparency: true,
        leading: IconButton(
          onPressed: () {
            context.pop();
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
              child: Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    HighlightedTextFormField(
                      hintText: "Email",
                      controller: emailController,
                      keyboardType: TextInputType.emailAddress,
                    ),
                    const SizedBox(height: 24),
                    HighlightedTextFormField(
                      hintText: "Password",
                      controller: passwordController,
                      obscureText: true,
                      keyboardType: TextInputType.visiblePassword,
                      isPassword: true,
                    ),
                    const SizedBox(height: 12),
                    const ForgotPasswordButton(),
                    const SizedBox(height: 12),
                    SubmitButton(
                      onPressed: onLoginParent,
                      label: "MASUK",
                      icon: IconlyBold.arrow_right_2,
                      isLoading: parentNotifier.isLoading,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  AuthNavigationButton(
                    firstText: "Belum mempunyai akun?",
                    secondText: "daftar",
                    onPressed: () {
                      context.push("/parent/register");
                    },
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
