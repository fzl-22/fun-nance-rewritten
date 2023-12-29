import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fun_nance_rewritten/core/providers/parent_provider.dart';
import 'package:fun_nance_rewritten/core/widgets/buttons/submit_button.dart';
import 'package:fun_nance_rewritten/core/widgets/fields/highlighted_text_form_field.dart';
import 'package:fun_nance_rewritten/core/widgets/toast/toast.dart';
import 'package:fun_nance_rewritten/features/parent/auth/widgets/auth_navigation_button.dart';
import 'package:go_router/go_router.dart';
import 'package:iconly/iconly.dart';

class ParentRegisterPage extends ConsumerStatefulWidget {
  const ParentRegisterPage({super.key});

  @override
  ConsumerState<ParentRegisterPage> createState() => _ParentRegisterPageState();
}

class _ParentRegisterPageState extends ConsumerState<ParentRegisterPage> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  void onRegisterParent() async {
    formKey.currentState!.save();

    if (!formKey.currentState!.validate()) {
      return;
    }

    final fullName = fullNameController.text;
    final email = emailController.text;
    final password = passwordController.text;

    String? errorMessage =
        await ref.read(parentProvider.notifier).registerParentUser(
              fullName: fullName,
              email: email,
              password: password,
            );

    if (errorMessage != null) {
      if (errorMessage.contains("email-already-in-use")) {
        showToast(message: "Email sudah pernah digunakan");
        return;
      }

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
                  Text("Buat akunmu terlebih dahulu yuk!",
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
                      hintText: "Nama lengkap",
                      controller: fullNameController,
                      keyboardType: TextInputType.name,
                    ),
                    const SizedBox(height: 24),
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
                    const SizedBox(height: 36),
                    SubmitButton(
                      onPressed: onRegisterParent,
                      label: "DAFTAR",
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
                    firstText: "Sudah mempunyai akun?",
                    secondText: "login",
                    onPressed: () {
                      context.push('/parent/login');
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
