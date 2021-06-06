import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';
import 'dart:io';
import 'dart:math';

const _chars = 'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
Random _rnd = Random();

String getRandomString(int length) => String.fromCharCodes(Iterable.generate(
    length, (_) => _chars.codeUnitAt(_rnd.nextInt(_chars.length))));


takeScreenshot(FlutterDriver driver, String path) async {
  final List<int> pixels = await driver.screenshot();
  final File file = new File(path);
  await file.writeAsBytes(pixels);
  print(path);
}

void main() {
  group('App Coveet', (){
    FlutterDriver driver;

    setUpAll(() async {
      new Directory('screenshots').create();
      driver = await FlutterDriver.connect();
    });

    tearDownAll(() async {
      if (driver != null) {
        driver.close();
      }
    });

    test('Funcionamiento del driver', () async {
      Health health = await driver.checkHealth();
      print(health.status);
    });

    String btn_actual = "Registarse en Coveet";
    String btn_correcto = "Registrarse en Coveet";

    test('Pantalla de PreHome',() async{
      await takeScreenshot(driver, 'screenshots/prehome.png');

      expect(await driver.getText(find.text("Login")),"Login");
      expect(await driver.getText(find.text(btn_actual)),"Registarse en Coveet");
    });

    test('Registrarse',() async{
      await driver.tap(find.text(btn_actual));
      final username_finder = find.byValueKey("usuario_field");
      final pass_finder = find.byValueKey("pass_field");

      await driver.waitFor(username_finder);
      await driver.tap(username_finder);
      await driver.enterText(getRandomString(5));

      await driver.waitFor(pass_finder);
      await driver.tap(pass_finder);
      await driver.enterText(getRandomString(5));

      await takeScreenshot(driver, 'screenshots/registrarse.png');

      await driver.tap(find.byValueKey("registrar_btn"));
      await takeScreenshot(driver, 'screenshots/registrarse2.png');
    });

    test('Postear',() async{
      await driver.tap(find.text('Postear'));
      await driver.tap(find.byValueKey("escribir_field"));
      await driver.enterText("Prueba de integración");
      await driver.tap(find.byValueKey("publicar_btn"));

      await driver.waitFor(find.text('Coveet Publicado'));
    });
  });
}