import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Weather Info App'),
        ),
        body: WeatherInfo(),
      ),
    );
  }
}

class WeatherInfo extends StatefulWidget {
  @override
  _WeatherInfoState createState() => _WeatherInfoState();
}

class _WeatherInfoState extends State<WeatherInfo> {
  final TextEditingController _cityController = TextEditingController();
  String _cityName = '';
  String _temperature = '';
  String _weatherCondition = '';

  void fetchWeather() {
    // To be implemented in the next steps
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          TextField(
            controller: _cityController,
            decoration: InputDecoration(labelText: 'Enter city name'),
          ),
          ElevatedButton(
            onPressed: fetchWeather,
            child: Text('Fetch Weather'),
          ),
          SizedBox(height: 20),
          Text('City: $_cityName'),
          Text('Temperature: $_temperature'),
          Text('Weather Condition: $_weatherCondition'),
        ],
      ),
    );
  }
}
