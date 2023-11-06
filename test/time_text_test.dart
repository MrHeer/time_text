import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:intl/intl.dart' show DateFormat;

import 'package:time_text/time_text.dart';

void main() {
  testWidgets('TimeText has a current time', (WidgetTester tester) async {
    await tester.pumpWidget(const TimeText(textDirection: TextDirection.ltr));
    final currentTime = DateFormat.Hm().format(DateTime.now());
    final timeTextFinder = find.text(currentTime);
    expect(timeTextFinder, findsOneWidget);
  });

  testWidgets('TimeText has a current time with a formatter',
      (WidgetTester tester) async {
    await tester.pumpWidget(TimeText(
        formatter: DateFormat.Hms().format, textDirection: TextDirection.ltr));
    final currentTime = DateFormat.Hms().format(DateTime.now());
    final timeTextFinder = find.text(currentTime);
    expect(timeTextFinder, findsOneWidget);
  });
}
