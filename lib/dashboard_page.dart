import 'package:flutter/material.dart';

class DashboardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Summary Cards
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildSummaryCard('Total Balance', '\$12,345', Icons.account_balance),
                _buildSummaryCard('Income', '\$3,500', Icons.attach_money),
                _buildSummaryCard('Expenses', '\$2,100', Icons.money_off),
              ],
            ),
            SizedBox(height: 20),
            // Budget Overview
            _buildSectionTitle('Budget Overview'),
            _buildBudgetOverview(),
            SizedBox(height: 20),
            // Recent Transactions
            _buildSectionTitle('Recent Transactions'),
            _buildRecentTransactions(),
            SizedBox(height: 20),
            // Quick Actions
            _buildSectionTitle('Quick Actions'),
            _buildQuickActions(context),
          ],
        ),
      ),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  Widget _buildSummaryCard(String title, String amount, IconData icon) {
    return Card(
      elevation: 3,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Icon(icon, size: 40, color: Colors.blue),
            SizedBox(height: 10),
            Text(title, style: TextStyle(fontSize: 18)),
            SizedBox(height: 5),
            Text(amount, style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
    );
  }

  Widget _buildBudgetOverview() {
    // Placeholder for budget overview (e.g., a pie chart or bar graph)
    return Container(
      height: 150,
      color: Colors.blue[50], // Replace with a chart or progress bars
      alignment: Alignment.center,
      child: Text('Budget Overview Placeholder'),
    );
  }

  Widget _buildRecentTransactions() {
    // Placeholder for recent transactions
    // Replace with a ListView or Column of transactions
    return Column(
      children: [
        _buildTransactionItem('Groceries', '- \$50', 'Jun 24'),
        _buildTransactionItem('Salary', '+ \$2,000', 'Jun 23'),
        _buildTransactionItem('Electric Bill', '- \$100', 'Jun 22'),
      ],
    );
  }

  Widget _buildTransactionItem(String title, String amount, String date) {
    return ListTile(
      leading: Icon(Icons.receipt, size: 30),
      title: Text(title),
      subtitle: Text(date),
      trailing: Text(amount, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
    );
  }

  Widget _buildQuickActions(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        ElevatedButton.icon(
          onPressed: () {
            // Navigate to add transaction page
          },
          icon: Icon(Icons.add),
          label: Text('Add Transaction'),
        ),
        ElevatedButton.icon(
          onPressed: () {
            // Navigate to reports page
          },
          icon: Icon(Icons.pie_chart),
          label: Text('View Reports'),
        ),
      ],
    );
  }

  Widget _buildBottomNavigationBar() {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Dashboard',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.account_balance_wallet),
          label: 'Accounts',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.settings),
          label: 'Settings',
        ),
      ],
      currentIndex: 0, // Set the current index to the dashboard
      selectedItemColor: Colors.blue,
      onTap: (index) {
        // Handle navigation
      },
    );
  }
}
