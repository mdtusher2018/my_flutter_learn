
// since abstructSignin class is final so it is not possible to test









// import 'package:flutter_test/flutter_test.dart';
// import 'package:mocktail/mocktail.dart';
// import 'package:template/features/authentication/domain/usecase/signin_usecase.dart';
// import 'package:template/core/services/storage/i_local_storage_service.dart';
// import 'package:template/features/authentication/domain/repositories/i_auth_repository.dart';
// import 'package:template/features/authentication/data/models/signin_response.dart';
// import 'package:template/core/services/storage/storage_key.dart';

// // Mock classes
// class MockAuthRepository extends Mock implements IAuthRepository {}

// class MockLocalStorageService extends Mock implements ILocalStorageService {}

// void main() {
//   late MockAuthRepository mockAuthRepository;
//   late MockLocalStorageService mockLocalStorage;
//   late LoginUseCase loginUseCase;

//   setUp(() {
//     mockAuthRepository = MockAuthRepository();
//     mockLocalStorage = MockLocalStorageService();
//     loginUseCase = LoginUseCase(
//       authRepository: mockAuthRepository,
//       localStorage: mockLocalStorage,
//     );
//   });

//   group('LoginUseCase Tests', () {
//     // ----------- 1. Validation Tests -----------
//     test('should throw an exception if email or password is empty', () async {
//       expect(
//         () async => await loginUseCase.execute(email: '', password: ''),
//         throwsException,
//       );
//       expect(
//         () async =>
//             await loginUseCase.execute(email: 'test@example.com', password: ''),
//         throwsException,
//       );
//       expect(
//         () async => await loginUseCase.execute(email: '', password: 'password'),
//         throwsException,
//       );
//     });

//     test('should throw an exception if email is invalid', () async {
//       final invalidEmail = "invalidemail";
//       expect(
//         () async => await loginUseCase.execute(
//           email: invalidEmail,
//           password: 'password',
//         ),
//         throwsException,
//       );
//     });

//     test(
//       'should throw an exception if password is invalid (short length)',
//       () async {
//         final shortPassword = "short";
//         expect(
//           () async => await loginUseCase.execute(
//             email: 'test@example.com',
//             password: shortPassword,
//           ),
//           throwsException,
//         );
//       },
//     );

//     // ----------- 2. Successful Login Tests -----------
//     test(
//       'should call AuthRepository and return SigninEntity on successful login',
//       () async {
//         final email = "test@example.com";
//         final password = "password123";
//         final token = "access_token";

//         final signinResponse = SigninResponse(
//           status: 'success',
//           statusCode: 200,
//           message: 'Login successful',
//           data: LoginData(accessToken: token),
//           errors: [],
//         );

//         when(
//           () => mockAuthRepository.login(email, password),
//         ).thenAnswer((_) async => signinResponse);
//         when(
//           () => mockLocalStorage.saveKey(StorageKey.accessToken, token),
//         ).thenAnswer((_) async {});

//         final result = await loginUseCase.execute(
//           email: email,
//           password: password,
//         );

//         verify(() => mockAuthRepository.login(email, password)).called(1);
//         verify(
//           () => mockLocalStorage.saveKey(StorageKey.accessToken, token),
//         ).called(1);
//         expect(result.accessToken, token);
//       },
//     );

//     // ----------- 3. Error Handling Tests -----------
//     test(
//       'should throw an exception if login response does not contain an access token',
//       () async {
//         final email = "test@example.com";
//         final password = "password123";

//         final signinResponse = SigninResponse(
//           status: 'error',
//           statusCode: 400,
//           message: 'Login failed: missing token',
//           data: null,
//           errors: ['Missing token'],
//         );

//         when(
//           () => mockAuthRepository.login(email, password),
//         ).thenAnswer((_) async => signinResponse);

//         expect(
//           () async =>
//               await loginUseCase.execute(email: email, password: password),
//           throwsException,
//         );
//       },
//     );

//     test('should throw an exception if the API returns an error', () async {
//       final email = "test@example.com";
//       final password = "password123";

//       final signinResponse = SigninResponse(
//         status: 'error',
//         statusCode: 400,
//         message: 'Invalid credentials',
//         data: null,
//         errors: ['Invalid email or password'],
//       );

//       when(
//         () => mockAuthRepository.login(email, password),
//       ).thenAnswer((_) async => signinResponse);

//       expect(
//         () async =>
//             await loginUseCase.execute(email: email, password: password),
//         throwsException,
//       );
//     });

//     test(
//       'should throw an exception if repository call fails (network error)',
//       () async {
//         final email = "test@example.com";
//         final password = "password123";

//         when(
//           () => mockAuthRepository.login(email, password),
//         ).thenThrow(Exception("Network error"));

//         expect(
//           () async =>
//               await loginUseCase.execute(email: email, password: password),
//           throwsException,
//         );
//       },
//     );

//     // ----------- 4. Edge Case Tests -----------
//     test('should handle email with trailing spaces', () async {
//       final email = "  test@example.com  ";
//       final password = "password123";

//       final signinResponse = SigninResponse(
//         status: 'success',
//         statusCode: 200,
//         message: 'Login successful',
//         data: LoginData(accessToken: 'access_token'),
//         errors: [],
//       );

//       when(
//         () => mockAuthRepository.login(any(), any()),
//       ).thenAnswer((_) async => signinResponse);
//       when(
//         () => mockLocalStorage.saveKey(StorageKey.accessToken, 'access_token'),
//       ).thenAnswer((_) async {});

//       final result = await loginUseCase.execute(
//         email: email,
//         password: password,
//       );

//       verify(
//         () => mockAuthRepository.login('test@example.com', 'password123'),
//       ).called(1);
//       expect(result.accessToken, 'access_token');
//     });

//     test('should handle password with trailing spaces', () async {
//       final email = "test@example.com";
//       final password = "  password123  ";

//       final signinResponse = SigninResponse(
//         status: 'success',
//         statusCode: 200,
//         message: 'Login successful',
//         data: LoginData(accessToken: 'access_token'),
//         errors: [],
//       );

//       when(
//         () => mockAuthRepository.login(any(), any()),
//       ).thenAnswer((_) async => signinResponse);
//       when(
//         () => mockLocalStorage.saveKey(StorageKey.accessToken, 'access_token'),
//       ).thenAnswer((_) async {});

//       final result = await loginUseCase.execute(
//         email: email,
//         password: password,
//       );

//       verify(
//         () => mockAuthRepository.login('test@example.com', 'password123'),
//       ).called(1);
//       expect(result.accessToken, 'access_token');
//     });
//   });
// }
