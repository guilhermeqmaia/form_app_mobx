import 'package:mobx/mobx.dart';
import 'package:target_test/features/info_capture/usecase/fetch_info_usecase.dart';
import 'package:target_test/features/info_capture/usecase/set_info_usecase.dart';

part 'info_capture_store.g.dart';

class InfoCaptureStore = InfoCaptureStoreBase with _$InfoCaptureStore;

abstract class InfoCaptureStoreBase with Store {
  final SetInfoUsecase _setInfoUsecase;
  final FetchInfoUsecase _fetchInfoUsecase;

  @observable
  List<String> data = [];

  @observable
  bool isLoading = false;

  InfoCaptureStoreBase(
    this._setInfoUsecase,
    this._fetchInfoUsecase,
  );

  @action
  Future<void> fetch() async {
    isLoading = true;
    final result = await _fetchInfoUsecase();
    print(result);
    data.addAll(result);
    print(data);
    isLoading = false;
  }

  @action
  Future<bool> deleteByIndex(int index) async {
    isLoading = true;
    data.removeAt(index);
    final result = await _setInfoUsecase(data);
    isLoading = false;
    return result;
  }

  @action
  Future<bool> add(String value) async {
    isLoading = true;
    data.add(value);
    final result = await _setInfoUsecase(data);
    isLoading = false;
    return result;
  }
}
