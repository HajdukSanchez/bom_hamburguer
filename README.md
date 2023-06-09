# Bom Hamburguer App

Welcome to the Bom Hamburguer project! This is a shopping application that allows users to browse and purchase products. It includes features such as fetching data, processing payments, and applying discounts based on product combinations (it was created for academy purpose).

[![style: very good analysis][very_good_analysis_badge]][very_good_analysis_link]

Generated by the [Very Good CLI][very_good_cli_link] 🤖

A Very Good Project created by Very Good CLI.

## Project Description 🚀

The Bom Hamburguer App is built using the Clean Architecture approach, which emphasizes separation of concerns and modularity. The project is divided into several features, each with its own folder structure containing different layers: Application, Domain, Infrastructure, and Presentation.

The application follows the principles of Clean Architecture, ensuring that business logic is isolated from external dependencies and frameworks. Here's a brief overview of the layers:

- **Application**: This layer contains the use cases or application-specific business logic. It orchestrates the interactions between the different layers and serves as the entry point for external systems.
- **Domain**: The domain layer defines the core business entities and business rules. It represents the heart of the application and is independent of any external systems.
- **Infrastructure**: The infrastructure layer handles the communication with external systems and data sources. It includes implementations of repositories, APIs, databases, and any other external dependencies.
- **Presentation**: The presentation layer is responsible for handling user interface interactions and displaying data to the user. It includes UI components, view models, and the integration with the BLoC state management package.

We utilize the BLoC (Business Logic Component) package as the state management solution for this project. BLoC provides a reactive programming approach, making it easier to manage and update the application state in response to user actions or data changes.

To facilitate the interaction and communication between the different layers, we employ dependency injection. This approach helps to decouple the code and promotes testability and maintainability.

## Instructions to Run the Project 🏁

To run the Shopping App project, please follow these steps:

1. Clone the project repository from GitHub.
2. Make sure you have Flutter and Dart installed on your system.
3. Navigate to the project root directory.
4. Run the following command to fetch the project dependencies:

```sh
flutter pub get
```

5. Connect a device or start an emulator.
6. Build and run the application using the following command:

```sh
# Development
$ flutter run --flavor development --target lib/main_development.dart

# Staging
$ flutter run --flavor staging --target lib/main_staging.dart

# Production
$ flutter run --flavor production --target lib/main_production.dart
```

This command will launch the application on the connected device or emulator.

## Additional Information 👀

Here are some additional points worth mentioning:

- The project includes a hardcoded list of products, which serves as the basis for testing different combinations and generating specific discounts for the final payment.
- Feel free to explore and modify the project as needed, adding new features or enhancing existing ones.
- We recommend reviewing the documentation and examples provided by the Clean Architecture, BLoC, and dependency injection packages for a better understanding of their usage.
- Don't hesitate to reach out to the project maintainers or refer to the project's issue tracker if you encounter any problems or have questions.

Thank you for choosing the Bom Hamburguer App project! We hope you find it useful and enjoy working with it.

[very_good_analysis_badge]: https://img.shields.io/badge/style-very_good_analysis-B22C89.svg
[very_good_analysis_link]: https://pub.dev/packages/very_good_analysis
[very_good_cli_link]: https://github.com/VeryGoodOpenSource/very_good_cli
