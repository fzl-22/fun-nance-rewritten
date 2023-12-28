import 'package:flutter/material.dart';
import 'package:fun_nance_rewritten/core/models/child.dart';
import 'package:fun_nance_rewritten/core/widgets/buttons/modal_button.dart.dart';
import 'package:fun_nance_rewritten/core/widgets/fields/outlined_text_form_field.dart';

class EditChildForm extends StatefulWidget {
  final Child child;

  const EditChildForm({
    super.key,
    required this.child,
  });

  @override
  State<EditChildForm> createState() => _EditChildFormState();
}

class _EditChildFormState extends State<EditChildForm> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController childNameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(16),
          ),
          color: Colors.white),
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Center(
              child: Text(
                "Data Anak",
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
              initialValue: widget.child.fullName,
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
                onPressed: () {},
                label: "UBAH DATA",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
