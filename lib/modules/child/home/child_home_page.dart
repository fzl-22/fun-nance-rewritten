import 'package:flutter/material.dart';
import 'package:fun_nance_rewritten/modules/child/notification/child_notification_page.dart';
import 'package:fun_nance_rewritten/modules/child/reward/child_reward_page.dart';
import 'package:fun_nance_rewritten/modules/child/task/child_task_page.dart';
import 'package:unicons/unicons.dart';

class ChildHomePage extends StatefulWidget {
  const ChildHomePage({super.key});

  @override
  State<ChildHomePage> createState() => _ChildHomePageState();
}

class _ChildHomePageState extends State<ChildHomePage> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    const ChildTaskPage(),
    const ChildRewardPage(),
    const ChildNotificationPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(UniconsLine.clipboard_notes),
            label: 'Tugas',
          ),
          BottomNavigationBarItem(
            icon: Icon(UniconsLine.gift),
            label: 'Hadiah',
          ),
          BottomNavigationBarItem(
            icon: Icon(UniconsLine.bell),
            label: 'Notifikasi',
          ),
        ],
      ),
    );
  }
}
