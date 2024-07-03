import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:synced_calendar_personal/bloc/event_cubit.dart';
import 'package:synced_calendar_personal/model/event.dart';

class AddEventPage extends StatefulWidget {
  const AddEventPage({super.key});

  @override
  _AddEventPageState createState() => _AddEventPageState();
}

class _AddEventPageState extends State<AddEventPage> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  DateTime? dateTime;
  Color selectedColor = colors[0];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Add Event',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Form(
        key: formKey,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Title',
                ),
                controller: titleController,
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: descriptionController,
                decoration: const InputDecoration(
                  labelText: 'Description',
                ),
              ),
              const SizedBox(height: 16),
              //add date picker here
              ListTile(
                title: const Text("Date:"),
                trailing: TextButton(
                    onPressed: () async {
                      var selectedDate = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(2000),
                        lastDate: DateTime(2100),
                      );
                      debugPrint(selectedDate.toString());

                      setState(() {
                        dateTime = selectedDate;
                      });
                    },
                    child: dateTime == null
                        ? const Text("Pick Date")
                        : Text(
                            "${dateTime!.day}/${dateTime!.month}/${dateTime!.year}")),
              ),
              const SizedBox(height: 16),
              ListTile(
                title: const Text("Color: "),
                trailing: DropdownButton<Color>(
                  value: selectedColor,
                  onChanged: (Color? value) {
                    setState(() {
                      selectedColor = value!;
                    });
                  },
                  items: colors
                      .map(
                        (e) => DropdownMenuItem<Color>(
                          value: e,
                          child: Container(
                            width: 16,
                            height: 16,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: e,
                            ),
                          ),
                        ),
                      )
                      .toList(),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  context.read<EventCubit>().addEvent(
                        Event(
                          title: titleController.text.trim(),
                          description: descriptionController.text.trim(),
                          date: dateTime ?? DateTime.now(),
                          color: selectedColor,
                        ),
                      );
                  Navigator.pop(context);
                },
                child: const Text('Add Event'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
