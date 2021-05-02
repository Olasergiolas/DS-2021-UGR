// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:taller_flutter/inicio.dart';
import 'package:taller_flutter/mockNavigatorObserver.dart';
import 'package:taller_flutter/recomendacion.dart';

void main() {
  testWidgets('Pag principal', (WidgetTester tester) async{
    final mockObserver = MockNavigationObserver();

    await tester.pumpWidget(
        MaterialApp(
          home: Inicio(),
          navigatorObservers: [mockObserver],
        )
    );
    expect(find.text('Pantalla de Bienvenida'), findsOneWidget);

    await tester.tap(find.text('Formulario de Contacto'));
    await tester.pumpAndSettle();
    expect(find.text('Formulario de contacto positivo'), findsOneWidget);

    final backIcon = find.byTooltip('Back');
    await tester.tap(backIcon);
    await tester.pumpAndSettle();
    expect(find.text('Pantalla de Bienvenida'), findsOneWidget);


    final listado = find.byKey(Key("listado_inicio"));
    final Offset point = tester.getCenter(listado);
    await tester.dragFrom(point, Offset(0.0, -400.0));
    await tester.pump();

    await tester.tap(find.text('Recomendación Vacuna'));
    await tester.pumpAndSettle();
    expect(find.text('Recomendación Vacuna'), findsOneWidget);

    final backIcon2 = find.byTooltip('Back');
    await tester.tap(backIcon2);
    await tester.pumpAndSettle();
    expect(find.text('Pantalla de Bienvenida'), findsOneWidget);
  });

  testWidgets('Almacenamiento de respuestas test', (WidgetTester tester) async{
    await tester.pumpWidget(
        MaterialApp(
          home: Recomendaciones()
        )
    );

    final listado = find.byKey(Key("lista_preguntas"));

    await tester.tap(find.byKey(Key("si_embarazo")));
    await tester.tap(find.byKey(Key("si_anticoagulantes")));
    await tester.tap(find.byKey(Key("si_mayor")));
    await tester.pumpAndSettle();
    RecomendacionesState estado = tester.state(find.byType(MisRecomendaciones));

    expect(estado.embarazo, Respuesta.Si);
    expect(estado.anticoagulantes, Respuesta.Si);
    expect(estado.mayor, Respuesta.Si);


    final Offset point = tester.getCenter(listado);
    await tester.dragFrom(point, Offset(0.0, -400.0));
    await tester.pump();

    await tester.tap(find.byKey(Key("si_desplazamiento")));
    await tester.tap(find.byKey(Key("si_menor")));
    await tester.pump();

    expect(estado.desplazamiento, Respuesta.Si);
    expect(estado.menor, Respuesta.Si);
  });

  testWidgets('Mostrar alerta con vacuna', (WidgetTester tester) async{
    await tester.pumpWidget(
        MaterialApp(
            home: Recomendaciones()
        )
    );
    RecomendacionesState estado = tester.state(find.byType(MisRecomendaciones));

    final listado = find.byKey(Key("lista_preguntas"));
    final Offset point = tester.getCenter(listado);
    await tester.dragFrom(point, Offset(0.0, -400.0));
    await tester.pumpAndSettle();

    final enviar = find.byKey(Key("btn_enviar"));
    await tester.tap(enviar);
    await tester.pumpAndSettle();

    //final alerta = find.byKey(Key("alerta_recomendacion"), skipOffstage: false);
    expect(estado.alert_displayed, false);
  });
}
