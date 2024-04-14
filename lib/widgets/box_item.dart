import 'package:flutter/material.dart';

class BoxItem extends StatelessWidget {
  final bool isPerson;
  final bool isClose;
  const BoxItem({
    super.key,
    required this.isPerson,
    this.isClose = true,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/wing.png'),
        ),
      ),
      child: isPerson
          ? Image.asset(
              'assets/images/character_mike.png',
            )
          : const SizedBox(),
    );
  }
}
