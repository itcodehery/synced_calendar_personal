import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:synced_calendar_personal/bloc/event_cubit.dart';
import 'package:synced_calendar_personal/pages/add_event_page.dart';
import 'package:synced_calendar_personal/pages/home_page.dart';

void main() {
  runApp(const SyncCalendarApp());
}

class SyncCalendarApp extends StatefulWidget {
  const SyncCalendarApp({super.key});

  @override
  SyncCalendarAppState createState() => SyncCalendarAppState();
}

class SyncCalendarAppState extends State<SyncCalendarApp> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => EventCubit(),
      child: MaterialApp(
        title: 'Synced Calendar',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          fontFamily: GoogleFonts.lato().fontFamily,
        ),
        home: const HomePage(),
        routes: {
          '/home': (context) => const HomePage(),
          '/add': (context) => const AddEventPage(),
        },
      ),
    );
  }
}
