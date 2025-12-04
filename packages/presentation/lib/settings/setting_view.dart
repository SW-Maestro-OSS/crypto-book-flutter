import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SettingView extends ConsumerWidget {
  const SettingView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
}
