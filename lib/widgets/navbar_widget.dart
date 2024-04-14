import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test_task_brave/widgets/navbar_item.dart';

class NavBarWidget extends StatelessWidget {
  const NavBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: 66.h,
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          NavBarItem(
            nameIcon: 'game',
            title: 'Game',
            isSelect: true,
          ),
          NavBarItem(
            nameIcon: 'store',
            title: 'Store',
            isSelect: false,
          ),
          NavBarItem(
            nameIcon: 'setting',
            title: 'Setting',
            isSelect: false,
          ),
        ],
      ),
    );
  }
}
