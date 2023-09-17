import 'package:get/get.dart';
import 'package:app_use/features/constants.feature.dart';

class MainProvider extends GetConnect {
  @override
  GetHttpClient get httpClient => GetHttpClient(
        baseUrl: BACKEND_API,
        timeout: const Duration(seconds: 25),
      );
}
