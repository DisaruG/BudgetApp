import 'package:flutter/material.dart';

import 'category_selection_page.dart';

class SalaryInputPage extends StatefulWidget {
  const SalaryInputPage({super.key});

  @override
  SalaryInputPageState createState() => SalaryInputPageState();
}

class SalaryInputPageState extends State<SalaryInputPage> {
  double _salary = 0.0;
  List<String> _selectedCategories = [];

  void _onSalaryChanged(String value) {
    setState(() {
      _salary = double.tryParse(value) ?? 0.0;
    });
  }

  void _navigateToCategorySelection() async {
    // Navigate to the CategorySelectionPage and wait for the result
    final result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CategorySelectionPage(selectedCategories: _selectedCategories),
      ),
    );

    if (result != null) {
      setState(() {
        _selectedCategories = result;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Quick Budgeting'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Salary Input
            TextField(
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Enter your monthly salary',
                prefixIcon: Icon(Icons.attach_money),
                border: OutlineInputBorder(),
              ),
              onChanged: _onSalaryChanged,
            ),
            const SizedBox(height: 20),
            // Category Selection Button
            ElevatedButton(
              onPressed: _navigateToCategorySelection,
              child: const Text('Select Areas to Spend'),
            ),
            const SizedBox(height: 20),
            // Display Selected Categories
            if (_selectedCategories.isNotEmpty) ...[
              const Text('Selected Areas:', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              const SizedBox(height: 10),
              Wrap(
                spacing: 8.0,
                runSpacing: 4.0,
                children: _selectedCategories.map((category) => Chip(label: Text(category))).toList(),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
