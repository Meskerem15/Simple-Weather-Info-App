import 'package:flutter/material.dart';
import 'dart:math';

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
  List<String> _forecast = List.filled(7, ''); // For 7-day forecast

  // Fetch current weather for the city
  void fetchWeather() {
    setState(() {
      _cityName = _cityController.text;

      // Generate random temperature and weather condition
      _temperature = '${Random().nextInt(70) + 30}°C'; // Random between 30°C and 100°C
      _weatherCondition = ['Sunny', 'Cloudy', 'Rainy'][Random().nextInt(3)];
    });
  }

  // Fetch 7-day weather forecast
  void fetch7DayForecast() {
    setState(() {
      _cityName = _cityController.text;

      // Generate random forecast data for the next 7 days
      _forecast = List.generate(7, (index) {
        String temp = '${Random().nextInt(70) + 30}°C'; // Random between 30°C and 100°C
        String condition = ['Sunny', 'Cloudy', 'Rainy'][Random().nextInt(3)];
        return 'Day ${index + 1}: $temp, $condition';
      });
    });
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
          SizedBox(height: 20),
          
          // Button for fetching 7-day weather forecast
          ElevatedButton(
            onPressed: fetch7DayForecast,
            child: Text('Fetch 7-Day Forecast'),
          ),
          SizedBox(height: 20),
          
          // Displaying the 7-day forecast
          Expanded(
            child: ListView.builder(
              itemCount: _forecast.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(_forecast[index]),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

