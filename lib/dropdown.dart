import 'package:flutter/material.dart';

class DropdownPage extends StatefulWidget {
  @override
  _DropdownPageState createState() => _DropdownPageState();
}

class _DropdownPageState extends State<DropdownPage> {
  var list = ['Full body', 'Upper body', 'AB workout'];
  String selectedOption = 'Full body';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dropdown Page'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            DropdownButton<String>(
              value: selectedOption,
              icon: const Icon(Icons.keyboard_arrow_down),
              items: list.map((String item) {
                return DropdownMenuItem<String>(
                  value: item,
                  child: Text(item),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  selectedOption = newValue!;
                });
              },
            ),
            SizedBox(height: 20),
            Text(
              'Selected Option: $selectedOption',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
