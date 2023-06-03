import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;



class MyHomePage extends StatefulWidget {
  MyHomePage({Key key,}) : super(key: key);



  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _symptomController = TextEditingController();
  String _condition = '';
  bool _isLoading = false;

  void _checkSymptom(String symptom) async {
    setState(() {
      _isLoading = true;
    });

    final apiKey = 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJlbWFpbCI6ImdkZXZsb3Blcjk5QGdtYWlsLmNvbSIsInJvbGUiOiJVc2VyIiwiaHR0cDovL3NjaGVtYXMueG1sc29hcC5vcmcvd3MvMjAwNS8wNS9pZGVudGl0eS9jbGFpbXMvc2lkIjoiMTE5MjIiLCJodHRwOi8vc2NoZW1hcy5taWNyb3NvZnQuY29tL3dzLzIwMDgvMDYvaWRlbnRpdHkvY2xhaW1zL3ZlcnNpb24iOiIyMDAiLCJodHRwOi8vZXhhbXBsZS5vcmcvY2xhaW1zL2xpbWl0IjoiOTk5OTk5OTk5IiwiaHR0cDovL2V4YW1wbGUub3JnL2NsYWltcy9tZW1iZXJzaGlwIjoiUHJlbWl1bSIsImh0dHA6Ly9leGFtcGxlLm9yZy9jbGFpbXMvbGFuZ3VhZ2UiOiJlbi1nYiIsImh0dHA6Ly9zY2hlbWFzLm1pY3Jvc29mdC5jb20vd3MvMjAwOC8wNi9pZGVudGl0eS9jbGFpbXMvZXhwaXJhdGlvbiI6IjIwOTktMTItMzEiLCJodHRwOi8vZXhhbXBsZS5vcmcvY2xhaW1zL21lbWJlcnNoaXBzdGFydCI6IjIwMjMtMDMtMTAiLCJpc3MiOiJodHRwczovL3NhbmRib3gtYXV0aHNlcnZpY2UucHJpYWlkLmNoIiwiYXVkIjoiaHR0cHM6Ly9oZWFsdGhzZXJ2aWNlLnByaWFpZC5jaCIsImV4cCI6MTY3ODQ1MjcwNywibmJmIjoxNjc4NDQ1NTA3fQ.uZJncqSjXteJv78Fi3m-iLsZ8caQAoyb9XxkrjmBu4Q';
    final baseUrl = 'https://sandbox-healthservice.priaid.ch';
    final gender = 'male';
    final yearOfBirth = '1990';

    final response = await http.get(Uri.parse(
        '$baseUrl/symptoms?token=$apiKey&language=en-gb'));

    if (response.statusCode == 200) {
      final List<dynamic> symptoms = json.decode(response.body);
      print(symptoms);
      final symptomId = symptoms
          .firstWhere((element) =>
      element['Name'].toLowerCase() == symptom.toLowerCase())
      ['ID'];

      final diagnosisResponse = await http.get(Uri.parse(
          '$baseUrl/diagnosis?symptoms=[$symptomId]&gender=$gender&year_of_birth=$yearOfBirth&token=$apiKey&language=en-gb'));

      if (diagnosisResponse.statusCode == 200) {
        final List<dynamic> conditions = json.decode(diagnosisResponse.body);
        if (conditions.isNotEmpty) {
          final condition = conditions.first['Issue']['Name'];
          setState(() {
            _condition = condition;
            _isLoading = false;
          });
          return;
        }
      }
    }

    setState(() {
      _condition = 'Unknown';
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Checker"),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: _symptomController,
              decoration: InputDecoration(
                labelText: 'Enter your symptom',
                border: OutlineInputBorder(),
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              _checkSymptom(_symptomController.text);
            },
            child: Text('Check'),
          ),
          if (_isLoading)
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: CircularProgressIndicator(),
            ),
          if (!_isLoading && _condition.isNotEmpty)
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'You may have: $_condition',
                style: TextStyle(fontSize: 20),
              ),
            ),
        ],
      ),
    );
  }
}
