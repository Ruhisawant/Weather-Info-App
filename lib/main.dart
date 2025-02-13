import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 2,
        child: WeatherTabs(),
      ),
    );
  }
}

class WeatherTabs extends StatefulWidget {
  @override
  _WeatherTabsState createState() => _WeatherTabsState();
}

class _WeatherTabsState extends State<WeatherTabs> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      initialIndex: 0,
      length: 2,
      vsync: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    final tabs = ['Search City', '7-Day Forecast'];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather Info App'),
        bottom: TabBar(
          controller: _tabController,
          isScrollable: false,
          tabs: [for (final tab in tabs) Tab(text: tab)],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          // tab 1: City Weather
          CityWeather(),

          // tab 2: 7-Day Weather Forecast
          WeatherForecast(),
        ],
      ),
    );
  }
}

// City Weather Widget
class CityWeather extends StatefulWidget {
  @override
  _CityWeatherState createState() => _CityWeatherState();
}

class _CityWeatherState extends State<CityWeather> {
  final TextEditingController _cityController = TextEditingController();
  String _cityName = '';
  String _temperature = '';
  String _weatherCondition = '';

  void _fetchWeather() {
    setState(() {
      _cityName = _cityController.text;
      _temperature = '${Random().nextInt(16) + 15}°C';
      _weatherCondition = ['Sunny', 'Cloudy', 'Rainy'][Random().nextInt(3)];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.lightBlueAccent,
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                controller: _cityController,
                decoration: const InputDecoration(
                  labelText: 'Enter City Name',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 30),
              Center(
                child: ElevatedButton(
                  onPressed: _fetchWeather,
                  child: const Text('Fetch Weather'),
                ),
              ),
              const SizedBox(height: 30),
              Text(
                'City: $_cityName',
                style: const TextStyle(fontSize: 20),
              ),
              Text(
                'Temperature: $_temperature',
                style: const TextStyle(fontSize: 20),
              ),
              Text(
                'Condition: $_weatherCondition',
                style: const TextStyle(fontSize: 20),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// 7-Day Weather Forecast Widget
class WeatherForecast extends StatelessWidget {
  final List<Map<String, String>> _forecastData = List.generate(
    7,
    (index) => {
      'day': 'Day ${index + 1}',
      'temperature': '${Random().nextInt(16) + 15}°C',
      'condition': ['Sunny', 'Cloudy', 'Rainy'][Random().nextInt(3)],
    },
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.lightBlueAccent,
      child: ListView.builder(
        itemCount: _forecastData.length,
        itemBuilder: (context, index) {
          final dayData = _forecastData[index];
          return ListTile(
            title: Text(dayData['day']!),
            subtitle: Text('Temp: ${dayData['temperature']} - Condition: ${dayData['condition']}'),
          );
        },
      ),
    );
  }
}