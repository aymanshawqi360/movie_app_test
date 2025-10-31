abstract class ApiConsumer {
  Future<dynamic> get(
    String endPoint, {
    Map<String, dynamic>? body,
    Map<String, dynamic>? queryParametes,
  });
}
