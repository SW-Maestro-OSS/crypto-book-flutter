import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:presentation/theme/theme_mode_provider.dart';

class SettingView extends ConsumerWidget {
  const SettingView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeModeProvider);

    return Column(
      children: [
        AppBar(
          title: const Text('Settings'),
        ),
        Expanded(
          child: ListView(
            children: [
              const ListTile(
                title: Text('Currency'),
                subtitle: Text('USD (기본값)'),
                trailing: Icon(Icons.chevron_right),
              ),
              const Divider(),
              ListTile(
                title: const Text('Theme'),
                subtitle: Text(_getThemeModeLabel(themeMode)),
                trailing: const Icon(Icons.chevron_right),
                onTap: () => _showThemePicker(context, ref),
              ),
              const Divider(),
              const ListTile(
                title: Text('Language'),
                subtitle: Text('English (기본값)'),
                trailing: Icon(Icons.chevron_right),
              ),
              const Divider(),
              ListTile(
                title: const Text('About'),
                subtitle: const Text('Coin Viewer v1.0.0'),
                onTap: () {
                  // TODO: About 다이얼로그
                },
              ),
            ],
          ),
        ),
      ],
    );
  }

  String _getThemeModeLabel(ThemeMode mode) {
    switch (mode) {
      case ThemeMode.light:
        return 'Light';
      case ThemeMode.dark:
        return 'Dark';
      case ThemeMode.system:
        return 'System Default';
    }
  }

  void _showThemePicker(BuildContext context, WidgetRef ref) {
    showModalBottomSheet(
      context: context,
      builder: (context) => Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            title: const Text('Light'),
            leading: const Icon(Icons.light_mode),
            onTap: () {
              ref
                  .read(themeModeProvider.notifier)
                  .setThemeMode(ThemeMode.light);
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: const Text('Dark'),
            leading: const Icon(Icons.dark_mode),
            onTap: () {
              ref
                  .read(themeModeProvider.notifier)
                  .setThemeMode(ThemeMode.dark);
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: const Text('System Default'),
            leading: const Icon(Icons.brightness_auto),
            onTap: () {
              ref
                  .read(themeModeProvider.notifier)
                  .setThemeMode(ThemeMode.system);
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
