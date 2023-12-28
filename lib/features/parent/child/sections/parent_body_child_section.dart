import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fun_nance_rewritten/core/models/child.dart';
import 'package:fun_nance_rewritten/core/providers/child_provider.dart';
import 'package:fun_nance_rewritten/core/utils/form_util.dart';
import 'package:fun_nance_rewritten/core/widgets/buttons/tile_button.dart';
import 'package:fun_nance_rewritten/core/widgets/tiles/item_tile.dart';
import 'package:fun_nance_rewritten/features/parent/child/parent_child_detail_page.dart';

class ParentBodyChildSection extends ConsumerStatefulWidget {
  const ParentBodyChildSection({
    super.key,
  });

  @override
  ConsumerState<ParentBodyChildSection> createState() => _ParentBodyChildSectionState();
}

class _ParentBodyChildSectionState extends ConsumerState<ParentBodyChildSection> {
  String _getFirstName(Child child) {
    return child.fullName.split(' ')[0];
  }

  @override
  Widget build(BuildContext context) {
    final childList = ref.watch(childListProvider).where((child) => child.fullName != "Semua",).toList();

    return Expanded(
      child: Card(
        elevation: 0,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(24),
          ),
        ),
        margin: EdgeInsets.zero,
        child: Container(
          padding: const EdgeInsets.fromLTRB(24, 24, 24, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TileButton(
                title: "Tambahkan Anak",
                subtitle: "Total anak saat ini: ${childList.length}",
                onTap: () {
                  showAddChildForm(context, ref);
                },
              ),
              const SizedBox(height: 10),
              Text(
                "Menampilkan ${childList.length} anak:",
                style: Theme.of(context).textTheme.labelMedium,
              ),
              const SizedBox(height: 10),
              Expanded(
                child: ListView.separated(
                  padding: const EdgeInsets.all(0),
                  itemCount: childList.length,
                  itemBuilder: (context, index) {
                    return ItemTile(
                      index: index + 1,
                      title: childList[index].fullName,
                      subtitle:
                          "Klik untuk mengetahui performa ${_getFirstName(childList[index])}",
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) {
                              return ParentChildDetailPage(
                                child: childList[index],
                              );
                            },
                          ),
                        );
                      },
                    );
                  },
                  separatorBuilder: (context, index) {
                    return const SizedBox(height: 10);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
