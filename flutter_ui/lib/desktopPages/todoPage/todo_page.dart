import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class TodoPage extends StatelessWidget {
  const TodoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ShadApp.material(
      materialThemeBuilder: (context, theme) {
        return theme.copyWith(
          appBarTheme: const AppBarTheme(toolbarHeight: 52),
        );
      },
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Todo Page'),
        ),
        body: Center(
          child: ShadTabs<String>(
            value: 'account',
            tabBarConstraints: const BoxConstraints(maxWidth: 400),
            contentConstraints: const BoxConstraints(maxWidth: 400),
            tabs: [
              ShadTab(
                value: 'account',
                content: ShadCard(
                  title: const Text('Account'),
                  description: const Text(
                      "Make changes to your account here. Click save when you're done."),
                  footer: const ShadButton(child: Text('Save changes')),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const SizedBox(height: 16),
                      ShadInputFormField(
                        label: const Text('Name'),
                        initialValue: 'Alex',
                      ),
                      const SizedBox(height: 8),
                      ShadInputFormField(
                        label: const Text('Username'),
                        initialValue: 'nank1ro',
                      ),
                      const SizedBox(height: 16),
                    ],
                  ),
                ),
                child: const Text('Account'),
              ),
              ShadTab(
                value: 'password',
                content: ShadCard(
                  title: const Text('Password'),
                  description: const Text(
                      "Change your password here. After saving, you'll be logged out."),
                  footer: const ShadButton(child: Text('Save password')),
                  child: Column(
                    children: [
                      const SizedBox(height: 16),
                      ShadInputFormField(
                        label: const Text('Current password'),
                        obscureText: true,
                      ),
                      const SizedBox(height: 8),
                      ShadInputFormField(
                        label: const Text('New password'),
                        obscureText: true,
                      ),
                      const SizedBox(height: 16),
                    ],
                  ),
                ),
                child: const Text('Password'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
