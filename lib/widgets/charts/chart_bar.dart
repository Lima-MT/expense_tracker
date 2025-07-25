import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  const ChartBar({super.key, required this.fill});

  final double fill;

  @override
  Widget build(BuildContext context) {
    final isDarkMode =
        MediaQuery.of(context).platformBrightness == Brightness.dark;

    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4),
        child: TweenAnimationBuilder<double>(
          tween: Tween(begin: 0, end: fill),
          duration: const Duration(milliseconds: 400),
          curve: Curves.easeOut,
          builder: (context, animatedFill, child) {
            return FractionallySizedBox(
              heightFactor: animatedFill,
              child: child,
            );
          },
          child: DecoratedBox(
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.vertical(top: Radius.circular(8)),
              color: isDarkMode
                  ? Theme.of(context).colorScheme.secondary
                  : Theme.of(context).colorScheme.primary,
            ),
          ),
        ),
      ),
    );
  }
}
