import 'package:flutter/material.dart';

import '../../app/app_config.dart';

class DashboardPlaceholder extends StatelessWidget {
  const DashboardPlaceholder({
    required this.config,
    super.key,
  });

  final AppConfig config;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Blocalm'),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          final isWide = constraints.maxWidth >= 900;
          final content = [
            const _StatusCard(
              title: 'Local planner',
              body:
                  'Next: add Drift/SQLite tables for events, tasks, reminders, and privacy settings.',
              icon: Icons.calendar_today_outlined,
            ),
            _StatusCard(
              title: 'Backend API',
              body: 'Configured API base URL: ${config.apiBaseUrl}',
              icon: Icons.cloud_outlined,
            ),
            const _StatusCard(
              title: 'Shared scheduling',
              body:
                  'Next vertical slice: register, login, trusted contacts, and schedule requests.',
              icon: Icons.people_alt_outlined,
            ),
          ];

          return Padding(
            padding: const EdgeInsets.all(16),
            child: isWide
                ? Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: content
                        .map(
                          (child) => Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(right: 12),
                              child: child,
                            ),
                          ),
                        )
                        .toList(),
                  )
                : ListView.separated(
                    itemCount: content.length,
                    separatorBuilder: (_, __) => const SizedBox(height: 12),
                    itemBuilder: (_, index) => content[index],
                  ),
          );
        },
      ),
    );
  }
}

class _StatusCard extends StatelessWidget {
  const _StatusCard({
    required this.title,
    required this.body,
    required this.icon,
  });

  final String title;
  final String body;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(icon, color: theme.colorScheme.primary),
            const SizedBox(height: 14),
            Text(title, style: theme.textTheme.titleMedium),
            const SizedBox(height: 8),
            Text(body, style: theme.textTheme.bodyMedium),
          ],
        ),
      ),
    );
  }
}
