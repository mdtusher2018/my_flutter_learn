import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:template/core/providers.dart';
import 'package:template/core/services/snackbar/snackbar_service.dart';
import 'package:template/features/authentication/presentation/pages/login_page.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final snackBarService = ref.read(snackBarServiceProvider);

    return MaterialApp(
      scaffoldMessengerKey: (snackBarService as SnackBarService).messengerKey,
      title: 'Template App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      home: LoginPage(),
    );
  }
}
