import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:pomoflow/app/ui/theme/app_color_extensions.dart';

class GradientBackgroundWidget extends StatelessWidget {
  final PreferredSizeWidget? appBar;
  final Widget? leading;
  final Widget child;
  final Widget? bottomNavigationBar;

  const GradientBackgroundWidget({
    super.key,
    this.appBar,
    this.leading,
    required this.child,
    this.bottomNavigationBar,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final customColors = theme.extension<AppColorExtensions>()!;

    return Container(
      color: theme.scaffoldBackgroundColor,
      child: Stack(
        fit: StackFit.expand,
        children: [
          Positioned(
            top: -100,
            left: -150,
            child: _buildColorBlob(color: customColors.gradientTertiary!, height: 300, width: 300),
          ),
          Positioned(
            top: -150,
            right: -150,
            child: _buildColorBlob(color: customColors.gradientPrimary!, height: 350, width: 350),
          ),
          Positioned(
            bottom: -50,
            left: -20,
            child: _buildColorBlob(color: customColors.gradientSecondary!, height: 250, width: 250),
          ),
          Positioned(
            bottom: -180,
            right: -100,
            child: _buildColorBlob(
              color: customColors.gradientPrimary!.withValues(alpha: 0.8),
              height: 300,
              width: 300,
            ),
          ),
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 100.0, sigmaY: 100.0),
            child: Container(decoration: BoxDecoration(color: Colors.black.withValues(alpha: 0.0))),
          ),
          Scaffold(
            backgroundColor: Colors.transparent,
            appBar: appBar,
            drawer: leading,
            body: child,
            bottomNavigationBar: bottomNavigationBar,
          ),
        ],
      ),
    );
  }

  Widget _buildColorBlob({required Color color, required double height, required double width}) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(color: color, shape: BoxShape.circle),
    );
  }
}
