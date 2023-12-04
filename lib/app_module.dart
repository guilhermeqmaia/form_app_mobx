import 'package:flutter_modular/flutter_modular.dart';
import 'package:target_test/features/info_capture/info_capture_page.dart';
import 'package:target_test/features/info_capture/info_capture_store.dart';
import 'package:target_test/features/info_capture/usecase/fetch_info_usecase.dart';
import 'package:target_test/features/info_capture/usecase/set_info_usecase.dart';
import 'package:target_test/features/login/login_page.dart';
import 'package:target_test/features/login/login_store.dart';
import 'package:target_test/features/login/usecase/login_use_case.dart';
import 'package:target_test/shared/services/cache_service.dart';
import 'package:target_test/shared/services/mock_api.dart';

class AppModule extends Module {
  @override
  List<Bind<Object>> binds = [
    //Services
    Bind.factory<CacheService>((i) => CacheService()),
    Bind.factory<MockApi>((i) => MockApi()),

    //Usecases
    Bind.factory<LoginUseCase>((i) => LoginUseCase(i())),
    Bind.factory<SetInfoUsecase>((i) => SetInfoUsecase(i())),
    Bind.factory<FetchInfoUsecase>((i) => FetchInfoUsecase(i())),

    //Stores
    Bind.singleton<LoginStore>((i) => LoginStore(i())),
    Bind.singleton<InfoCaptureStore>((i) => InfoCaptureStore(i(), i())),
  ];

  @override
  List<ModularRoute> routes = [
    ChildRoute(
      '/',
      child: (context, _) => const LoginPage(),
    ),
    ChildRoute(
      '/info_capture',
      child: (context, _) => const InfoCapturePage(),
    ),
  ];
}
