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
        child: _TabsNonScrollableDemo(),
      ),
    );
  }
}

class _TabsNonScrollableDemo extends StatefulWidget {
  @override
  __TabsNonScrollableDemoState createState() => __TabsNonScrollableDemoState();
}

class __TabsNonScrollableDemoState extends State<_TabsNonScrollableDemo>
    with SingleTickerProviderStateMixin, RestorationMixin {
  late TabController _tabController;

  final RestorableInt tabIndex = RestorableInt(0);

  @override
  String get restorationId => 'tab_non_scrollable_demo';

  @override
  void restoreState(RestorationBucket? oldBucket, bool initialRestore) {
    registerForRestoration(tabIndex, 'tab_index');
    _tabController.index = tabIndex.value;
  }

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
    final tabs = ['Weather', '7-Day Weather'];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Tabs Demo'),
        bottom: TabBar(
          controller: _tabController,
          tabs: [for (final tab in tabs) Tab(text: tab)],
        ),
      ),
      
      body: TabBarView(
        controller: _tabController,
        children: [
          // tab 1: Weather App
          _WeatherApp(),

          // tab 2: 7-Day Weather Forecast
          _SevenDayWeather(),
        ],
      ),
    );
  }
}

// Weather App Widget (Tab 1)
class _WeatherApp extends StatefulWidget {
  @override
  __WeatherAppState createState() => __WeatherAppState();
}

class __WeatherAppState extends State<_WeatherApp> {
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
      color: Colors.blue,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _cityController,
              decoration: const InputDecoration(
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

// 7-Day Weather Forecast Widget (Tab 2)
class _SevenDayWeather extends StatelessWidget {
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
      color: Colors.green,
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