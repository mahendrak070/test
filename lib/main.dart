import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weather App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.lightBlue,
        textTheme: TextTheme(
          bodyMedium: TextStyle(color: Colors.white),
        ),
      ),
      home: WeatherScreen(),
    );
  }
}

class WeatherScreen extends StatefulWidget {
  @override
  _WeatherScreenState createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  final TextEditingController _cityController = TextEditingController();
  String _cityName = "City Name";
  String _temperature = "Temperature";
  String _weatherCondition = "Weather Condition";
  List<Map<String, String>> _weeklyForecast = [];

  void _fetchWeather() {
    setState(() {
      String cityName = _cityController.text;

      Random random = Random();
      int temperature = 15 + random.nextInt(16);

      List<String> weatherConditions = ['Sunny', 'Cloudy', 'Rainy'];
      String weatherCondition = weatherConditions[random.nextInt(3)];

      _cityName = cityName;
      _temperature = '$temperature°C';
      _weatherCondition = weatherCondition;
    });
  }

  void _fetchWeeklyForecast() {
    setState(() {
      _weeklyForecast.clear();

      Random random = Random();
      List<String> weatherConditions = ['Sunny', 'Cloudy', 'Rainy'];

      for (int i = 0; i < 7; i++) {
        int temperature = 15 + random.nextInt(16);
        String weatherCondition = weatherConditions[random.nextInt(3)];
        _weeklyForecast.add({
          'day': 'Day ${i + 1}',
          'temperature': '$temperature°C',
          'condition': weatherCondition,
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Weather App'),
        backgroundColor: Colors.orange,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.orange, Colors.yellow],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(
                Icons.wb_sunny,
                size: 100,
                color: Colors.white,
              ),
              SizedBox(height: 20),
              TextField(
                controller: _cityController,
                decoration: InputDecoration(
                  labelText: 'Enter City Name',
                  labelStyle: TextStyle(color: Colors.white),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                ),
                style: TextStyle(color: Colors.white),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _fetchWeather,
                child: Text('Fetch Weather'),
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white, backgroundColor: Colors.orange,
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _fetchWeeklyForecast,
                child: Text('Fetch 7-Day Forecast'),
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white, backgroundColor: Colors.orange,
                ),
              ),
              SizedBox(height: 40),
              Text(
                'City: $_cityName',
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
              SizedBox(height: 10),
              Text(
                'Temperature: $_temperature',
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
              SizedBox(height: 10),
              Text(
                'Condition: $_weatherCondition',
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
              SizedBox(height: 40),
              Text(
                '7-Day Forecast:',
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              SizedBox(height: 10),
              Expanded(
                child: ListView.builder(
                  itemCount: _weeklyForecast.length,
                  itemBuilder: (context, index) {
                    return Card(
                      color: Colors.orange.withOpacity(0.7),
                      child: ListTile(
                        title: Text(
                          _weeklyForecast[index]['day']!,
                          style: TextStyle(fontSize: 18, color: Colors.white),
                        ),
                        subtitle: Text(
                          '${_weeklyForecast[index]['temperature']!}, ${_weeklyForecast[index]['condition']!}',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

//third commit