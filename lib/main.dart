import 'package:flutter/material.dart';
import 'screens/selection_screen.dart';
import 'screens/discover_screen.dart';
import 'screens/be_uitm_link_flow.dart';
import 'screens/uitm_plus/sign_in_screen.dart';
import 'screens/uitm_plus/account_activation_flow.dart';
import 'screens/student_portal/student_portal_shell.dart';
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
      title: 'MyUiTM',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.pink),
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const SelectionScreen(),
        '/discover': (context) => const DiscoverScreen(),
        '/be-uitm-link': (context) => const BeUitmLinkFlow(),
        '/myuitm-plus-signin': (context) => const MyUiTMPlusSignInScreen(),
        '/account-activation': (context) => const AccountActivationFlow(),
        '/student-portal': (context) => const StudentPortalShell(),
        '/dashboard': (context) => const StudentPortalShell(),
        '/timetable': (context) => const TimetableScreen(),
        '/results': (context) => const ResultsScreen(),
        '/fees': (context) => const FeesScreen(),
        '/facilities': (context) => const FacilitiesScreen(),
      },
    );
  }
}
