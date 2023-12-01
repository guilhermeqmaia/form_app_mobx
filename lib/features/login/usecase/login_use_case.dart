import 'package:target_test/shared/services/mock_api.dart';

class LoginUseCase {
  final MockApi _mockApi;

  const LoginUseCase(this._mockApi);

  Future<LoginResult> call(String user, String password) async {
    try {
      final isValid = await _mockApi.validateLogin();

      if (!isValid) return LoginResult.invalidCredentials;

      return LoginResult.success;
    } catch (_) {
      return LoginResult.unexpectedError;
    }
  }
}

enum LoginResult { success, invalidCredentials, unexpectedError }
