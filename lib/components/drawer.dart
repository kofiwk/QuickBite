import 'package:flutter/material.dart';
import 'package:quickbite/components/drawer_tile.dart';
import 'package:quickbite/screens/settings.dart';
import 'package:quickbite/services/auth/auth_service.dart';
/* import 'package:quickbite/services/auth/login_or_register.dart';
import 'package:shared_preferences/shared_preferences.dart';
 */
class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  void logout() {
    final authService = AuthService();
    authService.signOut();
  }

  /* Future<void> _logout(BuildContext context) async {
    // Clear user session
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();

    // Navigate to LoginOrRegister screen
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => const LoginOrRegister()),
      (route) => false, // Remove all previous routes
    );
  } */

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.surface,
      child: Column(
        children: [
          // logo
          const Padding(
            padding: EdgeInsets.only(top: 100.0),
            child: Icon(
              Icons.lock_open_rounded,
              size: 40,
            ),
          ),

          const SizedBox(height: 30),

          // divider
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Divider(color: Colors.grey),
          ),

          // home
          MyDrawerTile(
            text: 'H O M E',
            icon: Icons.home,
            onTap: () => Navigator.pop(context),
          ),

          // settings
          MyDrawerTile(
              text: 'S E T T I N G S',
              icon: Icons.settings,
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SettingsPage()));
              }),

          const Spacer(),

          // logout
          MyDrawerTile(
            text: 'L O G O U T',
            icon: Icons.logout,
            onTap: () {
              logout();
              Navigator.pop(context);
            }
          ),

          const SizedBox(height: 25),
        ],
      ),
    );
  }
}
