import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:travel_app/model/complete_model/complete_model.dart';
import 'package:travel_app/model/tripmodel/trip_model.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:travel_app/view/screens/login/welcome_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  if (!Hive.isAdapterRegistered(TripModelAdapter().typeId)) {
    Hive.registerAdapter(TripModelAdapter());
  }
  if (!Hive.isAdapterRegistered(CompleteModelAdapter().typeId)) {
    Hive.registerAdapter(CompleteModelAdapter());
  }

  Hive.openBox<TripModel>('tripDb');
  Hive.openBox<CompleteModel>('completeDb');
  runApp(const MyApp());
}



class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Travel App",
      theme: ThemeData(fontFamily: GoogleFonts.lato().fontFamily),
      home: const WelcomeScreen(),
    );
  }
}
