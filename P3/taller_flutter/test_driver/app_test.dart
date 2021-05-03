import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';
import 'dart:io';

takeScreenshot(FlutterDriver driver, String path) async {
  final List<int> pixels = await driver.screenshot();
  final File file = new File(path);
  await file.writeAsBytes(pixels);
  print(path);
}

void main() {
  group('App RCFA',(){
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


    final inicioTextoFinder = find.text('Pantalla de Bienvenida');
    final formularioTextoFinder = find.text("Formulario de contacto positivo");
    final buttonFormularioFinder = find.text("Formulario de Contacto");

    test('Pantalla Bienvenida',() async{
      await takeScreenshot(driver, 'screenshots/bienvenida.png');
      expect(await driver.getText(inicioTextoFinder),"Pantalla de Bienvenida");
    });

    test('Página del formulario',() async{
      await driver.tap(buttonFormularioFinder);
      expect(await driver.getText(formularioTextoFinder),"Formulario de contacto positivo");
    });

    test('Hacer formulario',() async{
      await driver.waitFor(find.text('Formulario de contacto positivo'));

      await driver.waitFor(find.byValueKey("dni_textfield"));
      await driver.tap(find.byValueKey('dni_textfield'));
      await driver.enterText("123456789");

      await driver.waitFor(find.byValueKey("edad_textfield"));
      await driver.tap(find.byValueKey('edad_textfield'));
      await driver.enterText("46");

      await driver.waitFor(find.byValueKey("desc_textfield"));
      await driver.tap(find.byValueKey('desc_textfield'));
      await driver.enterText("Contacto con positivo de COVID-19");

      await takeScreenshot(driver, 'screenshots/entered_text.png');

      await driver.scrollIntoView(find.byValueKey("btn_enviar_formulario"));
      await driver.waitFor(find.text('Enviar formulario'));
      await driver.tap(find.byValueKey("btn_enviar_formulario"));
      await driver.waitFor(find.byValueKey("alerta_formulario"));
      print("Alerta de formulario de contacto presente!");
      await takeScreenshot(driver, 'screenshots/alerta.png');
      await driver.tap(find.text("Ok"));
      await driver.tap(find.pageBack());
    });

    test('Recomendación',() async{
      await driver.waitFor(find.text('Pantalla de Bienvenida'));

      await driver.tap(find.text("Recomendación Vacuna"));
      expect(await driver.getText(find.text("Recomendación Vacuna")),"Recomendación Vacuna");
      await takeScreenshot(driver, 'screenshots/vacunacion.png');

      await driver.tap(find.byValueKey("si_embarazo"));
      await driver.tap(find.byValueKey("si_mayor"));
      await driver.tap(find.byValueKey("si_desplazamiento"));
      await driver.tap(find.byValueKey("si_anticoagulantes"));

      await driver.tap(find.text("Enviar"));
      await driver.waitFor(find.text("La vacuna recomendada es Janssen"));
      await takeScreenshot(driver, 'screenshots/recomendacion.png');
      await driver.tap(find.text("Ok"));
      await driver.tap(find.pageBack());

      await driver.waitFor(find.text('Pantalla de Bienvenida'));
    });

  });
}