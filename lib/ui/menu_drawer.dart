import 'package:flutter/material.dart';
import '../main.dart';
import 'rota.dart';
import 'splash.dart';

class MenuDrawer extends StatelessWidget {
  const MenuDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final appState = MyApp.of(context);
    final isDark = appState?.isDarkMode ?? false;

    return Drawer(
      child: Container(
        color: isDark ? const Color(0xFF17121F) : const Color(0xFFF7F3FC),
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: isDark
                      ? [
                          const Color(0xFF4527A0),
                          const Color(0xFF7E57C2),
                        ]
                      : [
                          const Color(0xFF5E35B1),
                          const Color(0xFF9575CD),
                        ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/icone.png',
                    height: 50,
                    width: 50,
                    errorBuilder: (context, error, stackTrace) {
                      return const Icon(
                        Icons.map,
                        size: 48,
                        color: Colors.white,
                      );
                    },
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'Menu',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: Icon(
                Icons.route,
                color:
                    isDark ? const Color(0xFFD1C4E9) : const Color(0xFF5E35B1),
              ),
              title: Text(
                'Traçar Rotas',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: isDark ? Colors.white : const Color(0xFF4527A0),
                ),
              ),
              onTap: () {
                Navigator.pop(context);

                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const RotaScreen(),
                  ),
                );
              },
            ),
            Divider(
              height: 1,
              color: isDark ? const Color(0xFF3A3045) : const Color(0xFFD1C4E9),
            ),
            ListTile(
              leading: Icon(
                Icons.home,
                color:
                    isDark ? const Color(0xFFD1C4E9) : const Color(0xFF5E35B1),
              ),
              title: Text(
                'Splash',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: isDark ? Colors.white : const Color(0xFF4527A0),
                ),
              ),
              onTap: () {
                Navigator.pop(context);

                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Splash(),
                  ),
                );
              },
            ),
            Divider(
              height: 1,
              color: isDark ? const Color(0xFF3A3045) : const Color(0xFFD1C4E9),
            ),
            SwitchListTile(
              secondary: Icon(
                isDark ? Icons.dark_mode : Icons.light_mode,
                color:
                    isDark ? const Color(0xFFD1C4E9) : const Color(0xFF5E35B1),
              ),
              title: Text(
                'Tema Escuro',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: isDark ? Colors.white : const Color(0xFF4527A0),
                ),
              ),
              value: isDark,
              activeColor: const Color(0xFFAB47BC),
              activeTrackColor: const Color(0xFF7E57C2),
              onChanged: (bool value) {
                appState?.toggleTheme(value);
              },
            ),
          ],
        ),
      ),
    );
  }
}
