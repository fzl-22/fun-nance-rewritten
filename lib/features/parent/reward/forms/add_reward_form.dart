import 'dart:io';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fun_nance_rewritten/core/models/child.dart';
import 'package:fun_nance_rewritten/core/models/reward.dart';
import 'package:fun_nance_rewritten/core/providers/child_provider.dart';
import 'package:fun_nance_rewritten/core/services/firebase_service.dart';
import 'package:fun_nance_rewritten/core/widgets/buttons/modal_button.dart.dart';
import 'package:fun_nance_rewritten/core/widgets/fields/outlined_text_form_field.dart';
import 'package:image_picker/image_picker.dart';

class AddRewardForm extends ConsumerStatefulWidget {
  const AddRewardForm({super.key});

  @override
  ConsumerState<AddRewardForm> createState() => _AddRewardFormState();
}

class _AddRewardFormState extends ConsumerState<AddRewardForm> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _rewardNameController = TextEditingController();
  final TextEditingController _coinRequiredController = TextEditingController();
  List<DropdownMenuItem<String>> _dropdownItems = [];
  String? _selectedValue = "Semua";
  File? _imageFile;
  String _fileName = "";

  final picker = ImagePicker();

  Future<void> _getImageFromGallery() async {
    final pickedFile = await picker.pickImage(
      source: ImageSource.gallery,
    );

    setState(() {
      if (pickedFile != null) {
        _imageFile = File(pickedFile.path);
        _fileName = _imageFile!.path.split('/').last;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final childData = ref.watch(childListProvider);

    _dropdownItems = childData.map<DropdownMenuItem<String>>(
      (Child child) {
        return DropdownMenuItem<String>(
          value: child.fullName,
          child: Text(
            child.fullName,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        );
      },
    ).toList();

    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.only(
          left: 24,
          top: 48,
          right: 24,
          bottom: MediaQuery.of(context).viewInsets.bottom + 48,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
        ),
        // height: 0.7 * MediaQuery.of(context).size.height,
        width: double.infinity,
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Center(
                child: Text(
                  "Tambahkan Hadiah",
                  style: Theme.of(context).textTheme.titleSmall,
                ),
              ),
              const SizedBox(height: 24),
              Text(
                "Nama hadiah",
                style: Theme.of(context).textTheme.labelLarge,
              ),
              const SizedBox(height: 10),
              OutlinedTextFormField(
                controller: _rewardNameController,
              ),
              const SizedBox(height: 24),
              Text(
                "Koin yang dibutuhkan",
                style: Theme.of(context).textTheme.labelLarge,
              ),
              const SizedBox(height: 10),
              OutlinedTextFormField(
                controller: _coinRequiredController,
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 24),
              Text(
                "Dibuat untuk",
                style: Theme.of(context).textTheme.labelLarge,
              ),
              const SizedBox(height: 10),
              DropdownButtonFormField(
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(
                      color: Theme.of(context).colorScheme.tertiary,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                    vertical: 0,
                    horizontal: 12,
                  ),
                ),
                value: _selectedValue,
                items: _dropdownItems,
                onChanged: (value) {
                  setState(() {
                    _selectedValue = value;
                  });
                },
              ),
              const SizedBox(height: 24),
              Text(
                "Pilih gambar hadiah",
                style: Theme.of(context).textTheme.labelLarge,
              ),
              const SizedBox(height: 10),
              OutlinedButton(
                style: OutlinedButton.styleFrom(
                  foregroundColor: Theme.of(context).colorScheme.tertiary,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  padding: const EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 12,
                  ),
                ),
                onPressed: _getImageFromGallery,
                child: Row(
                  children: [
                    const Icon(
                      Icons.image_search_rounded,
                    ),
                    const SizedBox(
                      width: 12,
                    ),
                    Text(
                      _fileName,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              Center(
                child: ModalButton(
                  onPressed: () async {
                    final imageUrl = await uploadImage(_imageFile!);
                    if (context.mounted) {
                      Navigator.of(context).pop(
                        Reward(
                          title: _rewardNameController.text,
                          childName: _selectedValue!,
                          imageUrl: imageUrl,
                          price: int.parse(_coinRequiredController.text),
                        ),
                      );
                    }
                  },
                  label: "TAMBAH HADIAH",
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
