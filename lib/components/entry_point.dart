import 'package:flutter/material.dart';
import 'package:pretium/components/custom_bottom_nav_bar.dart';
import 'package:pretium/screens/dashboard_screen.dart';

class EntryPoint extends StatefulWidget {
  const EntryPoint({super.key});

  @override
  State<EntryPoint> createState() => _EntryPointState();
}

class _EntryPointState extends State<EntryPoint> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    DashboardScreen(),
    Center(
      child: Text(
        'QR Scan Screen',
        style: TextStyle(fontSize: 24),
      ),
    ),
    Center(
      child: Text(
        'Transactions Screen',
        style: TextStyle(fontSize: 24),
      ),
    ),
  ];

  void onTap(int index){
    setState(() {
      _selectedIndex = index;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex, 
        children: _screens,
      ),
      bottomNavigationBar: CustomBottomNavBar(
        onTap: onTap,
        selectedIndex: _selectedIndex,
      ),
    );
  }
}