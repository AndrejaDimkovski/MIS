import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:intl/intl.dart';
import '../models/event.dart';

class AddEventScreen extends StatefulWidget {
  final Function(Event) onEventAdded;
  final DateTime selectedDate;

  AddEventScreen({Key? key, required this.onEventAdded, required this.selectedDate}) : super(key: key);

  @override
  _AddEventScreenState createState() => _AddEventScreenState();
}

class _AddEventScreenState extends State<AddEventScreen> {
  final TextEditingController _timeController = TextEditingController();
  final TextEditingController _locationController = TextEditingController();
  final TextEditingController _subjectController = TextEditingController();
  DateTime? _selectedDateTime;
  bool _isAddingEvent = false;

  @override
  void initState() {
    super.initState();
    _selectedDateTime = widget.selectedDate;
    _timeController.text = DateFormat('HH:mm').format(_selectedDateTime!); // Initialize with the selected date
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Add new event')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            GestureDetector(
              onTap: () => _selectDate(context),
              child: AbsorbPointer(
                child: TextField(
                  controller: TextEditingController(
                    text: DateFormat('yyyy-MM-dd').format(_selectedDateTime!),
                  ),
                  decoration: InputDecoration(
                    labelText: 'Дата (YYYY-MM-DD)',
                  ),
                ),
              ),
            ),
            TextField(
              controller: _timeController,
              decoration: InputDecoration(labelText: 'Време (HH:MM)'),
              keyboardType: TextInputType.datetime,
            ),
            TextField(
              controller: _locationController,
              decoration: InputDecoration(labelText: 'Локација'),
            ),
            TextField(
              controller: _subjectController,
              decoration: InputDecoration(labelText: 'Предмет'),
            ),
            ElevatedButton(
              onPressed: _isAddingEvent ? null : () => _addEvent(context), // Disable button if adding
              child: Text('Add event'),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: _selectedDateTime!,
      firstDate: DateTime(2020),
      lastDate: DateTime(2101),
    );
    if (pickedDate != null && pickedDate != _selectedDateTime) {
      setState(() {
        _selectedDateTime = pickedDate;
      });
    }
  }

  Future<void> _addEvent(BuildContext context) async {
    if (_isAddingEvent) return;
    setState(() {
      _isAddingEvent = true;
    });

    try {
      DateTime? date;
      try {
        date = DateTime.parse(DateFormat('yyyy-MM-dd').format(_selectedDateTime!));
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Invalid data, use YYYY-MM-DD.')),
        );
        setState(() {
          _isAddingEvent = false;
        });
        return;
      }


      List<Location> locations = await locationFromAddress(_locationController.text);
      if (locations.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Cand find the location.')),
        );
        setState(() {
          _isAddingEvent = false;
        });
        return;
      }
      double latitude = locations[0].latitude;
      double longitude = locations[0].longitude;

      Event event = Event(
        date: date!,
        time: _timeController.text,
        location: _locationController.text,
        latitude: latitude,
        longitude: longitude,
        subject: _subjectController.text,
      );

      widget.onEventAdded(event);
      Navigator.pop(context, event);
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Грешка при додавање на настанот.')),
      );
    } finally {
      setState(() {
        _isAddingEvent = false;
      });
    }
  }
}
