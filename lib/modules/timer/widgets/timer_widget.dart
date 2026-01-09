import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pomoflow/app/ui/widgets/gradient_text_widget.dart';

class TimerWidget extends StatelessWidget {
  final double progress;
  final String timeString;

  const TimerWidget({
    super.key,
    required this.progress,
    required this.timeString,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final timerSize = math.min(screenWidth * 0.75, 400.0);
    final fontSize = timerSize * 0.3;

    return SizedBox(
      width: timerSize,
      height: timerSize,
      child: Stack(
        fit: StackFit.expand,
        children: [
          CircularProgressIndicator(
            value: progress,
            strokeWidth: 18,
            color: Get.theme.colorScheme.primary,
            backgroundColor: Get.theme.colorScheme.surface,
            strokeCap: StrokeCap.round,
          ),
          Center(
            child: GradientTextWidget(
              gradientText: timeString,
              style: Get.theme.textTheme.displayLarge?.copyWith(
                fontWeight: FontWeight.bold,
                fontSize: fontSize,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
