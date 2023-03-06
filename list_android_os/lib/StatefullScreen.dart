import 'package:flutter/material.dart';

class StatefullScreen extends StatefulWidget {
  const StatefullScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _StatefullScreenState();
}

class _StatefullScreenState extends State<StatefullScreen> {
  String _textFieldValue = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Statefull Screen'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Text Field Value: $_textFieldValue'),
            Padding(
              padding: EdgeInsets.all(10),
              child: TextField(
                onChanged: (value) {
                  setState(() {
                    _textFieldValue = value;
                  });
                },
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Back'),
            )
          ],
        ),
      ),
    );
  }
}
