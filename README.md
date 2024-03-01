# Tut App

Tut app is a Flutter project that follows the Clean Architecture principles and implements the MVVM (Model-View-ViewModel) pattern. It utilizes a dummy API provided by MockLap to simulate data interactions. The project is structured into four layers: App, Data, Domain, and Presentation.


## Project Structure and Layers

### **1. App Layer**
The App Layer serves as the entry point for the application. it contains files necessary for initializing the Flutter application. This layer initializes the dependency injection framework, sets up localization, and manages global state if necessary.

### **2. Data Layer**
The Data Layer handles data operations, including fetching and storing data from external sources such as APIs or databases. It consists of repositories and data sources responsible for interacting with external data providers. This layer abstracts the data access logic, making it independent of the data sources. The Data Layer is crucial for maintaining separation of concerns and ensuring that the business logic remains agnostic of data retrieval mechanisms.

### **3. Domain Layer**
The Domain Layer contains the core business logic and entities of the application. It defines the models, use cases, and business rules that govern the application's behavior. The Domain Layer encapsulates the application's logic independently of any specific implementation details, enabling easy portability and testability. This layer is responsible for orchestrating interactions between the Data Layer and the Presentation Layer.

### **4. Presentation Layer**
The Presentation Layer handles the user interface (UI) and user experience (UX) aspects of the application. It consists of UI components, such as widgets, screens, and navigation logic. The Presentation Layer follows the MVVM (Model-View-ViewModel) architecture pattern, where views observe view models for updates and react accordingly. This layer focuses on delivering a visually appealing and intuitive user interface while maintaining separation from the business logic and data access code.

## App Features

- **Clean Architecture**: Organized into distinct layers for separation of concerns and easy maintenance.
- **MVVM Pattern**: Utilizes the Model-View-ViewModel pattern for improved testability and maintainability.
- **Dummy API Integration**: Interacts with a dummy API provided by MockLap to simulate data fetching and storage operations.
- **Localization Support**: Supports localization using the Easy Localization package for multi-language support.
- **Shared Preferences**: Utilizes shared preferences to save the login state and language preference, providing a seamless user experience across sessions.


## User Features

The application provides the following features for users:

- **Login**: Users can log in to their accounts using their credentials, such as username/email and password.
  
- **Register**: New users can create an account by providing necessary information and registering with the application.
  
- **Forget Password**: Users who forget their password can reset it by following the password recovery process.
  
- **Show Store Details**: Users can view detailed information about stores.

- **Change Language**: Users have the option to switch between Arabic and English languages for the application interface, allowing for a personalized experience based on their language preference.


## Dependencies

- [cupertino_icons](https://pub.dev/packages/cupertino_icons): Provides icons for iOS-styled widgets in Flutter applications.
- [flutter_svg](https://pub.dev/packages/flutter_svg): Allows rendering SVG (Scalable Vector Graphics) images in Flutter applications.
- [retrofit](https://pub.dev/packages/retrofit): Simplifies the creation of REST API clients in Dart by generating code for HTTP calls.
- [analyzer](https://pub.dev/packages/analyzer): Provides static analysis functionality for Dart code, aiding in code quality and correctness.
- [dio](https://pub.dev/packages/dio): A powerful HTTP client for Dart that supports interceptors, FormData, request cancellation, and more.
- [json_serializable](https://pub.dev/packages/json_serializable): Generates code for JSON serialization and deserialization based on Dart classes.
- [json_annotation](https://pub.dev/packages/json_annotation): Provides annotations for JSON serialization and deserialization in Dart.
- [dartz](https://pub.dev/packages/dartz): Brings functional programming concepts like Either and Option to Dart, facilitating error handling and functional transformations.
- [internet_connection_checker](https://pub.dev/packages/internet_connection_checker): Allows checking the internet connection status in Flutter applications.
- [pretty_dio_logger](https://pub.dev/packages/pretty_dio_logger): Logs HTTP requests and responses in a readable and structured format for debugging purposes.
- [shared_preferences](https://pub.dev/packages/shared_preferences): Offers a simple way to persist key-value pairs locally on the device using SharedPreferences in Flutter.
- [device_info](https://pub.dev/packages/device_info): Retrieves information about the device such as operating system, model, and unique identifiers.
- [freezed](https://pub.dev/packages/freezed): Code generation for immutable classes in Dart with union types and value equality.
- [freezed_annotation](https://pub.dev/packages/freezed_annotation): Provides annotations for generating immutable classes with freezed.
- [get_it](https://pub.dev/packages/get_it): A simple service locator for Dart and Flutter projects, facilitating dependency injection.
- [lottie](https://pub.dev/packages/lottie): Allows rendering Adobe After Effects animations exported as JSON files (Lottie animations) in Flutter applications.
- [country_code_picker](https://pub.dev/packages/country_code_picker): Provides a widget for selecting country codes in Flutter applications.
- [image_picker](https://pub.dev/packages/image_picker): Allows picking images from the device's gallery or camera in Flutter applications.
- [rxdart](https://pub.dev/packages/rxdart): Provides reactive programming extensions for Dart, including Observables and Subjects.
- [carousel_slider](https://pub.dev/packages/carousel_slider): Implements a carousel slider widget in Flutter for displaying images or other content in a carousel layout.
- [easy_localization](https://pub.dev/packages/easy_localization): Offers simple and easy-to-use localization and internationalization for Flutter applications.
- [flutter_phoenix](https://pub.dev/packages/flutter_phoenix): Allows hot-restarting Flutter applications, preserving the application's state.

## Getting Started

To get started with the project, follow these steps:

1. Clone the repository to your local machine.
2. Install Flutter and Dart SDK if you haven't already.
3. Run `flutter pub get` to install dependencies.
4. Run the project on your preferred emulator or physical device using `flutter run`.






