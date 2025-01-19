import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:calculadora/main.dart';

void main() {
  testWidgets('App functionality test', (WidgetTester tester) async {
    // Build the app and trigger a frame.
    await tester.pumpWidget(const App());

    // Verify that the initial message is displayed.
    expect(find.text('Bem-vindo à Calculadora!'), findsOneWidget);
    expect(find.text('Aproveite para fazer seus cálculos!'), findsNothing);

    // Tap the custom button and trigger a frame.
    await tester.tap(find.text('Clique aqui!'));
    await tester.pump();

    // Verify that the message changes after tapping the button.
    expect(find.text('Bem-vindo à Calculadora!'), findsNothing);
    expect(find.text('Aproveite para fazer seus cálculos!'), findsOneWidget);

    // Verify the FloatingActionButton interaction.
    await tester.tap(find.byIcon(Icons.info));
    await tester.pump();

    // Check if a SnackBar appears.
    expect(find.text('Botão Flutuante Pressionado!'), findsOneWidget);
  });
}
