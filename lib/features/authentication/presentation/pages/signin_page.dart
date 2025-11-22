import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:rive/rive.dart';

import 'package:template/config/router/routes.dart';
import 'package:template/core/providers.dart';
import 'package:template/features/authentication/domain/entites/signin_entity.dart';

// Define a class to hold both the Rive animation state and the controller
class RiveState {
  final bool lookingDown;
  final bool handsUp;
  final double lookLeftRight;
  final StateMachineController? controller;

  RiveState({
    required this.lookingDown,
    required this.handsUp,
    required this.lookLeftRight,
    this.controller,
  });

  // Copy constructor to update individual fields
  RiveState copyWith({
    bool? lookingDown,
    bool? handsUp,
    double? lookLeftRight,
    StateMachineController? controller,
  }) {
    return RiveState(
      lookingDown: lookingDown ?? this.lookingDown,
      handsUp: handsUp ?? this.handsUp,
      lookLeftRight: lookLeftRight ?? this.lookLeftRight,
      controller: controller ?? this.controller,
    );
  }
}

// Define a StateNotifier to manage both the animation state and the Rive controller
class RiveAnimationNotifier extends StateNotifier<RiveState> {
  RiveAnimationNotifier()
    : super(RiveState(lookingDown: false, handsUp: false, lookLeftRight: 0.0));

  // Setters for the animation state and controller
  void setLookingDown(bool value) {
    state = state.copyWith(lookingDown: value);
    state.controller?.findSMI("Check")?.value = value;
  }

  void setHandsUp(bool value) {
    state = state.copyWith(handsUp: value);
    state.controller?.findSMI("hands_up")?.value = value;
  }

  void setLookLeftRight(double value) {
    state = state.copyWith(lookLeftRight: value);
    state.controller?.findSMI("Look")?.value = value;
  }

  // Set the Rive controller (called when the Rive animation is initialized)
  void setController(StateMachineController controller) {
    state = state.copyWith(controller: controller);
  }
}

// Private Riverpod providers (underscore prefix makes them private)
final _riveAnimationProvider =
    StateNotifierProvider<RiveAnimationNotifier, RiveState>(
      (ref) => RiveAnimationNotifier(),
    );

class SigninPage extends ConsumerWidget {
  SigninPage({super.key});

  final emailCtrl = TextEditingController(text: "businessman@gmail.com");
  final passCtrl = TextEditingController(text: "hello123");

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final riveAnimationController = ref.watch(_riveAnimationProvider.notifier);

    final authState = ref.watch(signinProvider);
    ref.listen<AsyncValue<SigninEntity?>>(signinProvider, (prev, next) {
      next.whenData((success) {
        if (success != null) {
          context.go(AppRoutes.home);
        }
      });
    });
    return Scaffold(
      appBar: AppBar(title: const Text("Login")),
      body: Column(
        children: [
          SizedBox(
            height: 450,
            child: RiveAnimation.asset(
              "assest/3469-7899-login-screen-character.riv",
              artboard: "Artboard",
              fit: BoxFit.cover,
              onInit: (Artboard artboard) {
                final controller = StateMachineController.fromArtboard(
                  artboard,
                  'State Machine 1',
                );
                if (controller != null) {
                  artboard.addController(controller);

                  riveAnimationController.setController(controller);
                }
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                TextField(
                  onChanged: (value) {
                    ref
                        .read(_riveAnimationProvider.notifier)
                        .setLookingDown(true);
                    ref.read(_riveAnimationProvider.notifier).setHandsUp(false);
                    if (value.isEmpty) {
                      ref
                          .read(_riveAnimationProvider.notifier)
                          .setLookingDown(false);
                    }
                    ref
                        .read(_riveAnimationProvider.notifier)
                        .setLookLeftRight(value.length * 2.0);
                  },
                  onSubmitted: (_) {
                    ref
                        .read(_riveAnimationProvider.notifier)
                        .setLookingDown(false);
                    ref.read(_riveAnimationProvider.notifier).setHandsUp(false);
                  },

                  controller: emailCtrl,
                  decoration: const InputDecoration(labelText: 'Email'),
                ),
                TextField(
                  onChanged: (value) {
                    ref.read(_riveAnimationProvider.notifier).setHandsUp(true);
                    if (value.isEmpty) {
                      ref
                          .read(_riveAnimationProvider.notifier)
                          .setHandsUp(false);
                    }
                  },
                  onSubmitted: (_) {
                    ref.read(_riveAnimationProvider.notifier).setHandsUp(false);
                  },

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
                            .read(signinProvider.notifier)
                            .login(
                              email: emailCtrl.text.trim(),
                              password: passCtrl.text.trim(),
                            );
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
        ],
      ),
    );
  }
}
