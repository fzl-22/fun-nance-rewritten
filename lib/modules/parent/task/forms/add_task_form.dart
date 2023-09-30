import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fun_nance_rewritten/global/models/child.dart';
import 'package:fun_nance_rewritten/global/models/task.dart';
import 'package:fun_nance_rewritten/global/providers/child_provider.dart';
import 'package:fun_nance_rewritten/global/widgets/buttons/modal_button.dart.dart';
import 'package:fun_nance_rewritten/global/widgets/fields/outlined_text_form_field.dart';

class AddTaskForm extends ConsumerStatefulWidget {
  const AddTaskForm({super.key});

  @override
  ConsumerState<AddTaskForm> createState() => _AddTaskFormState();
}

class _AddTaskFormState extends ConsumerState<AddTaskForm> {
  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _priceController = TextEditingController();
  final _descriptionController = TextEditingController();
  String? _selectedValue = "Ahmad Mu'min Faisal";

  DateTime selectedDate = DateTime.now();
  TimeOfDay selectedTime = TimeOfDay.now();

  Future<void> _selectDate() async {
    final picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime.now(),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  Future<void> _selectTime() async {
    final picked = await showTimePicker(
      context: context,
      initialTime: selectedTime,
    );
    if (picked != null && picked != selectedTime) {
      setState(() {
        selectedTime = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final childList = ref
        .watch(childListProvider)
        .where((child) => child.fullName != "Semua")
        .toList();
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 48,
        horizontal: 24,
      ),
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Text(
                "Tambahkan Tugas",
                style: Theme.of(context).textTheme.titleSmall,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              "Judul tugas",
              style: Theme.of(context).textTheme.labelLarge,
            ),
            const SizedBox(height: 5),
            OutlinedTextFormField(
              controller: _titleController,
            ),
            const SizedBox(height: 10),
            Text(
              "Batas penyelesaian tugas",
              style: Theme.of(context).textTheme.labelLarge,
            ),
            const SizedBox(height: 5),
            Row(
              children: [
                Expanded(
                  flex: 2,
                  child: ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      alignment: Alignment.centerLeft,
                      padding: const EdgeInsets.symmetric(
                          vertical: 12, horizontal: 12),
                      foregroundColor: Theme.of(context).colorScheme.tertiary,
                      side: BorderSide(
                        color: Theme.of(context).colorScheme.tertiary,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    onPressed: _selectDate,
                    icon: const Icon(Icons.calendar_month_sharp),
                    label: Text(
                      "${selectedDate.toLocal()}".split(' ')[0],
                    ),
                  ),
                ),
                const SizedBox(
                  width: 12,
                ),
                ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                        vertical: 12, horizontal: 12),
                    foregroundColor: Theme.of(context).colorScheme.tertiary,
                    side: BorderSide(
                      color: Theme.of(context).colorScheme.tertiary,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onPressed: _selectTime,
                  icon: const Icon(Icons.alarm),
                  label: Text(
                    selectedTime.format(context),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Text(
              "Dibuat untuk",
              style: Theme.of(context).textTheme.labelLarge,
            ),
            const SizedBox(height: 5),
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
              items: childList.map<DropdownMenuItem<String>>(
                (Child child) {
                  return DropdownMenuItem<String>(
                    value: child.fullName,
                    child: Text(
                      child.fullName,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  );
                },
              ).toList(),
              onChanged: (value) {
                setState(() {
                  _selectedValue = value;
                  print(_selectedValue);
                });
              },
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              "Koin yang didapat",
              style: Theme.of(context).textTheme.labelLarge,
            ),
            const SizedBox(height: 5),
            OutlinedTextFormField(
              controller: _priceController,
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 10),
            Text(
              "Deskripsi tugas",
              style: Theme.of(context).textTheme.labelLarge,
            ),
            const SizedBox(height: 5),
            OutlinedTextFormField(
              controller: _descriptionController,
              maxLines: 3,
            ),
            const SizedBox(height: 12),
            Center(
              child: ModalButton(
                onPressed: () {
                  print("IN CALLBACK");
                  print(_selectedValue);

                  Navigator.of(context).pop(
                    Task(
                      title: _titleController.text,
                      childName: _selectedValue!,
                      description: _descriptionController.text,
                      reward: int.parse(_priceController.text),
                      status: TaskStatus.notYet,
                      deadline: DateTime(
                        selectedDate.year,
                        selectedDate.month,
                        selectedDate.day,
                        selectedTime.hour,
                        selectedTime.minute,
                      ),
                    ),
                  );
                },
                label: "TAMBAH TUGAS",
              ),
            )
          ],
        ),
      ),
    );
  }
}
