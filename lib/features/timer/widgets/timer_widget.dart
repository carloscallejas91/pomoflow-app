import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pomoflow/app/ui/widgets/gradient_text_widget.dart';
import 'package:pomoflow/features/timer/controllers/timer_controller.dart';

class TimerWidget extends StatelessWidget {
  final TimerController controller;

  const TimerWidget({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final timerSize = math.min(screenWidth * 0.75, 400.0);
    final fontSize = timerSize * 0.3;

    final theme = Theme.of(context);

    return SizedBox(
      width: timerSize,
      height: timerSize,
      child: Stack(
        fit: StackFit.expand,
        children: [
          Obx(
            () => CircularProgressIndicator(
              value: controller.progress.value,
              strokeWidth: 18,
              color: theme.colorScheme.primary,
              backgroundColor: theme.colorScheme.surface,
              strokeCap: StrokeCap.round,
            ),
          ),
          Obx(
            () => Center(
              child: GradientTextWidget(
                gradientText: controller.timeStr.value,
                style: theme.textTheme.displayLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                  fontSize: fontSize,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
