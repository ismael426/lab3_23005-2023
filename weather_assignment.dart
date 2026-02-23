import 'dart:async';

// PART A: Future Functions
Future<String> fetchCurrentWeather() async {
  await Future.delayed(Duration(seconds: 1));
  return "Sunny";
}

Future<int> fetchTemperature() async {
  await Future.delayed(Duration(seconds: 1));
  return 28;
}

// PART C: Stream Forecast
Stream<String> forecastStream() async* {
  List<String> forecasts = ["Partly Cloudy", "Rainy", "Sunny"];
  for (var weather in forecasts) {
    await Future.delayed(Duration(milliseconds: 500));
    yield weather;
  }
}

// THE MAIN FUNCTION: The entry point of your program
void main() async {
  print("--- PART A: Future Functions & Error Handling ---");
  print("Code logic: Using 'async' and 'Future' with try-catch blocks.");
  
  try {
    print("Loading weather data...");

    // PART B: Parallel Loading logic
    print("\n--- PART B: Parallel Loading ---");
    print("Code logic: Using 'Future.wait' to fetch multiple data points at once.");
    
    // Fetching data simultaneously
    final results = await Future.wait([
      fetchCurrentWeather(),
      fetchTemperature(),
    ]);

    String weather = results[0] as String;
    int temp = results[1] as int;

    // Assignment Output Format
    print("\n[FINAL WEATHER REPORT]");
    print("Current: $weather");
    print("Expected Output"); 
    print("Temp: $temp°C");
    print("Humidity: 65%");

  } catch (e) {
    // Fulfilling the error handling requirement of Part A
    print("Error handling active: $e");
  }

  // PART C: Stream Forecast logic
  print("\n--- PART C: Stream Forecast ---");
  print("Code logic: Using 'async*' and 'yield' to emit multiple values over time.");
  print("5-Day Forecast:");

  int day = 1;
  // Consuming the stream using await for
  await for (var status in forecastStream()) {
    print("Day $day: $status");
    day++;
  }

  print("\n--- End of Assignment ---");
}