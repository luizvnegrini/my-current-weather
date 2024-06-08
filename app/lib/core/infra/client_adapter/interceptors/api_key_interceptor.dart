import '../../../core.dart';

class APIKeyInterceptor extends HttpInterceptor {
  @override
  Future onRequest(HttpRequest request, HttpRequestHandler handler) async {
    request.queryParameter?.addAll({
      'appId': Envs.openWeatherMapKey,
    });

    return super.onRequest(request, handler);
  }
}
