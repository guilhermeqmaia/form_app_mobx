import 'dart:convert';

import 'package:target_test/features/info_capture/info_capture_constants.dart';
import 'package:target_test/shared/services/cache_service.dart';

class SetInfoUsecase {
  final CacheService _cacheService;

  const SetInfoUsecase(this._cacheService);

  Future<bool> call(List<String> data) async {
    try {
      const key = InfoCaptureConstants.key;

      return await _cacheService.setValue(key: key, value: jsonEncode(data));
    } catch (error) {
      return false;
    }
  }
}
