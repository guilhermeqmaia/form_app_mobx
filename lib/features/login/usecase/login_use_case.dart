import 'package:target_test/shared/services/cache_service.dart';
import 'package:target_test/shared/services/mock_api.dart';

class LoginUseCase {
  final CacheService _cacheService;
  final MockApi _mockApi;

  const LoginUseCase(this._cacheService, this._mockApi);

  Future<LoginResult> call(String email, String password) async {
    try {
      final isValid = await _mockApi.validateLogin();

      if (!isValid) return LoginResult.invalidCredentials;

      await _cacheService.setValue(
        key: "auth_session",
        value: {
          "email": email,
          "password": password,
        },
      );

      return LoginResult.success;
    } catch (_) {
      return LoginResult.unexpectedError;
    }
  }
}

enum LoginResult { success, invalidCredentials, unexpectedError }
