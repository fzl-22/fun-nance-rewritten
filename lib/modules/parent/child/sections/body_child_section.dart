import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fun_nance_rewritten/global/models/child.dart';
import 'package:fun_nance_rewritten/global/providers/child_provider.dart';
import 'package:fun_nance_rewritten/global/utils/form_util.dart';
import 'package:fun_nance_rewritten/global/widgets/buttons/tile_button.dart';
import 'package:fun_nance_rewritten/global/widgets/tiles/item_tile.dart';
import 'package:fun_nance_rewritten/modules/parent/child/parent_child_detail_page.dart';

class BodyChildSection extends ConsumerStatefulWidget {
  const BodyChildSection({
    super.key,
  });

  @override
  ConsumerState<BodyChildSection> createState() => _BodyChildSectionState();
}

class _BodyChildSectionState extends ConsumerState<BodyChildSection> {
  String _getFirstName(Child child) {
    return child.fullName.split(' ')[0];
  }

  @override
  Widget build(BuildContext context) {
    final childList = ref.watch(childListProvider);

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
