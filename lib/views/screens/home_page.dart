import 'package:flutter/material.dart';
import 'package:homework_48/providers/settings_notifier.dart';
import 'package:homework_48/views/screens/settings_page.dart';
import 'package:homework_48/views/widgets/drawer_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

const List<String> dropList = ["uz", "en", "ru"];

class _HomePageState extends State<HomePage> {
  String languageValue = dropList.first;
  @override
  Widget build(BuildContext context) {
    final settingsNotifier = SettingsNotifier.of(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Home Screen"),
        backgroundColor: Colors.amber,
        actions: [
          DropdownButton(
            value: languageValue,
            items: dropList.map<DropdownMenuItem<String>>(
              (value) {
                return DropdownMenuItem(value: value, child: Text(value));
              },
            ).toList(),
            onChanged: (value) {
              setState(() {
                languageValue = value!;
              });
            },
          ),
        ],
      ),
      drawer: const DrawerWidget(),
      body: Padding(
        padding: EdgeInsets.all(15.0),
        child: Column(
          children: [
            Text(
              "Amet nostrud ipsum consectetur labore incididunt dolor velit cupidatat in deserunt consequat incididunt culpa magna. Incididunt officia excepteur enim occaecat adipisicing est elit officia. Tempor cillum cupidatat duis in ullamco duis. Cillum irure quis Lorem exercitation nostrud culpa. Non cupidatat fugiat mollit in sit magna sint aute fugiat. Enim ad adipisicing quis laboris et ullamco ut esse ad proident. Labore duis voluptate aute tempor ut ut ipsum.",
              style: TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.w500,
                  fontSize: settingsNotifier.sizeText.size),
            ),
          ],
        ),
      ),
    );
  }
}
