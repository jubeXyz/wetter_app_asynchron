import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 238, 232, 248),
          title: Text("Wetter App"),
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: Column(
              children: [
                Text(
                  "Stadt:",
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.blue,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text("Gefühlte Temperatur:"),
                SizedBox(
                  height: 10,
                ),
                Text("Temperatur:"),
                SizedBox(
                  height: 10,
                ),
                Text("Niederschlag:"),
                SizedBox(
                  height: 10,
                ),
                Text("Tageszeit:"),
                SizedBox(
                  height: 10,
                ),
                Text("Standort:"),
                SizedBox(
                  height: 10,
                ),
                OutlinedButton(
                    onPressed: () {}, child: Text("Vorhersage updaten"))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
