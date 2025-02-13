# Weather Info App

The Weather Info App allows users to check the current weather for a specific city and view a 7-day weather forecast. The app includes two main features:

1. **City Weather**: Search for a city and get the current weather, including temperature and condition.
2. **7-Day Forecast**: View the weather forecast for the next seven days with temperature and condition for each day.

## Features

- **Search City**: Users can input the name of any city, and the app will display random current temperature and weather conditions (Sunny, Cloudy, or Rainy).
- **7-Day Forecast**: A list of the upcoming 7 days with random temperature and weather conditions.
  
## Technologies Used

- **Flutter**: The app is built using the Flutter framework for creating beautiful and performant cross-platform mobile applications.
- **Dart**: The app uses the Dart programming language, which is the language used for Flutter development.
- **Random Data Generation**: Weather data (temperature and conditions) are generated randomly for the purpose of this app.

## How to Run

### Prerequisites

Make sure you have the following installed on your system:

- [Flutter](https://flutter.dev/docs/get-started/install) - for building the app
- [Dart](https://dart.dev/get-dart) - for Dart programming language support

### Steps to Run the App

1. Clone the repository:
   ```bash
   git clone https://github.com/Ruhisawant/Weather-Info-App.git
   ```

2. Navigate to the project directory:
   ```bash
   cd Weather-Info-App
   ```

3. Run the app:
   ```bash
   flutter run
   ```

The app will launch on the connected device or emulator.

## App Structure

- **MyApp**: The root widget that initializes the app and handles tab navigation.
- **WeatherTabs**: The widget containing two tabs: 'Search City' and '7-Day Forecast'.
- **CityWeather**: A widget where users can search for a city and get the current weather.
- **WeatherForecast**: A widget that displays the 7-day weather forecast with random data.

## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details.
