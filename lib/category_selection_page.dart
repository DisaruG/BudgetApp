import 'package:flutter/material.dart';

class CategorySelectionPage extends StatefulWidget {
  final List<String> selectedCategories;

  const CategorySelectionPage({super.key, required this.selectedCategories});

  @override
  CategorySelectionPageState createState() => CategorySelectionPageState();
}

class CategorySelectionPageState extends State<CategorySelectionPage> {
  // List of available categories with icons
  final List<Category> _allCategories = const [
    Category(name: 'Travel', icon: Icons.airplanemode_active), // Icon with travel
    Category(name: 'Shopping', icon: Icons.shopping_cart), // 
    Category(name: 'Entertainment', icon: Icons.movie),
    Category(name: 'Food', icon: Icons.fastfood),
    Category(name: 'Health', icon: Icons.health_and_safety),
    Category(name: 'Education', icon: Icons.school),
    Category(name: 'Beauty', icon: Icons.brush),
    Category(name: 'Social', icon: Icons.group),
  ];

  late List<String> _selectedCategories;

  @override
  void initState() {
    super.initState();
    _selectedCategories = List.from(widget.selectedCategories);
  }

  void _onCategoryTap(Category category) {
    setState(() {
      if (_selectedCategories.contains(category.name)) {
        _selectedCategories.remove(category.name);
      } else {
        _selectedCategories.add(category.name);
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
            // Grid of categories with icons and names
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3, // Number of items in a row
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  childAspectRatio: 1,
                ),
                itemCount: _allCategories.length,
                itemBuilder: (context, index) {
                  final category = _allCategories[index];
                  final isSelected = _selectedCategories.contains(category.name);
                  return GestureDetector(
                    onTap: () => _onCategoryTap(category),
                    child: Container(
                      decoration: BoxDecoration(
                        color: isSelected ? Colors.blue : Colors.grey[800],
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(category.icon, color: Colors.white, size: 30),
                          const SizedBox(height: 10),
                          Text(
                            category.name,
                            textAlign: TextAlign.center,
                            style: const TextStyle(color: Colors.white, fontSize: 14),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 20),
            // Larger Done Button
            SizedBox(
              width: double.infinity, // Full width of the parent
              height: 60, // Height of the button
              child: ElevatedButton(
                onPressed: _onDone,
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white, backgroundColor: Colors.blue, // Text color
                  textStyle: const TextStyle(
                    fontSize: 20, // Increase font size
                    fontWeight: FontWeight.bold, // Bold text
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12), // Rounded corners
                  ),
                ),
                child: const Text('Done'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Define Category Model
class Category {
  final String name;
  final IconData icon;

  const Category({required this.name, required this.icon});
}


