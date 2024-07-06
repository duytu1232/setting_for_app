import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:provider/provider.dart';
import 'package:setting_for_app/widget/theme_provider.dart';
import '../language/app_localizations.dart';
import '../language/language_privider.dart';
import 'edit_screen.dart';
import 'package:setting_for_app/widget/forward_button.dart';
import 'package:setting_for_app/widget/setting_item.dart';
import 'package:setting_for_app/widget/setting_switch.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final languageProvider = Provider.of<LanguageProvider>(context);
    final localizations = AppLocalizations.of(context);

    return Scaffold(
      appBar: AppBar(
        leadingWidth: 100,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              localizations.settings,
              style: const TextStyle(
                fontSize: 36,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 40),
            Text(
              localizations.account,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                const Icon(Icons.account_circle, size: 70),
                const SizedBox(width: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      localizations.user,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      localizations.admin,
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                ForwardButton(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const EditAccountScreen(),
                      ),
                    );
                  },
                ),
              ],
            ),
            const SizedBox(height: 40),
            Text(
              localizations.settings,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 20),
            SettingItem(
              title: localizations.language,
              icon: Ionicons.language_outline,
              bgColor: Colors.purple.shade200,
              iconColor: Colors.white,
              value: languageProvider.currentLocale.languageCode == 'en'
                  ? 'English'
                  : 'Tiếng Việt',
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: Text(localizations.language),
                    content: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        ListTile(
                          title: Text('English'),
                          onTap: () {
                            languageProvider
                                .changeLocale(const Locale('en', 'US'));
                            Navigator.of(context).pop();
                          },
                        ),
                        ListTile(
                          title: Text('Tiếng Việt'),
                          onTap: () {
                            languageProvider
                                .changeLocale(const Locale('vi', 'VN'));
                            Navigator.of(context).pop();
                          },
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
            const SizedBox(height: 20),
            SettingItem(
              title: localizations.notification,
              icon: Ionicons.notifications,
              bgColor: Colors.blue.shade100,
              iconColor: Colors.blue,
              value: "",
              onTap: () {},
            ),
            const SizedBox(height: 20),
            SettingSwitch(
              title: localizations.darkMode,
              icon: Ionicons.moon,
              bgColor: Colors.black,
              iconColor: Colors.white,
              value: themeProvider.themeMode == ThemeMode.dark,
              onToggle: (bool newValue) {
                themeProvider.toggleTheme(newValue);
              },
              onTap: (value) {
                themeProvider.toggleTheme(value);
              },
            ),
            const SizedBox(height: 20),
            SettingItem(
              title: localizations.help,
              icon: Ionicons.help_circle,
              bgColor: Colors.green.shade100,
              iconColor: Colors.green,
              value: "",
              onTap: () {},
            ),
            const SizedBox(height: 20),
            SettingItem(
                title: localizations.logout,
                icon: Ionicons.log_out_outline,
                bgColor: Colors.red.shade100,
                iconColor: Colors.red,
                value: "",
                onTap: () {}, //Nhấn để thoát tài khoản về đăng nhập
            )
          ],
        ),
      ),
    );
  }
}
