import 'package:flutter/material.dart';
import 'package:geez_calculator_v2/state/theme_notifier.dart';
import 'package:provider/provider.dart';

class AboutMeScreen extends StatelessWidget {
  const AboutMeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Access the theme and colors via ThemeNotifier
    ThemeData theme = Theme.of(context);
    ColorScheme colors = theme.colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'About Me',
          style: TextStyle(
            color: colors.onSurface,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: colors.surface,
        iconTheme: IconThemeData(color: colors.onSurface),
        elevation: 0, // Match your AppThemes style
      ),
      body: Container(
        color: theme
            .scaffoldBackgroundColor, // Use scaffoldBackgroundColor from theme
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Profile Section
              Row(
                children: [
                  CircleAvatar(
                    radius: 60,
                    backgroundColor: colors.primary,
                    backgroundImage: AssetImage('assets/images/profile.jpg'),
                  ),
                  const SizedBox(width: 20),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Dagim Mesfin',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: colors.onSurface,
                        ),
                      ),
                      Text(
                        'Mobile App Developer',
                        style: TextStyle(
                          fontSize: 16,
                          color: colors.onSurface.withOpacity(0.7),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 30),

              // About Me Section
              Text(
                'About Me',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: colors.onSurface,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                'Hi, I’m Dagim Mesfin, a passionate developer with a love for creating useful and intuitive applications. I specialize in Flutter and enjoy building apps that solve real-world problems. In my free time, I explore new technologies, contribute to open-source projects, and share my knowledge with the community.',
                style: TextStyle(
                  fontSize: 16,
                  color: colors.onSurface,
                ),
              ),
              const SizedBox(height: 20),

              // Motive for Creating the App
              Text(
                'Motive for Creating Geez Calculator',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: colors.onSurface,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                'I created the Geez Calculator to bridge the gap between traditional Geez numerals and modern arithmetic operations. As someone who values cultural heritage, I wanted to build a tool that allows users to perform calculations using Geez numbers while also providing a seamless conversion to standard numerals. My goal was to make this app both educational and practical, helping users appreciate the beauty of Geez script while performing everyday calculations.',
                style: TextStyle(
                  fontSize: 16,
                  color: colors.onSurface,
                ),
              ),
              const SizedBox(height: 20),

              // Contact Information
              Text(
                'Contact Me',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: colors.onSurface,
                ),
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  Icon(Icons.email, color: colors.primary),
                  const SizedBox(width: 10),
                  Text(
                    'dagmmesfin99@gmail.com',
                    style: TextStyle(
                      fontSize: 16,
                      color: colors.onSurface,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Icon(Icons.telegram, color: colors.primary),
                  const SizedBox(width: 10),
                  Text(
                    'DageronDeEthiopas',
                    style: TextStyle(
                      fontSize: 16,
                      color: colors.onSurface,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
