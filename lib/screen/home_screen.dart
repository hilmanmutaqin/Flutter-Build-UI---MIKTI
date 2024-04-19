import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Latihan Flutter App'),
        backgroundColor: Colors.blue[600],
        actions: [IconButton(
          onPressed: () {}, 
          icon: const Icon(Icons.info))],
      ),
      body: const Center(child: Text('Sample')),
      drawer: const Drawer(),
      floatingActionButton: FloatingActionButton(onPressed: () {
      },child: const Icon(Icons.add),
      ),
      
    );
  }
}
