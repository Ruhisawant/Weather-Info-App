import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weather Info App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _cityName = '';
  String _temperature = '--';
  String _weatherCondition = '--';

  void _fetchWeather() {
    setState(() {
      _cityName = '';
      _temperature = '${Random().nextInt(16) + 15}°C';
      _weatherCondition = ['Sunny', 'Cloudy', 'Rainy'][Random().nextInt(3)];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Weather Info'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const TextField(
              decoration: InputDecoration(
                labelText: 'Enter City Name',
                border: OutlineInputBorder(),
              ),
            ),
            ElevatedButton(
              onPressed: _fetchWeather,
              child: const Text('Fetch Weather'),
            ),
            Text('City: $_cityName', style: Theme.of(context).textTheme.headlineSmall),
            Text('Temperature: $_temperature', style: Theme.of(context).textTheme.headlineSmall),
            Text('Condition: $_weatherCondition', style: Theme.of(context).textTheme.headlineSmall),
          ],
        ),
      ),
    );
  }
}
