import 'package:flutter/material.dart';
import 'package:fun_nance_rewritten/modules/parent/child/parent_child_page.dart';
import 'package:fun_nance_rewritten/modules/parent/notification/parent_notification_page.dart';
import 'package:fun_nance_rewritten/modules/parent/reward/parent_reward_page.dart';
import 'package:fun_nance_rewritten/modules/parent/task/parent_task_page.dart';
import 'package:unicons/unicons.dart';

class ParentHomePage extends StatefulWidget {
  const ParentHomePage({super.key});

  @override
  State<ParentHomePage> createState() => _ParentHomePageState();
}

class _ParentHomePageState extends State<ParentHomePage> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    const ParentChildPage(),
    const ParentRewardPage(),
    const ParentTaskPage(),
    const ParentNotificationPage(),
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
            icon: Icon(UniconsLine.users_alt),
            label: 'Anak',
          ),
          BottomNavigationBarItem(
            icon: Icon(UniconsLine.gift),
            label: 'Hadiah',
          ),
          BottomNavigationBarItem(
            icon: Icon(UniconsLine.clipboard_notes),
            label: 'Tugas',
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
