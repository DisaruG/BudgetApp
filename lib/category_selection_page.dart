import 'package:flutter/material.dart';

class CategorySelectionPage extends StatefulWidget {
  final List<String> selectedCategories;

  const CategorySelectionPage({super.key, required this.selectedCategories});

  @override
  CategorySelectionPageState createState() => CategorySelectionPageState();
}

class CategorySelectionPageState extends State<CategorySelectionPage> {
  // List of available categories
  final List<String> _allCategories = ['Travel', 'Shopping', 'Entertainment', 'Dining', 'Health', 'Education'];
  late List<String> _selectedCategories;

  @override
  void initState() {
    super.initState();
    _selectedCategories = List.from(widget.selectedCategories);
  }

  void _onCategorySelected(bool? selected, String category) {
    setState(() {
      if (selected == true) {
        _selectedCategories.add(category);
      } else {
        _selectedCategories.remove(category);
      }
    });
  }

  void _onDone() {
    Navigator.pop(context, _selectedCategories);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Select Spending Areas'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // List of categories with checkboxes
            Expanded(
              child: ListView(
                children: _allCategories.map((category) {
                  return CheckboxListTile(
                    title: Text(category),
                    value: _selectedCategories.contains(category),
                    onChanged: (selected) => _onCategorySelected(selected, category),
                  );
                }).toList(),
              ),
            ),
            const SizedBox(height: 20),
            // Done Button
            ElevatedButton(
              onPressed: _onDone,
              child: const Text('Done'),
            ),
          ],
        ),
      ),
    );
  }
}
