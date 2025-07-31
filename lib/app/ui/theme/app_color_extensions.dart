import 'package:flutter/material.dart';

@immutable
class AppColorExtensions extends ThemeExtension<AppColorExtensions> {
  const AppColorExtensions({
    required this.success,
    required this.onSuccess,
    required this.warning,
    required this.onWarning,
    required this.gradientPrimary,
    required this.gradientSecondary,
    required this.gradientTertiary,
  });

  final Color? success;
  final Color? onSuccess;
  final Color? warning;
  final Color? onWarning;
  final Color? gradientPrimary;
  final Color? gradientSecondary;
  final Color? gradientTertiary;

  @override
  AppColorExtensions copyWith({
    Color? success,
    Color? onSuccess,
    Color? warning,
    Color? onWarning,
    Color? gradientPrimary,
    Color? gradientSecondary,
    Color? gradientTertiary,
  }) {
    return AppColorExtensions(
      success: success ?? this.success,
      onSuccess: onSuccess ?? this.onSuccess,
      warning: warning ?? this.warning,
      onWarning: onWarning ?? this.onWarning,
      gradientPrimary: gradientPrimary ?? this.gradientPrimary,
      gradientSecondary: gradientSecondary ?? this.gradientSecondary,
      gradientTertiary: gradientTertiary ?? this.gradientTertiary,
    );
  }

  @override
  AppColorExtensions lerp(ThemeExtension<AppColorExtensions>? other, double t) {
    if (other is! AppColorExtensions) {
      return this;
    }
    return AppColorExtensions(
      success: Color.lerp(success, other.success, t),
      onSuccess: Color.lerp(onSuccess, other.onSuccess, t),
      warning: Color.lerp(warning, other.warning, t),
      onWarning: Color.lerp(onWarning, other.onWarning, t),
      gradientPrimary: Color.lerp(gradientPrimary, other.gradientPrimary, t),
      gradientSecondary: Color.lerp(gradientSecondary, other.gradientSecondary, t),
      gradientTertiary: Color.lerp(gradientTertiary, other.gradientTertiary, t),
    );
  }
}
