import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pomoflow/app/data/enums/enums.dart';

class CycleIndicatorsWidget extends StatelessWidget {
  final CycleType currentCycle;
  final String focusLabel;
  final String shortBreakLabel;
  final String longBreakLabel;

  const CycleIndicatorsWidget({
    super.key,
    required this.currentCycle,
    this.focusLabel = 'Foco',
    this.shortBreakLabel = 'Descanso Curto',
    this.longBreakLabel = 'Descanso Longo',
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildIndicatorChip(focusLabel, CycleType.focus),
        _buildIndicatorChip(shortBreakLabel, CycleType.shortBreak),
        _buildIndicatorChip(longBreakLabel, CycleType.longBreak),
      ],
    );
  }

  Widget _buildIndicatorChip(String label, CycleType cycleType) {
    final bool isActive = currentCycle == cycleType;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: isActive
            ? Get.theme.colorScheme.primary.withValues(alpha: 0.2)
            : Get.theme.colorScheme.surface,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: isActive ? Get.theme.colorScheme.primary : Colors.transparent,
          width: 1.5,
        ),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: isActive
              ? Get.theme.colorScheme.primary
              : Get.theme.textTheme.bodyLarge?.color,
          fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
        ),
      ),
    );
  }
}
