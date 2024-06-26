import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SalaryAllocationPage extends StatefulWidget {
  const SalaryAllocationPage({super.key});

  @override
  SalaryAllocationPageState createState() => SalaryAllocationPageState();
}

class SalaryAllocationPageState extends State<SalaryAllocationPage> {
  double _salary = 0.0;
  final List<CategoryAllocation> _categories = [
    CategoryAllocation('Rent', 0.0),
    CategoryAllocation('Groceries', 0.0),
    CategoryAllocation('Entertainment', 0.0),
    CategoryAllocation('Savings', 0.0),
  ];

  double get _totalAllocated {
    return _categories.fold(0, (sum, category) => sum + category.percentage);
  }

  void _onSalaryChanged(String value) {
    setState(() {
      _salary = double.tryParse(value) ?? 0.0;
    });
  }

  void _onCategoryChanged(int index, double value) {
    setState(() {
      _categories[index].percentage = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Salary Allocation'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Salary Input Section
            TextField(
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Enter your salary',
                prefixIcon: Icon(CupertinoIcons.money_dollar),
                border: OutlineInputBorder(),
              ),
              onChanged: _onSalaryChanged,
            ),
            const SizedBox(height: 20),
            // Category Allocation Sliders
            const Text(
              'Allocate your salary to different categories',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: _categories.length,
                itemBuilder: (context, index) {
                  return _buildCategoryAllocationItem(index);
                },
              ),
            ),
            const SizedBox(height: 20),
            // Summary Section
            _buildSummary(),
            const SizedBox(height: 20),
            // Confirm Button
            ElevatedButton(
              onPressed: _totalAllocated <= 100 ? _confirmAllocation : null,
              child: const Text('Confirm Allocation'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCategoryAllocationItem(int index) {
    final category = _categories[index];
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              category.name,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  child: Slider(
                    value: category.percentage,
                    min: 0,
                    max: 100,
                    divisions: 100,
                    label: '${category.percentage.toStringAsFixed(1)}%',
                    onChanged: (value) => _onCategoryChanged(index, value),
                  ),
                ),
                const SizedBox(width: 10),
                Text('${category.percentage.toStringAsFixed(1)}%'),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSummary() {
    double remainingPercentage = 100 - _totalAllocated;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Summary',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        Text('Total Allocated: ${_totalAllocated.toStringAsFixed(1)}%'),
        Text('Remaining: ${remainingPercentage.toStringAsFixed(1)}%'),
        const SizedBox(height: 10),
        if (remainingPercentage < 0)
          const Text(
            'You have allocated more than 100%. Please adjust.',
            style: TextStyle(color: Colors.red),
          ),
        if (remainingPercentage == 0)
          const Text(
            'Perfect! Your allocation is balanced.',
            style: TextStyle(color: Colors.green),
          ),
      ],
    );
  }

  void _confirmAllocation() {
    // Add logic to save the allocations or navigate to another screen
    print('Salary: $_salary');
    for (var category in _categories) {
      print('${category.name}: ${category.percentage}%');
    }
  }
}

class CategoryAllocation {
  String name;
  double percentage;

  CategoryAllocation(this.name, this.percentage);
}
