import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:wakelock_plus/wakelock_plus.dart';

import 'package:time_text/time_text.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  WakelockPlus.enable();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.leanBack);
    return const MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

const _Colors = [
  Color.fromRGBO(255, 0, 0, 1),
  Color.fromRGBO(255, 128, 0, 1),
  Color.fromRGBO(255, 255, 0, 1),
  Color.fromRGBO(128, 255, 0, 1),
  Color.fromRGBO(0, 255, 0, 1),
  Color.fromRGBO(0, 255, 128, 1),
  Color.fromRGBO(0, 255, 255, 1),
  Color.fromRGBO(0, 128, 255, 1),
  Color.fromRGBO(0, 0, 255, 1),
  Color.fromRGBO(128, 0, 255, 1),
  Color.fromRGBO(255, 0, 255, 1),
  Color.fromRGBO(255, 0, 128, 1),
];

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  late final _colorController = AnimationController(
    vsync: this,
    duration: Duration(seconds: _Colors.length * 2),
  )..repeat();
  final sequence = TweenSequence(_Colors.indexed.map((it) {
    final (index, _) = it;
    return TweenSequenceItem(
      tween: ColorTween(
          begin: _Colors[index], end: _Colors[(index + 1) % _Colors.length]),
      weight: 100 / _Colors.length,
    );
  }).toList());
  late final colorAnimation = _colorController.drive(sequence);

  @override
  void dispose() {
    _colorController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: AnimatedBuilder(
          animation: colorAnimation,
          builder: (context, child) => TimeText(
            formatter: DateFormat.Hms().format,
            style: GoogleFonts.robotoMono(
              fontSize: 100,
              fontWeight: FontWeight.bold,
              color: colorAnimation.value,
            ),
          ),
        ),
      ),
    );
  }
}
