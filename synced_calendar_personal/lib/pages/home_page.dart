import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:synced_calendar_personal/bloc/event_cubit.dart';
import 'package:synced_calendar_personal/components/EventListTile.dart';
import 'package:synced_calendar_personal/model/event.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Synced Calendar'),
      ),
      body: BlocBuilder<EventCubit, List<Event>>(
        builder: (context, state) {
          if (state.isEmpty) {
            return const Center(
              child: Text('No events added yet!'),
            );
          } else {
            state.sort((a, b) => a.date.compareTo(b.date));
            return ListView.builder(
              shrinkWrap: true,
              itemCount: state.length,
              itemBuilder: (context, index) {
                var item = state[index];
                return EventListTile(event: item);
              },
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/add');
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
