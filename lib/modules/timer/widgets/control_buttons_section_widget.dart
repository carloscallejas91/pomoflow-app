import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ControlButtonsSectionWidget extends StatelessWidget {
  final bool isRunning;
  final VoidCallback onPauseOrStartPressed;
  final VoidCallback onSkipPressed;
  final VoidCallback onSettingsPressed;
  final String startLabel;
  final String pauseLabel;
  final IconData settingsIcon;
  final IconData skipIcon;

  const ControlButtonsSectionWidget({
    super.key,
    required this.isRunning,
    required this.onPauseOrStartPressed,
    required this.onSkipPressed,
    required this.onSettingsPressed,
    this.startLabel = 'Iniciar',
    this.pauseLabel = 'Pausar',
    this.settingsIcon = Icons.settings_suggest_rounded,
    this.skipIcon = Icons.skip_next_rounded,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 8,
      children: [
        ElevatedButton(
          onPressed: onSettingsPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: Get.theme.colorScheme.tertiary,
          ),
          child: Icon(settingsIcon),
        ),
        Flexible(
          fit: FlexFit.tight,
          child: ElevatedButton(
            onPressed: onPauseOrStartPressed,
            style: ElevatedButton.styleFrom(
              backgroundColor: isRunning
                  ? Get.theme.colorScheme.error
                  : Get.theme.colorScheme.primary,
            ),
            child: Text(isRunning ? pauseLabel : startLabel),
          ),
        ),
        ElevatedButton(
          onPressed: onSkipPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: Get.theme.colorScheme.secondary,
          ),
          child: Icon(skipIcon),
        ),
      ],
    );
  }
}
