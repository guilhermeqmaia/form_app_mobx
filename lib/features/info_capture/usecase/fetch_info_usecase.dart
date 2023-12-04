import 'dart:convert';

import 'package:target_test/features/info_capture/info_capture_constants.dart';
import 'package:target_test/shared/services/cache_service.dart';

class FetchInfoUsecase {
  final CacheService _cacheService;

  const FetchInfoUsecase(this._cacheService);

  Future<List<String>> call() async {
    try {
      const key = InfoCaptureConstants.key;

      final result = await _cacheService.getString(key: key);

      if (result == null) return [];

      final parsed = jsonDecode(result);

      if (parsed is! List) throw Error();

      return parsed.map((data) => data as String).toList();
    } catch (error) {
      return [];
    }
  }
}
