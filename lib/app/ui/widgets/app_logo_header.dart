import 'package:flutter/material.dart';
import 'package:pomoflow/app/ui/constants/app_assets.dart';

class AppLogoHeader extends StatelessWidget {
  const AppLogoHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(AppAssets.logo, height: 45);
  }
}
