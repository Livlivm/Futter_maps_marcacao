import 'package:flutter/material.dart';
import 'ui/splash.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  static _MyAppState? of(BuildContext context) =>
      context.findAncestorStateOfType<_MyAppState>();

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ThemeMode _themeMode = ThemeMode.light;

  void toggleTheme(bool isDark) {
    setState(() {
      _themeMode = isDark ? ThemeMode.dark : ThemeMode.light;
    });
  }

  bool get isDarkMode => _themeMode == ThemeMode.dark;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'App de Trajetos',
      debugShowCheckedModeBanner: false,
      themeMode: _themeMode,

      // Tema Claro - Roxo e Lilás
      theme: ThemeData(
        brightness: Brightness.light,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF5E35B1),
          primary: const Color(0xFF5E35B1),
          secondary: const Color(0xFF7E57C2),
          surface: const Color(0xFFF7F3FC),
          brightness: Brightness.light,
        ),
        scaffoldBackgroundColor: const Color(0xFFF7F3FC),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF5E35B1),
          foregroundColor: Colors.white,
          elevation: 2,
        ),
        drawerTheme: const DrawerThemeData(
          backgroundColor: Color(0xFFF7F3FC),
        ),
        switchTheme: SwitchThemeData(
          thumbColor: WidgetStateProperty.resolveWith<Color?>(
            (states) {
              if (states.contains(WidgetState.selected)) {
                return const Color(0xFF7E57C2);
              }
              return Colors.grey;
            },
          ),
          trackColor: WidgetStateProperty.resolveWith<Color?>(
            (states) {
              if (states.contains(WidgetState.selected)) {
                return const Color(0xFFD1C4E9);
              }
              return Colors.grey.shade300;
            },
          ),
        ),
      ),

      // Tema Escuro - Roxo Escuro
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF7E57C2),
          primary: const Color(0xFF7E57C2),
          secondary: const Color(0xFFAB47BC),
          surface: const Color(0xFF17121F),
          brightness: Brightness.dark,
        ),
        scaffoldBackgroundColor: const Color(0xFF17121F),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF5E35B1),
          foregroundColor: Colors.white,
          elevation: 2,
        ),
        drawerTheme: const DrawerThemeData(
          backgroundColor: Color(0xFF17121F),
        ),
        switchTheme: SwitchThemeData(
          thumbColor: WidgetStateProperty.resolveWith<Color?>(
            (states) {
              if (states.contains(WidgetState.selected)) {
                return const Color(0xFFAB47BC);
              }
              return Colors.grey;
            },
          ),
          trackColor: WidgetStateProperty.resolveWith<Color?>(
            (states) {
              if (states.contains(WidgetState.selected)) {
                return const Color(0xFF5E35B1);
              }
              return Colors.grey.shade700;
            },
          ),
        ),
      ),

      home: const Splash(),
    );
  }
}
