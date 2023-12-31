// ignore_for_file: library_private_types_in_public_api
import 'package:mobx/mobx.dart';
import 'package:target_test/features/login/usecase/login_use_case.dart';

part 'login_store.g.dart';

class LoginStore = _LoginStore with _$LoginStore;

abstract class _LoginStore with Store {
  @observable
  bool isLoading = false;

  final LoginUseCase _loginUseCase;

  _LoginStore(this._loginUseCase);

  @action
  Future<LoginResult> login(String user, String password) async {
    isLoading = true;
    final result = await _loginUseCase(user, password);
    isLoading = false;
    return result;
  }
}
