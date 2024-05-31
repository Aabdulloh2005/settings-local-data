import 'package:flutter/material.dart';
import 'package:homework_48/providers/settings_notifier.dart';
import 'package:homework_48/views/widgets/drawer_widget.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    final settingsNotifier = SettingsNotifier.of(context);
    return Scaffold(
      drawer: const DrawerWidget(),
      appBar: AppBar(
        backgroundColor: Colors.amber,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            ListenableBuilder(
              listenable: settingsNotifier,
              builder: (context, child) {
                return SwitchListTile(
                  title: Text(
                    "Dark mode",
                    style: TextStyle(fontSize: settingsNotifier.sizeText.size),
                  ),
                  value: settingsNotifier.appTheme.themeMode == ThemeMode.dark,
                  onChanged: (value) {
                    settingsNotifier.toggleTheme(value);
                  },
                );
              },
            ),
            
            ListenableBuilder(
              listenable: settingsNotifier,
              builder: (context, child) {
                return Slider(
                  value: settingsNotifier.sizeText.size,
                  min: 12,
                  max: 30,
                  divisions: 18,
                  label: settingsNotifier.sizeText.size.toString(),
                  onChanged: (value) async {
                    settingsNotifier.setSizeText(value);
                    await settingsNotifier.loadSizeText();
                    // setState(() {});
                  },
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
