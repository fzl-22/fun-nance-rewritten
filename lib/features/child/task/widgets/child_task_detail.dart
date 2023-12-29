import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fun_nance_rewritten/core/models/task.dart';
import 'package:fun_nance_rewritten/core/providers/task_provider.dart';
import 'package:fun_nance_rewritten/core/providers/time_provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

class ChildTaskDetail extends ConsumerStatefulWidget {
  final Task task;
  const ChildTaskDetail({super.key, required this.task});

  @override
  ConsumerState<ChildTaskDetail> createState() => _ChildTaskDetailState();
}

class _ChildTaskDetailState extends ConsumerState<ChildTaskDetail> {
  File? _imageFile;
  String? _imageFileName;

  final picker = ImagePicker();
  Future<void> _getImageFromCamera() async {
    final pickedFile = await picker.pickImage(
      source: ImageSource.camera,
    );

    setState(() {
      if (pickedFile != null) {
        _imageFile = File(pickedFile.path);
        _imageFileName = _imageFile!.path.split('/').last;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final timeNow = ref.watch(timeProvider);

    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        gradient: LinearGradient(
          colors: [
            widget.task.statusColor.withOpacity(0.05),
            Colors.white,
          ],
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
        ),
      ),
      height: 0.6 * MediaQuery.of(context).size.height,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            Card(
              color: Colors.white,
              shadowColor: widget.task.statusColor,
              elevation: 8,
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: Colors.white,
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          widget.task.title,
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium!
                              .copyWith(fontSize: 18),
                        ),
                        Text(
                          widget.task.reward.toString(),
                          style: GoogleFonts.poppins(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color: const Color.fromARGB(255, 34, 166, 153),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          widget.task.deadline
                              .difference(timeNow)
                              .toString()
                              .split(":")
                              .getRange(0, 2)
                              .join(":"),
                          style:
                              Theme.of(context).textTheme.titleLarge!.copyWith(
                                    color: widget.task.statusColor,
                                  ),
                        ),
                        const SizedBox(width: 8),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Menit",
                              style: GoogleFonts.poppins(
                                fontSize: 10,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                            Text(
                              "Tersisa",
                              style: GoogleFonts.poppins(
                                fontSize: 10,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ],
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(height: 12),
            Text(
              "Deskripsi Tugas",
              style: Theme.of(context)
                  .textTheme
                  .labelLarge!
                  .copyWith(color: Colors.black),
            ),
            const SizedBox(height: 12),
            Text(
              widget.task.description,
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(color: Colors.black),
            ),
            const SizedBox(height: 24),
            if (_imageFile != null) ...[
              Card(
                margin: const EdgeInsets.all(0),
                elevation: 4,
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(12),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.image_outlined,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        "${_imageFileName!.substring(0, 17)}.jpg",
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                        overflow: TextOverflow.clip,
                      ),
                      const Spacer(),
                      Icon(
                        Icons.edit_rounded,
                        color: Colors.green[400],
                      ),
                      const SizedBox(width: 8),
                      Icon(
                        Icons.delete,
                        color: Colors.red[400],
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 12,
              )
            ],
            if (_imageFile == null)
              InkWell(
                onTap: _getImageFromCamera,
                child: Card(
                  margin: const EdgeInsets.all(0),
                  elevation: 4,
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(12),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.add_circle_outline,
                          color: Colors.red,
                        ),
                        const SizedBox(width: 8),
                        Text(
                          "Tambah bukti",
                          style:
                              Theme.of(context).textTheme.bodySmall!.copyWith(
                                    fontWeight: FontWeight.bold,
                                  ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            if (widget.task.status == TaskStatus.notYet) ...[
              const Spacer(),
              Container(
                width: double.infinity,
                height: 64,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  gradient: const LinearGradient(
                    colors: [
                      Color.fromARGB(255, 246, 100, 144),
                      Color.fromARGB(255, 243, 21, 89),
                    ], // Your gradient colors
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                  ),
                ),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.transparent,
                      shadowColor: Colors.transparent,
                      foregroundColor: Colors.white),
                  onPressed: () {
                    setState(() {
                      ref
                          .watch(taskListProvider.notifier)
                          .editTask(widget.task.title);
                    });
                    Navigator.of(context).pop();
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text("SELESAIKAN TUGAS"),
                      Image.asset('assets/icons/taking_photo.png')
                    ],
                  ),
                ),
              )
            ]
          ],
        ),
      ),
    );
  }
}
