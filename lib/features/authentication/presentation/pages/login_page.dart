import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:template/features/authentication/presentation/providers/auth_providers.dart';

class LoginPage extends ConsumerWidget {
  LoginPage({super.key});

  final emailCtrl = TextEditingController();
  final passCtrl = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authProvider);

    return Scaffold(
      appBar: AppBar(title: const Text("Login")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: emailCtrl,
              decoration: const InputDecoration(labelText: 'Email'),
            ),
            TextField(
              controller: passCtrl,
              obscureText: true,
              decoration: const InputDecoration(labelText: 'Password'),
            ),
            const SizedBox(height: 20),
            authState.isLoading
                ? const CircularProgressIndicator()
                : ElevatedButton(
                  onPressed: () {
                    ref
                        .read(authProvider.notifier)
                        .login(emailCtrl.text.trim(), passCtrl.text.trim());
                  },
                  child: const Text("Login"),
                ),
            if (authState.hasError)
              Text(
                authState.error.toString(),
                style: const TextStyle(color: Colors.red),
              ),
          ],
        ),
      ),
    );
  }
}
