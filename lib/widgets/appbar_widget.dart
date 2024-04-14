import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test_task_brave/bloc/game_play_one_bloc.dart';

class AppBarWidget extends StatelessWidget {
  const AppBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      color: Colors.transparent,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          IconButton(
            icon: const Icon(
              Icons.info_outline_rounded,
              color: Colors.white,
              size: 32,
            ),
            onPressed: () {},
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                BlocProvider.of<GamePlayOneBloc>(context)
                    .currentCoin
                    .toString(),
                style: TextStyle(
                  fontSize: 28.sp,
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Image.asset(
                'assets/icons/coin.png',
                height: 32.h,
                width: 32.w,
              ),
            ],
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.close,
              color: Colors.white,
              size: 32,
            ),
          ),
        ],
      ),
    );
  }
}
