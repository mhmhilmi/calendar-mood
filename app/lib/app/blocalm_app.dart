import 'package:flutter/material.dart';

import '../features/dashboard/dashboard_placeholder.dart';
import '../theme/app_theme.dart';
import 'app_config.dart';

class BlocalmApp extends StatelessWidget {
  const BlocalmApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Blocalm',
      debugShowCheckedModeBanner: false,
      theme: buildBlocalmTheme(),
      home: DashboardPlaceholder(config: AppConfig.current),
    );
  }
}

