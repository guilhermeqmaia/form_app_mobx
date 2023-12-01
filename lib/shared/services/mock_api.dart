import 'dart:math';

class MockApi {
  Future<bool> validateLogin() async {
    double randomValue = Random().nextDouble();

    return randomValue > 0.5;
  }
}
