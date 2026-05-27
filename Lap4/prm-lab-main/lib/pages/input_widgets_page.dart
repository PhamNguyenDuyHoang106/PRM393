import 'package:flutter/material.dart';

class InputWidgetsPage extends StatefulWidget {
  const InputWidgetsPage({super.key});

  @override
  State<InputWidgetsPage> createState() => _InputWidgetsPageState();
}

class _InputWidgetsPageState extends State<InputWidgetsPage> {
  // Local states for demonstrating input controls.
  double sliderValue = 40;
  bool isDarkMode = false;
  String selectedGender = 'Male';
  DateTime? selectedDate;
  TimeOfDay? selectedTime;

  @override
  Widget build(BuildContext context) {
    final ThemeData baseTheme = Theme.of(context);

    // Build a proper dark ThemeData so the Switch visually changes the page.
    final ThemeData darkTheme = ThemeData(
      brightness: Brightness.dark,
      colorScheme: ColorScheme.fromSeed(
        seedColor: Colors.deepPurple,
        brightness: Brightness.dark,
      ),
    );

    // Wrap the page in Theme so toggling isDarkMode changes background/text colours.
    return Theme(
      data: isDarkMode ? darkTheme : baseTheme,
      child: Builder(
        builder: (themeContext) => Scaffold(
          appBar: AppBar(title: const Text('Input Widgets')),
          body: SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Slider updates a numeric value in real time.
                const Text(
                  'Slider Widget',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Slider(
                  value: sliderValue,
                  min: 0,
                  max: 100,
                  divisions: 20,
                  label: sliderValue.round().toString(),
                  onChanged: (value) {
                    setState(() {
                      sliderValue = value;
                    });
                  },
                ),
                Text('Slider value: ${sliderValue.toStringAsFixed(0)}'),
                const SizedBox(height: 24),

                // Switch toggles a boolean option – here used to demo dark/light theme.
                SwitchListTile(
                  title: const Text('Enable Dark Mode'),
                  value: isDarkMode,
                  onChanged: (value) {
                    setState(() {
                      isDarkMode = value;
                    });
                  },
                ),
                const SizedBox(height: 24),

                // Radio options for selecting one value from many.
                const Text(
                  'RadioListTile Widget',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                RadioGroup<String>(
                  groupValue: selectedGender,
                  onChanged: (value) {
                    if (value == null) return;
                    setState(() {
                      selectedGender = value;
                    });
                  },
                  child: const Column(
                    children: [
                      RadioListTile<String>(
                          title: Text('Male'), value: 'Male'),
                      RadioListTile<String>(
                          title: Text('Female'), value: 'Female'),
                    ],
                  ),
                ),
                Text('Selected Gender: $selectedGender'),
                const SizedBox(height: 24),

                // Date picker dialog.
                ElevatedButton(
                  onPressed: () async {
                    final pickedDate = await showDatePicker(
                      context: themeContext,
                      initialDate: selectedDate ?? DateTime.now(),
                      firstDate: DateTime(2020),
                      lastDate: DateTime(2030),
                    );
                    if (pickedDate == null) return;
                    setState(() {
                      selectedDate = pickedDate;
                    });
                  },
                  child: const Text('Select Date'),
                ),
                const SizedBox(height: 10),
                Text(
                  selectedDate == null
                      ? 'No date selected'
                      : 'Selected Date: ${selectedDate!.day}/${selectedDate!.month}/${selectedDate!.year}',
                ),
                const SizedBox(height: 16),

                // Time picker dialog.
                ElevatedButton(
                  onPressed: () async {
                    final pickedTime = await showTimePicker(
                      context: themeContext,
                      initialTime: selectedTime ?? TimeOfDay.now(),
                    );
                    if (pickedTime == null) return;
                    setState(() {
                      selectedTime = pickedTime;
                    });
                  },
                  child: const Text('Select Time'),
                ),
                const SizedBox(height: 10),
                Text(
                  selectedTime == null
                      ? 'No time selected'
                      : 'Selected Time: ${selectedTime!.format(themeContext)}',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
