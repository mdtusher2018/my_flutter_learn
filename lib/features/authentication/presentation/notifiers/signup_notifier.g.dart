// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'signup_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$signupUseCaseHash() => r'5c5bfbe4b61a853067f67d11121d44c76bff6732';

/// See also [_signupUseCase].
@ProviderFor(_signupUseCase)
final _signupUseCaseProvider = AutoDisposeProvider<SignupUseCase>.internal(
  _signupUseCase,
  name: r'_signupUseCaseProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$signupUseCaseHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef _SignupUseCaseRef = AutoDisposeProviderRef<SignupUseCase>;
String _$signupNotifierHash() => r'3a94820ea6230715f8ac14fc6dd7f0e3a9356e9c';

/// See also [SignupNotifier].
@ProviderFor(SignupNotifier)
final signupNotifierProvider =
    AutoDisposeAsyncNotifierProvider<SignupNotifier, SignupEntity?>.internal(
      SignupNotifier.new,
      name: r'signupNotifierProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$signupNotifierHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$SignupNotifier = AutoDisposeAsyncNotifier<SignupEntity?>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
