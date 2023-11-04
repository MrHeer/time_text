import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:wakelock_plus/wakelock_plus.dart';

import 'package:time_text/time_text.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  WakelockPlus.enable();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.leanBack);
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  late final _colorController = AnimationController(
    vsync: this,
    duration: const Duration(seconds: 6),
  )..repeat();
  final sequence = TweenSequence([
    TweenSequenceItem(
      tween: ColorTween(begin: Colors.red, end: Colors.green),
      weight: 100 / 3,
    ),
    TweenSequenceItem(
      tween: ColorTween(begin: Colors.green, end: Colors.blue),
      weight: 100 / 3,
    ),
    TweenSequenceItem(
      tween: ColorTween(begin: Colors.blue, end: Colors.red),
      weight: 100 / 3,
    ),
  ]);
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
