import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pomoflow/app/data/enums/enums.dart';
import 'package:pomoflow/features/timer/controllers/timer_controller.dart';

class CycleIndicatorsWidget extends StatelessWidget {
  final TimerController controller;

  const CycleIndicatorsWidget({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(Get.context!);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildIndicatorChip(controller, theme, 'Foco', CycleType.focus),
        _buildIndicatorChip(controller, theme, 'Descanso Curto', CycleType.shortBreak),
        _buildIndicatorChip(controller, theme, 'Descanso Longo', CycleType.longBreak),
      ],
    );
  }

  Widget _buildIndicatorChip(
    TimerController controller,
    ThemeData theme,
    String label,
    CycleType cycleType,
  ) {
    return Obx(() {
      final bool isActive = controller.currentCycle.value == cycleType;

      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: isActive
              ? theme.colorScheme.primary.withValues(alpha: 0.2)
              : theme.colorScheme.surface,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: isActive ? theme.colorScheme.primary : Colors.transparent,
            width: 1.5,
          ),
        ),
        child: Text(
          label,
          style: TextStyle(
            color: isActive ? theme.colorScheme.primary : theme.textTheme.bodyLarge?.color,
            fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
          ),
        ),
      );
    });
  }
}
