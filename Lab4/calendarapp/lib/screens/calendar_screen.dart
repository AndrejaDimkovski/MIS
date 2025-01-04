import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'map_screen.dart';
import 'add_event_screen.dart';
import '../models/event.dart';

class CalendarScreen extends StatefulWidget {
  @override
  _CalendarScreenState createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  late final TextEditingController _controllerEvents;
  final Map<DateTime, List<Event>> _events = {};

  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime _selectedDay = DateTime.now();

  @override
  void initState() {
    super.initState();
    _controllerEvents = TextEditingController();
    _addPredefinedEvents();
  }

  @override
  void dispose() {
    _controllerEvents.dispose();
    super.dispose();
  }


  void _addPredefinedEvents() {
    final predefinedEvents = [
      Event(
        date: DateTime(2025, 1, 5),
        time: '09:00 AM',
        location: 'Faculty of Computer Science and Engineering',
        latitude: 41.9993,
        longitude: 21.4299,
        subject: 'Introduction to Computer Science',
      ),
      Event(
        date: DateTime(2025, 1, 6),
        time: '11:00 AM',
        location: 'Harvard University',
        latitude: 42.373611,
        longitude: -71.109733,
        subject: 'Algorithms and Data Structures',
      ),
      Event(
        date: DateTime(2025, 1, 7),
        time: '01:00 PM',
        location: 'University of California, Berkeley',
        latitude: 37.8715,
        longitude: -122.2730,
        subject: 'Operating Systems',
      ),
      Event(
        date: DateTime(2025, 1, 8),
        time: '03:00 PM',
        location: 'MIT',
        latitude: 42.3601,
        longitude: -71.0942,
        subject: 'Computer Networks',
      ),
    ];


    for (var event in predefinedEvents) {
      if (_events[event.date] == null) {
        _events[event.date] = [];
      }
      _events[event.date]!.add(event);
    }
  }


  void _addEvent(Event event) {
    setState(() {

      if (_events[_selectedDay] == null) {
        _events[_selectedDay] = [];
      }

      bool eventExists = _events[_selectedDay]!.any((e) =>
      e.date.isAtSameMomentAs(event.date) &&
          e.time == event.time &&
          e.location == event.location);

      if (!eventExists) {
        _events[_selectedDay]!.add(event);
      } else {
        print('Event already exists for this day, time, and location.');
      }
    });
  }

  void _navigateToAddEventScreen() async {
    final event = await Navigator.push<Event>(
      context,
      MaterialPageRoute(
        builder: (context) => AddEventScreen(
          onEventAdded: _addEvent,
          selectedDate: _selectedDay,
        ),
      ),
    );

    if (event != null) {
    }
  }

  void _navigateToMapScreen() {
    if (_events.isNotEmpty) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => MapScreen(events: _getAllEvents()),
        ),
      );
    }
  }

  List<Event> _getAllEvents() {
    List<Event> allEvents = [];
    _events.forEach((date, eventList) {
      allEvents.addAll(eventList);
    });
    return allEvents;
  }

  bool _hasEventsForDay(DateTime day) {
    return _events.containsKey(DateTime(day.year, day.month, day.day));
  }

  void _onDaySelected(DateTime selectedDay, DateTime focusedDay) {
    setState(() {
      _selectedDay = DateTime(selectedDay.year, selectedDay.month, selectedDay.day); // Remove time component
      _focusedDay = focusedDay;
    });
  }

  @override
  Widget build(BuildContext context) {
    final allEvents = _getAllEvents();

    return Scaffold(
      appBar: AppBar(
        title: Text('Scheduler for events'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TableCalendar(
              firstDay: DateTime.utc(2020, 1, 1),
              lastDay: DateTime.utc(2030, 12, 31),
              focusedDay: _focusedDay,
              selectedDayPredicate: (day) {
                return _selectedDay != null && isSameDay(DateTime(_selectedDay.year, _selectedDay.month, _selectedDay.day), day);
              },
              onDaySelected: _onDaySelected,
              calendarFormat: _calendarFormat,
              onFormatChanged: (format) {
                setState(() {
                  _calendarFormat = format;
                });
              },
              eventLoader: (day) {
                return _hasEventsForDay(day) ? _events[day] ?? [] : [];
              },
              calendarBuilders: CalendarBuilders(
                todayBuilder: (context, day, focusedDay) {
                  return Container(
                    margin: const EdgeInsets.all(6.0),
                    decoration: BoxDecoration(
                      color: _hasEventsForDay(day) ? Colors.orange[300] : Colors.blue,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Center(
                      child: Text(
                        '${day.day}',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  );
                },
                selectedBuilder: (context, day, focusedDay) {
                  return Container(
                    margin: const EdgeInsets.all(6.0),
                    decoration: BoxDecoration(
                      color: Colors.orange[200],
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Center(
                      child: Text(
                        '${day.day}',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  );
                },
                defaultBuilder: (context, day, focusedDay) {
                  return Container(
                    margin: const EdgeInsets.all(6.0),
                    decoration: BoxDecoration(
                      color: _hasEventsForDay(day) ? Colors.orange[300] : null, // Highlight days with events in light orange
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Center(
                      child: Text(
                        '${day.day}',
                        style: TextStyle(
                          color: _hasEventsForDay(day) ? Colors.white : Colors.black,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: _navigateToAddEventScreen,
              child: Text('Add new event'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: _navigateToMapScreen,
              child: Text('View Events on Map'),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: allEvents.length,
              itemBuilder: (context, index) {
                final event = allEvents[index];
                return ListTile(
                  title: Text(event.location),
                  subtitle: Text(
                    'Дата: ${event.date.toLocal().toString().split(' ')[0]}\n'
                        'Време: ${event.time}\n'
                        'Предмет: ${event.subject}',
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
