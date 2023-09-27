import 'package:flutter/material.dart';
import 'package:fun_nance_rewritten/global/models/child.dart';
import 'package:fun_nance_rewritten/global/widgets/buttons/modal_button.dart.dart';
import 'package:fun_nance_rewritten/global/widgets/fields/outlined_text_form_field.dart';

class AddChildForm extends StatefulWidget {
  const AddChildForm({super.key});

  @override
  State<AddChildForm> createState() => _AddChildFormState();
}

class _AddChildFormState extends State<AddChildForm> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController childNameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        left: 24,
        top: 24,
        right: 24,
        bottom: MediaQuery.of(context).viewInsets.bottom + 24,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Center(
              child: Text(
                "Tambahkan Data Anak",
                style: Theme.of(context).textTheme.titleSmall,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              "Nama Anak",
              style: Theme.of(context).textTheme.labelLarge!.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
            ),
            const SizedBox(height: 10),
            OutlinedTextFormField(
              controller: childNameController,
            ),
            const SizedBox(height: 24),
            Text(
              "Kata Sandi",
              style: Theme.of(context).textTheme.labelLarge!.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
            ),
            const SizedBox(height: 10),
            OutlinedTextFormField(
              controller: passwordController,
              obscureText: true,
            ),
            const SizedBox(height: 24),
            Text(
              "Konfirmasi Kata Sandi",
              style: Theme.of(context).textTheme.labelLarge!.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
            ),
            const SizedBox(height: 10),
            OutlinedTextFormField(
              controller: confirmPasswordController,
              obscureText: true,
            ),
            const SizedBox(height: 24),
            Center(
              child: ModalButton(
                onPressed: () {
                  Navigator.of(context).pop(
                    Child(
                      fullName: childNameController.text,
                      password: passwordController.text,
                    ),
                  );
                },
                label: "TAMBAH ANAK",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
