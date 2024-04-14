import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_task_brave/bloc/game_play_one_bloc.dart';
import 'package:test_task_brave/enum/cell_type_enum.dart';
import 'package:test_task_brave/widgets/bonus_image_widget.dart';
import 'package:test_task_brave/widgets/box_item.dart';

class MatrixScreen extends StatefulWidget {
  const MatrixScreen({super.key});

  @override
  State<MatrixScreen> createState() => _MatrixScreenState();
}

class _MatrixScreenState extends State<MatrixScreen> {
  int currentIndex = 0;
  int columnIndex = 1;
  int rowIndex = 1;
  final double _maxSize = 56;
  final int columnCount = 10;
  final int rowCount = 6;

  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<GamePlayOneBloc>(context);
    currentIndex = bloc.currentIndex;
    rowIndex = (currentIndex % 6) + 1;
    columnIndex = currentIndex ~/ 6.0 + 1;
    return BlocBuilder<GamePlayOneBloc, GamePlayOneState>(
      builder: (context, state) {
        return Container(
          width: _maxSize * rowCount,
          height: _maxSize * columnCount,
          alignment: Alignment.center,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                'assets/background/background_1.png',
              ),
              fit: BoxFit.fill,
            ),
          ),
          child: Stack(
            children: [
              GridView.builder(
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 6,
                ),
                itemCount: rowCount * columnCount,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      if (index - 1 == currentIndex ||
                          index + 1 == currentIndex ||
                          currentIndex + rowCount == index ||
                          currentIndex - rowCount == index) {
                        showDialog(
                          context: context,
                          barrierColor: const Color.fromRGBO(95, 95, 95, 0.4),
                          builder: (context) {
                            bloc.add(GamePlayOneShowBonusEvent(index: index));
                            return AlertDialog(
                              backgroundColor: Colors.transparent,
                              alignment: Alignment.center,
                              content: BonusImageWidget(
                                bonusImage: BonusImage.gold,
                              ),
                            );
                          },
                        );
                        setState(() {
                          currentIndex = index;
                          bloc.add(GamePlayOneMoveEvent(index: index));
                        });
                      }
                    },
                    child: BoxItem(
                      isPerson: index == currentIndex,
                      index: index,
                    ),
                  );
                },
              ),
              if (rowIndex != rowCount)
                Positioned(
                  left: _maxSize * rowIndex - 6,
                  top: _maxSize * columnIndex - 44,
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        currentIndex++;
                      });
                    },
                    child: _imageWithRotate(
                      quarterTurns: 1,
                      alignmentImage: Alignment.centerLeft,
                    ),
                  ),
                ),
              if (columnIndex != columnCount)
                Positioned(
                  left: _maxSize * rowIndex - 44,
                  top: _maxSize * columnIndex - 6,
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        currentIndex += rowCount;
                      });
                    },
                    child: _imageWithRotate(
                      quarterTurns: 2,
                      alignmentImage: Alignment.topCenter,
                    ),
                  ),
                ),
              if (rowIndex != 1)
                Positioned(
                  left: _maxSize * (rowIndex - 1) - 24,
                  top: _maxSize * columnIndex - 44,
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        currentIndex--;
                      });
                    },
                    child: _imageWithRotate(
                      quarterTurns: 3,
                      alignmentImage: Alignment.centerRight,
                    ),
                  ),
                ),
              if (columnIndex != 1)
                Positioned(
                  left: _maxSize * rowIndex - 44,
                  top: _maxSize * (columnIndex - 1) - 24,
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        currentIndex -= rowCount;
                      });
                    },
                    child: _imageWithRotate(
                      quarterTurns: 4,
                      alignmentImage: Alignment.bottomCenter,
                    ),
                  ),
                ),
            ],
          ),
        );
      },
    );
  }

  RotatedBox _imageWithRotate({
    required int quarterTurns,
    required Alignment alignmentImage,
  }) {
    return RotatedBox(
      quarterTurns: quarterTurns,
      child: Image.asset(
        'assets/icons/arrow.png',
        width: 30,
        height: 30,
        alignment: alignmentImage,
      ),
    );
  }
}