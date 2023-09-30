import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fun_nance_rewritten/global/providers/reward_provider.dart';
import 'package:fun_nance_rewritten/modules/child/reward/widgets/reward_card.dart';

class ChildBodyRewardSection extends ConsumerWidget {
  const ChildBodyRewardSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final rewardList = ref
        .watch(rewardListProvider)
        .where(
          (reward) =>
              reward.childName == "Ahmad Mu'min Faisal" ||
              reward.childName == "Semua",
        )
        .toList();
    return Expanded(
      child: Container(
        padding: const EdgeInsets.fromLTRB(24, 24, 24, 0),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(16),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              "Menampilkan ${rewardList.length} hadiah",
              style: Theme.of(context).textTheme.labelLarge!.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
            ),
            const SizedBox(height: 24),
            Expanded(
              child: ListView.separated(
                itemBuilder: (context, index) {
                  return RewardCard(reward: rewardList[index]);
                },
                separatorBuilder: (context, index) {
                  return const SizedBox(height: 20);
                },
                itemCount: rewardList.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
