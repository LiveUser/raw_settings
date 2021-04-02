import 'package:flutter_test/flutter_test.dart';

import 'package:raw_settings/raw_settings.dart';

void main() {
  test('Test Settings library', () {
    RawSettings settings = RawSettings("test_app");
    settings.set(name: "language", value: "Español");
    String lang = settings.get(name: "language");
    print(lang);
  });
}
