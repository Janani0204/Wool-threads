import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    int counter = 0;

    // Build our app and trigger a frame.
    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('$counter', key: const Key('counterText')),
              ElevatedButton(
                onPressed: () {
                  counter++;
                },
                child: const Text('Increment'),
              ),
            ],
          ),
        ),
      ),
    ));

    // Verify that our counter starts at 0.
    expect(find.byKey(const Key('counterText')), findsOneWidget);
    expect(find.text('0'), findsOneWidget);

    // Tap the increment button and trigger a frame.
    await tester.tap(find.text('Increment'));
    await tester.pump();

    // Verify that our counter has incremented.
    expect(find.text('1'), findsOneWidget);
  });
}