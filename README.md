# Geez Calculator V2

![Geez Calculator Banner](https://res.cloudinary.com/dnwep8w04/image/upload/v1743680058/geez_banner_sxnwn8.png)  
*Bringing Geez Numerals to Life with Flutter*

**Geez Calculator V2** is a sleek and innovative Flutter app designed to bridge the gap between traditional Geez numerals and modern arithmetic operations. Built for Android OS, this app allows users to perform basic calculations using Geez numerals and seamlessly convert between Geez and Arabic numerals. Whether you're a cultural enthusiast, a student, or simply curious about Geez script, this app offers a unique blend of heritage and technology.

---

## Features

- **Basic Operations with Geez Numerals**  
  Perform addition, subtraction, multiplication, and division using the ancient Geez numeral system.

- **Numeral Converter**  
  Effortlessly convert between Arabic numerals and Geez numerals (and vice versa) with an integrated algorithm.

- **Dynamic Result Display**  
  The result font size adjusts dynamically based on the length of the output, ensuring readability for long results.

- **History Panel**  
  A sliding history panel (iOS-style) to keep track of your calculations, with a scrollable list and clear functionality.

- **Light & Dark Theme Support**  
  Switch between light and dark themes with a toggle, controlled by a `ThemeNotifier` for a seamless user experience.

- **Android Compatibility**  
  Works on all Android OS devices, built entirely with the Flutter framework.

---

## Screenshots

| Calculator Screen (Light Theme) | Calculator Screen (Dark Theme) | Converter Screen | About Me Page |
|--------------------------------|--------------------------------|---------------|---------------|
| ![Calculator Light](https://res.cloudinary.com/dnwep8w04/image/upload/v1743680058/Screenshot_20250403_141805_hofdue.jpg) | ![Calculator Dark](https://res.cloudinary.com/dnwep8w04/image/upload/v1743680058/Screenshot_20250403_141717_rut6is.jpg) | ![Converter Panel](https://res.cloudinary.com/dnwep8w04/image/upload/v1743680058/Screenshot_20250403_141756_vht13l.jpg) | ![About Me](https://res.cloudinary.com/dnwep8w04/image/upload/v1743680058/Screenshot_20250403_141810_zob2n6.jpg) |

---

## Installation

### Prerequisites
- **Flutter SDK**: Ensure you have Flutter installed. Follow the [official Flutter installation guide](https://flutter.dev/docs/get-started/install) if needed.
- **Android Device/Emulator**: An Android device or emulator to run the app.
- **Dart**: Comes bundled with Flutter.

### Steps
1. **Clone the Repository**  
   ```bash
   git clone https://github.com/DagmMesfin/geez_calculator_v2.git
   cd geez_calculator_v2
   ```

2. **Install Dependencies**  
   Run the following command to fetch the required packages:
   ```bash
   flutter pub get
   ```

3. **Run the App**  
   Connect an Android device or start an emulator, then run:
   ```bash
   flutter run
   ```

---

## Usage

1. **Perform Calculations**  
   - Use the calculator panel to input Geez numerals and operators.
   - Perform basic operations (addition, subtraction, multiplication, division).
   - The result will display with a font size that adjusts based on its length (shrinks for results longer than 10 characters).

2. **Convert Numerals**  
   - Navigate to the converter screen via the app bar (compare arrows icon).
   - Convert between Arabic and Geez numerals seamlessly.

3. **View History**  
   - Tap the history icon to slide in the history panel from the right.
   - Scroll through past calculations and clear the history if needed.

4. **Toggle Theme**  
   - Use the moon icon in the app bar to switch between light and dark themes.

---

## Dependencies

The app uses the following Flutter packages:
- `provider`: For state management (e.g., history, theme).
- `ionicons`: For icons used in the app bar.

Check `pubspec.yaml` for the full list and versions.

---

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.

---

## About the Developer

*Geez Calculator V2* was created by Dagim Mesfin, a passionate Flutter developer dedicated to preserving cultural heritage through technology. Learn more about the developer and the app’s motive on the "About Me" page within the app.

---

## Contact

For questions, suggestions, or feedback, feel free to reach out:  
- **Email**: dagmmesfin99@gmail.com  
- **GitHub Issues**: [Open an issue](https://github.com/DagmMesfin/geez_calculator_v2/issues)

---

*Let’s celebrate the beauty of Geez numerals together with Geez Calculator V2!*
