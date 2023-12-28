import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fun_nance_rewritten/core/models/child.dart';
import 'package:fun_nance_rewritten/core/providers/child_provider.dart';
import 'package:fun_nance_rewritten/core/providers/reward_provider.dart';
import 'package:fun_nance_rewritten/core/utils/form_util.dart';
import 'package:fun_nance_rewritten/core/widgets/buttons/tile_button.dart';
import 'package:fun_nance_rewritten/core/widgets/tiles/item_tile.dart';

class ParentBodyRewardSection extends ConsumerStatefulWidget {
  const ParentBodyRewardSection({
    super.key,
  });

  @override
  ConsumerState<ParentBodyRewardSection> createState() =>
      _ParentBodyRewardSectionState();
}

class _ParentBodyRewardSectionState
    extends ConsumerState<ParentBodyRewardSection> {
  String _getFirstName(Child child) {
    String fullName = child.fullName;
    if(fullName == "Semua"){
      fullName = fullName.toLowerCase();
    }
    return fullName.split(' ')[0];
  }

  @override
  Widget build(BuildContext context) {
    final rewardList = ref.watch(rewardListProvider);
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
                title: "Tambahkan Hadiah",
                subtitle: "Total hadiah saat ini: ${rewardList.length}",
                onTap: () {
                  showAddRewardForm(context, ref);
                },
              ),
              const SizedBox(height: 10),
              Expanded(
                child: ListView(
                  children: [
                    for (Child child in childList) ...[
                      Text(
                        "Hadiah khusus untuk ${_getFirstName(child)}",
                        style: Theme.of(context).textTheme.labelSmall,
                      ),
                      const SizedBox(height: 10),
                      Column(
                        children: List<Widget>.generate(
                          rewardList
                              .where((reward) =>
                                  reward.childName == child.fullName)
                              .toList()
                              .length,
                          (index) {
                            final reward = rewardList
                                .where((reward) =>
                                    reward.childName == child.fullName)
                                .toList()[index];
                            return Padding(
                              padding: const EdgeInsets.only(bottom: 10),
                              child: ItemTile(
                                index: index + 1,
                                title: reward.title,
                                subtitle:
                                    "*klik untuk melihat detail atau mengedit",
                                onTap: () {
                                  // _showEditRewardForm(context, reward);
                                },
                              ),
                            );
                          },
                        ),
                      ),
                    ]
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
