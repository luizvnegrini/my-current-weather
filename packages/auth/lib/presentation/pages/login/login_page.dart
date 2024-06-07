import 'package:design_system/design_system.dart';
import 'package:external_dependencies/external_dependencies.dart';
import 'package:flutter/material.dart';

class LoginPage extends HookConsumerWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ScaffoldWidget(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Column(
        children: [
          TextFormField(
            decoration: const InputDecoration(hintText: 'Username'),
          ),
          const SizedBox(height: 16),
          TextFormField(
            decoration: const InputDecoration(hintText: 'Password'),
          ),
          const SizedBox(height: 16),
          HookConsumer(
            builder: (_, ref, __) => const ElevatedButton(
              onPressed: null,
              child: Text('Send'),
            ),
          ),
        ],
      ),
    );
  }
}
