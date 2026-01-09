import 'package:flutter/material.dart';
import 'package:pomoflow/app/ui/widgets/gradient_background_widget.dart';

class BasePageLayout extends StatelessWidget {
  final Widget child;

  const BasePageLayout({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return GradientBackgroundWidget(
      child: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: constraints.maxHeight),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24.0,
                  vertical: 32.0,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [child],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
