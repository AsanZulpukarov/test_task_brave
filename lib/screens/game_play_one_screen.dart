import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'package:test_task_brave/bloc/game_play_one_bloc.dart';
import 'package:test_task_brave/widgets/appbar_widget.dart';
import 'package:test_task_brave/screens/matrix_screen.dart';
import 'package:test_task_brave/widgets/navbar_widget.dart';

class GamePlayOneScreen extends StatefulWidget {
  const GamePlayOneScreen({super.key});

  @override
  State<GamePlayOneScreen> createState() => _GamePlayOneScreenState();
}

class _GamePlayOneScreenState extends State<GamePlayOneScreen> {
  @override
  Widget build(BuildContext context) {
    final bloc = GamePlayOneBloc();
    return BlocProvider(
      create: (context) => bloc,
      child: Scaffold(
        body: Container(
          padding: const EdgeInsets.all(20),
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color.fromRGBO(0, 196, 196, 1),
                Color.fromRGBO(0, 102, 197, 1),
              ],
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(height: 20.h),
              const AppBarWidget(),
              SizedBox(height: 10.h),
              MatrixScreen(),
              SizedBox(height: 10.h),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      BlocBuilder<GamePlayOneBloc, GamePlayOneState>(
                        builder: (context, state) {
                          return Text(
                            state.totalCoin.toString(),
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 24.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          );
                        },
                      ),
                      Image.asset(
                        'assets/icons/coins.png',
                        width: 32.w,
                        height: 32.h,
                      ),
                    ],
                  ),
                  GradientText(
                    'Total balance',
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                    colors: [
                      Color.fromRGBO(189, 233, 233, 1),
                      Color.fromRGBO(161, 217, 217, 1),
                    ],
                  )
                ],
              ),
            ],
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: const NavBarWidget(),
      ),
    );
  }
}
