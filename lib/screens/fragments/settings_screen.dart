import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  static const Color primaryColor = Color(0xFF5474FF);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: const Text(
          "Settings",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w600,
          ),
        ),
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 8),

            SettingsTile(
              icon: Icons.notifications_none,
              title: "Notifications",
              trailing: Switch(
                value: true,
                activeColor: primaryColor,
                onChanged: (value) {},
              ),
            ),

            SettingsTile(
              icon: Icons.dark_mode_outlined,
              title: "Dark Mode",
              trailing: Switch(
                value: false,
                activeColor: primaryColor,
                onChanged: (value) {},
              ),
            ),

            SettingsTile(
              icon: Icons.language,
              title: "Language",
              onTap: () {},
            ),

            SettingsTile(
              icon: Icons.favorite_border,
              title: "Interests",
              onTap: () {},
            ),

            const SizedBox(height: 12),

            SettingsTile(
              icon: Icons.privacy_tip_outlined,
              title: "Privacy Policy",
              onTap: () {},
            ),

            SettingsTile(
              icon: Icons.info_outline,
              title: "About App",
              onTap: () {},
            ),

            const SizedBox(height: 24),

            const Text(
              "App Version 1.0.0",
              style: TextStyle(
                color: Colors.grey,
                fontSize: 13,
              ),
            ),

            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}
class SettingsTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final Widget? trailing;
  final VoidCallback? onTap;

  const SettingsTile({
    super.key,
    required this.icon,
    required this.title,
    this.trailing,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      child: InkWell(
        borderRadius: BorderRadius.circular(14),
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          decoration: BoxDecoration(
            color: Colors.grey.shade100,
            borderRadius: BorderRadius.circular(14),
          ),
          child: Row(
            children: [
              Icon(icon, color: SettingsScreen.primaryColor),
              const SizedBox(width: 16),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 16,
                ),
              ),
              const Spacer(),
              trailing ??
                  const Icon(
                    Icons.arrow_forward_ios,
                    size: 16,
                    color: Colors.grey,
                  ),
            ],
          ),
        ),
      ),
    );
  }
}