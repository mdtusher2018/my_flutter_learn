import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:template/src/config/router/app_router.dart';
import 'package:template/src/core/analytics_and_crashlytics/crashlytics/crashlytics_service.dart';
import 'package:template/unorganized_files/graph_ql/graphql_service.dart';
import 'src/core/di/dependency_injection.dart';
import 'package:template/src/core/services/snackbar/snackbar_service.dart';
import 'package:template/src/core/services/storage/local_storage_service.dart';
import 'package:template/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  CrashlyticsService.initialize();

  LocalStorageService().init();

  await GraphQLService.init();

  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final snackBarService = ref.read(snackBarServiceProvider);
    final router = ref.watch(appRouterProvider);
    return MaterialApp.router(
      scaffoldMessengerKey: (snackBarService as SnackBarService).messengerKey,
      title: 'Template App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      routerConfig: router,
    );
  }
}
