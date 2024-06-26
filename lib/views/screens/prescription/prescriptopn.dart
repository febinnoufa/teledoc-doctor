import 'package:deledocdoctor/const/const.dart';
import 'package:deledocdoctor/controllers/appointments/appointment_controller.dart';
import 'package:deledocdoctor/views/widgets/bottomNav/bottom_nav_widget.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class PrescriptionScreen extends StatefulWidget {
  const PrescriptionScreen({Key? key, required this.userId, required this.name})
      : super(key: key);
  final userId;
  final String name;

  @override
  _PrescriptionScreenState createState() => _PrescriptionScreenState();
}

class _PrescriptionScreenState extends State<PrescriptionScreen> {
  final _medicationController = TextEditingController();
  final _noteController = TextEditingController();

  final AppointmentController cntr = Get.put(AppointmentController());

  int _dosage = 1;
  int _duration = 1;
  String _durationUnit = "Week";

  String _selectedRepeat = 'Everyday';
  String _selectedTimeOfDay = 'Morning';
  String _selectedBeTaken = 'After Food';

  final List<String> _repeatOptions = [
    'Everyday',
    'Alternate Days',
    'Specific Days'
  ];
  final List<String> _timeOfDayOptions = [
    'Morning',
    'Noon',
    'Night',
    'Evening'
  ];
  final List<String> _beTakenOptions = ['After Food', 'Before Food'];

  List<Map<String, dynamic>> _prescriptions = [];

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  void _incrementDosage() {
    setState(() {
      _dosage++;
    });
  }

  void _decrementDosage() {
    setState(() {
      if (_dosage > 1) _dosage--;
    });
  }

  void _incrementDuration() {
    setState(() {
      _duration++;
    });
  }

  void _decrementDuration() {
    setState(() {
      if (_duration > 1) _duration--;
    });
  }

  void _addPrescription() {
    // Create a map of the prescription details
    Map<String, dynamic> prescription = {
      'medication': _medicationController.text,
      'dosage': _dosage,
      'duration': _duration,
      'durationUnit': _durationUnit,
      'repeat': _selectedRepeat,
      'timeOfDay': _selectedTimeOfDay,
      'beTaken': _selectedBeTaken,
    };
    _prescriptions.add(prescription);

    // Clear the fields
    _medicationController.clear();

    _dosage = 1;
    _duration = 1;
    _durationUnit = "Week";
    _selectedRepeat = 'Everyday';
    _selectedTimeOfDay = 'Morning';
    _selectedBeTaken = 'After Food';

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Prescription submitted')),
    );
  }

  submtPrescription() async {
    await _firestore
        .collection('appointments')
        .doc(cntr.appointmentId)
        .collection('prescription')
        .add({
      'prescriptions': _prescriptions,
      'docnote': _noteController.text,
      'userId': widget.userId,
      'name': widget.name,
      'timestamp': Timestamp.now()
    });

    await _firestore
        .collection('appointments')
        .doc(cntr.appointmentId)
        .update({'end': true});
    _prescriptions = [];
    _noteController.clear();
  }

  // @override
  // void dispose() {
  //   // _medicationController.dispose();
  //   // _noteController.dispose();
  //   super.dispose();
  // }

  Widget _buildToggleButton(List<String> options, String selectedOption,
      void Function(String) onSelected) {
    return ToggleButtons(
      isSelected: options.map((option) => option == selectedOption).toList(),
      onPressed: (int index) {
        setState(() {
          onSelected(options[index]);
        });
      },
      children: options
          .map((option) => Padding(
                padding: const EdgeInsets.symmetric(horizontal: 14.0),
                child: Text(option),
              ))
          .toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.white,
        title: const Text(
          "Prescription",
          style: TextStyle(color: Colors.black),
        ),
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Text(widget.name,
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),
            TextFormField(
              controller: _medicationController,
              decoration: const InputDecoration(
                labelText: 'Name',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Dosage', style: TextStyle(fontSize: 16)),
                Row(
                  children: [
                    IconButton(
                      onPressed: _decrementDosage,
                      icon: const Icon(Icons.remove),
                    ),
                    Text('$_dosage Tablet',
                        style: const TextStyle(fontSize: 16)),
                    IconButton(
                      onPressed: _incrementDosage,
                      icon: const Icon(Icons.add),
                    ),
                  ],
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Duration', style: TextStyle(fontSize: 16)),
                Row(
                  children: [
                    IconButton(
                      onPressed: _decrementDuration,
                      icon: const Icon(Icons.remove),
                    ),
                    Text('$_duration $_durationUnit',
                        style: const TextStyle(fontSize: 16)),
                    IconButton(
                      onPressed: _incrementDuration,
                      icon: const Icon(Icons.add),
                    ),
                  ],
                )
              ],
            ),
            const SizedBox(height: 16),
            const Text('Repeat', style: TextStyle(fontSize: 16)),
            const SizedBox(height: 8),
            _buildToggleButton(_repeatOptions, _selectedRepeat, (value) {
              _selectedRepeat = value;
            }),
            const SizedBox(height: 16),
            const Text('Time of the day', style: TextStyle(fontSize: 16)),
            const SizedBox(height: 8),
            _buildToggleButton(_timeOfDayOptions, _selectedTimeOfDay, (value) {
              _selectedTimeOfDay = value;
            }),
            const SizedBox(height: 16),
            const Text('To be Taken', style: TextStyle(fontSize: 16)),
            const SizedBox(height: 8),
            _buildToggleButton(_beTakenOptions, _selectedBeTaken, (value) {
              _selectedBeTaken = value;
            }),
            const SizedBox(height: 16),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: _addPrescription,
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 16),
                textStyle: const TextStyle(fontSize: 16),
                primary: Colors.teal,
              ),
              child: const Text('Add medication'),
            ),
            const SizedBox(height: 30),
            TextFormField(
              controller: _noteController,
              decoration: const InputDecoration(
                labelText: 'Doctor\'s Note',
                border: OutlineInputBorder(),
              ),
              maxLines: 3,
            ),
            const SizedBox(
              height: 30,
            ),
            Card(
              elevation: 20,
              child: ElevatedButton(
                onPressed: () {
                  submtPrescription();
                  Get.offAll(const BotomNavigationBar());
                },
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  textStyle: const TextStyle(fontSize: 16),
                  primary: greenColor,
                ),
                child: const Text('Submit Prescription',
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold)),
              ),
            ),
            const SizedBox(height: 50),
          ],
        ),
      ),
    );
  }
}
