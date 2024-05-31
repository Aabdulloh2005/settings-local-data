import 'package:flutter/material.dart';
import 'package:homework_48/data/local_data.dart';
import 'package:homework_48/providers/settings_notifier.dart';
import 'package:homework_48/viewmodels/settings_controller.dart';
import 'package:homework_48/views/screens/home_page.dart';

void main(List<String> args) {
  runApp(const MainRunner());
}

class MainRunner extends StatelessWidget {
  const MainRunner({super.key});

  @override
  Widget build(BuildContext context) {
    final settingsController = SettingsController(
        themeModeData: LocalData(), sizeTextData: LocalData());
    return FutureBuilder(
      future: settingsController.loadTheme(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        }
        return SettingsNotifier(
          settingsController: settingsController,
          child: Builder(builder: (context) {
            return ListenableBuilder(
              listenable: settingsController,
              builder: (context, child) {
                return MaterialApp(
                  darkTheme: ThemeData.dark(useMaterial3: true),
                  themeMode: settingsController.appTheme.themeMode,
                  home: const HomePage(),
                );
              },
            );
          }),
        );
      },
    );
  }
}
