import 'dart:math';

class MockApi {
  Future<bool> validateLogin() async {
    await Future.delayed(const Duration(seconds: 2));

    double randomValue = Random().nextDouble();

    return randomValue > 0.3;
  }
}
