import 'package:flutter/material.dart';
import 'screens/selection_screen.dart';
import 'screens/discover_screen.dart';
import 'screens/uitm_plus/sign_in_screen.dart';
import 'screens/student_portal/dashboard_screen.dart';
import 'screens/student_portal/timetable_screen.dart';
import 'screens/student_portal/results_screen.dart';
import 'screens/student_portal/fees_screen.dart';
import 'screens/student_portal/facilities_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'UITM',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.pink),
        useMaterial3: true,
      ),
      home: const SelectionScreen(),
      routes: {
        '/discover': (context) => const DiscoverScreen(),
        '/uitm-plus-signin': (context) => const UiTMPlusSignInScreen(),
        '/dashboard': (context) => const DashboardScreen(),
        '/timetable': (context) => const TimetableScreen(),
        '/results': (context) => const ResultsScreen(),
        '/fees': (context) => const FeesScreen(),
        '/facilities': (context) => const FacilitiesScreen(),
      },
    );
  }
}
