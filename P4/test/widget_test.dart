// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:coveet/main.dart';
import 'package:coveet/home.dart';
import 'package:coveet/postear.dart';

void main() {
  testWidgets('Presencia secciones página principal', (WidgetTester tester) async{
    await tester.pumpWidget(
        MaterialApp(
          home: Home(),
        )
    );
    
    expect(find.byType(TextButton), findsNWidgets(2));
    expect(find.text('Postear'), findsOneWidget);
    expect(find.text('Feed Coveet'), findsOneWidget);
  });
  
  testWidgets('Presencia titulo en home', (WidgetTester tester) async{
    await tester.pumpWidget(
        MaterialApp(
          home: MyApp(),
        )
    );
    expect(find.text('Coveet'), findsOneWidget);
  });

  testWidgets('Presencia contenedor escribir coveet', (WidgetTester tester) async{
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            leading: Icon(Icons.masks, size: 50),
            title: Text("Postear Coveet"),
            backgroundColor: Colors.teal,
          ),
          body: Postear(),
        )
      )
    );

    expect(find.text('Introduce tu coveet'), findsOneWidget);
  });
}
