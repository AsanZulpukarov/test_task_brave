import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SelectCaseWidget extends StatelessWidget {
  final bool isLucky;

  const SelectCaseWidget({super.key, required this.isLucky});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300,
      height: 400,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              GestureDetector(
                  onTap: () {
                  },
                  child: Image.asset(
                    'assets/images/cases/${isLucky ? "close_case" : "dark_close_case"}.png',
                    width: 130,
                    height: 130,
                  )),
              GestureDetector(
                  onTap: () {},
                  child: Image.asset(
                    'assets/images/cases/${isLucky ? "close_case" : "dark_close_case"}.png',
                    width: 130,
                    height: 130,
                  )),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            isLucky ? "Try your luck" : "Unlucky coin",
            style: TextStyle(
              color: const Color.fromRGBO(213, 175, 0, 1),
              fontSize: 28.sp,
              fontWeight: FontWeight.w700,
            ),
          ),
          Text(
            "TChoose a chest!",
            style: TextStyle(
              color: Colors.white,
              fontSize: 28.sp,
              fontWeight: FontWeight.w700,
            ),
          )
        ],
      ),
    );
  }
}
