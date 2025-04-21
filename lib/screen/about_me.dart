import 'package:flutter/material.dart';
import 'package:geez_calculator_v2/state/theme_notifier.dart';
import 'package:provider/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AboutMeScreen extends StatelessWidget {
  const AboutMeScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
        elevation: 0,
      ),
      body: Container(
        color: theme.scaffoldBackgroundColor,
        padding: EdgeInsets.all(20.r),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Profile Section
              Row(
                children: [
                  CircleAvatar(
                    radius: 60.r,
                    backgroundColor: colors.primary,
                    backgroundImage: AssetImage('assets/images/profile.jpg'),
                  ),
                  SizedBox(width: 20.w),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Dagim Mesfin',
                        style: TextStyle(
                          fontSize: 24.sp,
                          fontWeight: FontWeight.bold,
                          color: colors.onSurface,
                        ),
                      ),
                      Text(
                        'Mobile App Developer',
                        style: TextStyle(
                          fontSize: 16.sp,
                          color: colors.onSurface.withOpacity(0.7),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 30.h),

              // About Me Section
              Text(
                'About Me',
                style: TextStyle(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.bold,
                  color: colors.onSurface,
                ),
              ),
              SizedBox(height: 10.h),
              Text(
                'Hi there👋, I\'m Dagim Mesfin, a passionate developer with a love for creating useful and intuitive applications. I specialize in Flutter and enjoy building apps that solve real-world problems. In my free time, I explore new technologies, contribute to open-source projects, and share my knowledge with the community.',
                style: TextStyle(
                  fontSize: 16.sp,
                  color: colors.onSurface,
                ),
              ),
              SizedBox(height: 20.h),

              // Motive for Creating the App
              Text(
                'Motive for Creating Geez Calculator',
                style: TextStyle(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.bold,
                  color: colors.onSurface,
                ),
              ),
              SizedBox(height: 10.h),
              Text(
                'I created the Geez Calculator to bridge the gap between traditional Geez numerals and modern arithmetic operations. As someone who values cultural heritage, I wanted to build a tool that allows users to perform calculations using Geez numbers while also providing a seamless conversion to standard numerals. My goal was to make this app both experimental, educational and practical, which it needs much more work than what it was anticipated, helping users appreciate the beauty of Geez script and raise awareness about the current status of Ge\'ez numerals.',
                style: TextStyle(
                  fontSize: 16.sp,
                  color: colors.onSurface,
                ),
              ),
              SizedBox(height: 20.h),

              // Contact Information
              Text(
                'Contact Me',
                style: TextStyle(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.bold,
                  color: colors.onSurface,
                ),
              ),
              SizedBox(height: 10.h),
              Row(
                children: [
                  Icon(Icons.email, color: colors.primary),
                  SizedBox(width: 10.w),
                  Text(
                    'dagmmesfin99@gmail.com',
                    style: TextStyle(
                      fontSize: 16.sp,
                      color: colors.onSurface,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Icon(Icons.telegram, color: colors.primary),
                  SizedBox(width: 10.w),
                  Text(
                    'DageronDeEthiopas',
                    style: TextStyle(
                      fontSize: 16.sp,
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
