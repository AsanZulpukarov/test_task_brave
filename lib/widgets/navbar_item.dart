import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NavBarItem extends StatelessWidget {
  final String title;
  final String nameIcon;
  final bool isSelect;
  const NavBarItem({
    super.key,
    required this.nameIcon,
    required this.title,
    required this.isSelect,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: () {},
      child: Column(
        children: [
          Image.asset(
            'assets/icons/$nameIcon.png',
            width: 32.w,
            height: 32.h,
            color: isSelect ? Colors.white : Colors.grey,
          ),
          Text(
            title,
            style: TextStyle(
              color: isSelect ? Colors.white : Colors.grey,
              fontSize: 12.sp,
            ),
          ),
        ],
      ),
    );
  }
}
