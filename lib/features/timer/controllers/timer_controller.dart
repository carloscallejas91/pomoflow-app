import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pomoflow/app/data/enums/enums.dart';
import 'package:pomoflow/app/services/snack_bar_service.dart';
import 'package:pomoflow/features/timer/widgets/skip_confirmation_dialog.dart';

class TimerController extends GetxController {
  // Utils
  final SnackBarService snackBarService = Get.find();

  // Controllers
  final taskNameController = TextEditingController();

  // Duration Config
  final Duration focusDuration = const Duration(minutes: 25);
  final Duration shortBreakDuration = const Duration(minutes: 5);
  final Duration longBreakDuration = const Duration(minutes: 15);

  // Cycle State
  final Rx<CycleType> currentCycle = CycleType.focus.obs;
  final RxInt completedCycles = 0.obs;
  final int cyclesBeforeLongBreak = 4;

  // Timer State
  final Rx<TimerState> timerState = TimerState.stopped.obs;
  final Rx<Duration> totalDuration = const Duration(minutes: 25).obs;
  final Rx<Duration> remainingTime = const Duration(minutes: 25).obs;
  final RxDouble progress = 0.0.obs;
  final RxString timeStr = "25:00".obs;

  // Timer
  Timer? _timer;

  @override
  void onInit() {
    super.onInit();

    ever(remainingTime, _updateUI);

    _startNewCycle(CycleType.focus);
  }

  @override
  void onClose() {
    _timer?.cancel();

    taskNameController.dispose();

    super.onClose();
  }

  void toggleTimer() {
    if (timerState.value == TimerState.running) {
      _stopTimer();
    } else {
      _startTimer();
    }
  }

  void _startTimer() {
    if (!_isTaskValid()) return;

    timerState.value = TimerState.running;

    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (remainingTime.value.inSeconds > 0) {
        remainingTime.value -= const Duration(seconds: 1);
      } else {
        _cycleFinished();
      }
    });
  }

  void _stopTimer() {
    _timer?.cancel();

    timerState.value = TimerState.stopped;
  }

  void resetCurrentCycle() {
    _timer?.cancel();

    timerState.value = TimerState.stopped;

    remainingTime.value = totalDuration.value;
  }

  void skipToNextCycle() {
    _cycleFinished();
  }

  void _cycleFinished() {
    _stopTimer();

    _showCycleSuccess();

    _updateStateAfterCycle();

    _defineNewCycle();
  }

  void _updateStateAfterCycle() {
    if (currentCycle.value == CycleType.focus) {
      completedCycles.value++;

      // TODO: Salvar tarefa concluída no histórico
    }
  }

  void _defineNewCycle() {
    if (currentCycle.value == CycleType.focus) {
      if (completedCycles.value % cyclesBeforeLongBreak == 0) {
        _startNewCycle(CycleType.longBreak);
      } else {
        _startNewCycle(CycleType.shortBreak);
      }
    } else {
      _startNewCycle(CycleType.focus);
    }
  }

  void _startNewCycle(CycleType cycle, {bool autoStart = false}) {
    currentCycle.value = cycle;

    switch (cycle) {
      case CycleType.focus:
        totalDuration.value = focusDuration;
        break;
      case CycleType.shortBreak:
        totalDuration.value = shortBreakDuration;
        break;
      case CycleType.longBreak:
        totalDuration.value = longBreakDuration;
        break;
    }

    remainingTime.value = totalDuration.value;

    if (autoStart) _startTimer();
  }

  void _updateUI(Duration time) {
    final totalSeconds = totalDuration.value.inSeconds;
    final elapsedSeconds = totalSeconds - time.inSeconds;

    progress.value = totalSeconds > 0 ? elapsedSeconds / totalSeconds : 0;
    timeStr.value = _formatDuration(time);
  }

  String _formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));
    return "$minutes:$seconds";
  }

  void showSkipConfirmationDialog() {
    if (taskNameController.text.isEmpty) {
      snackBarService.showWarning(title: 'Aviso', message: 'Nenhuma tarefa em andamento.');
      return;
    }

    Get.dialog(SkipConfirmationDialog(controller: this));
  }

  void _showCycleSuccess() {
    snackBarService.showSuccess(
      title: 'Ciclo Concluído!',
      message: currentCycle.value == CycleType.focus
          ? 'Hora de uma pequena pausa.'
          : 'A pausa acabou. Hora de focar!',
    );
  }


  bool _isTaskValid() {
    if (taskNameController.text.trim().isEmpty) {
      snackBarService.showWarning(
        title: 'Tarefa vazia',
        message: 'Por favor, dê um nome à sua tarefa antes de iniciar.',
      );
      return false;
    }

    return true;
  }
}
