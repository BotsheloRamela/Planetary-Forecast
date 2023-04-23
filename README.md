# WeatherNow

WeatherNow is a cross-platform weather application that provides real-time weather data for cities on Earth. This app is built using Flutter and it integrates with the OpenWeatherMap API to fetch weather data.

## Features

- Get real-time weather data for any city on Earth.
- View current weather conditions, temperature, humidity, wind speed, and more.
- Clean and intuitive user interface.
- Accurate weather data powered by state management using the Provider package.

## Getting Started

To get started with WeatherNow, clone this repository:

```
    git clone https://github.com/BotsheloRamela/weathernow.git
```

Then, navigate to the project directory and run the app:

```
    cd weathernow
    flutter run
```

## Dependencies

WeatherNow depends on the following packages:

- http: ^0.13.3
- intl: ^0.18.1

You can install these dependencies by running:

```
    flutter pub get
```

## APIs

WeatherNow uses the OpenWeatherMap API for weather data. You will need to obtain an API key to use this app. Once you have obtained the API key, create a file called .env in the root directory of the project and add the following line:

```
    OPEN_WEATHER_MAP_API_KEY=your-api-key
```

Replace your-api-key with your actual API key.

## Contributing

If you would like to contribute to WeatherNow, feel free to submit a pull request.

