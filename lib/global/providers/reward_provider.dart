import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fun_nance_rewritten/global/data/reward_data.dart';
import 'package:fun_nance_rewritten/global/models/reward.dart';
import 'package:fun_nance_rewritten/global/services/firebase_service.dart';

class RewardListNotifier extends StateNotifier<List<Reward>> {
  RewardListNotifier() : super(rewardData);

  Future<List<Object?>> loadRewards() async {
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance.collection('rewards').get();
    final allData = querySnapshot.docs.map((doc) => doc.data()).toList();
    return allData;
  }

  void addReward(Reward reward) async {
    await firestoreAddReward(reward);
    state = [reward, ...state];
  }
}

final rewardListProvider =
    StateNotifierProvider<RewardListNotifier, List<Reward>>(
  (ref) => RewardListNotifier(),
);