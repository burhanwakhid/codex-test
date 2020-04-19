import 'package:codex_test/core/service/api_service.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group("REST API Test", () {
    var api = ApiService();
    test('Data Top Stories', () async {
      var result = await api.fetchTopStories();
      print('RESULT $result');
      expect(result != '', true);
    });

    test('Data Comment', () async {
      List id = [ 22905626, 22906984, 22905590, 22906132];
      var result = await api.fetchComment(id);
      print('RESULT $result');
      expect(result != '', true);
    });
  });
}