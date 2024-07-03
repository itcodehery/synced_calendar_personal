import 'package:flutter/material.dart';
import 'package:synced_calendar_personal/model/event.dart';

class EventListTile extends StatefulWidget {
  const EventListTile({super.key, required this.event});

  final Event event;

  @override
  EventListTileState createState() => EventListTileState();
}

class EventListTileState extends State<EventListTile> {
  @override
  Widget build(BuildContext context) {
    return GridTile(
      child: Card(
        elevation: 0,
        color: widget.event.color.withAlpha(50),
        child: ListTile(
          title: Text(widget.event.title),
          subtitle: Text(widget.event.description),
          trailing: Text(
            "${widget.event.date.day}/${widget.event.date.month}/${widget.event.date.year}",
            style: const TextStyle(fontSize: 16),
          ),
          onTap: () {
            setState(() {});
          },
        ),
      ),
    );
  }
}
