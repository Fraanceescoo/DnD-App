// lib/screens/home_screen.dart
import 'package:flutter/material.dart';
import '../data/dummy_data.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 188, 255, 234),
      appBar: AppBar(
        title: const Text(
          "Spells' Book",
          style: TextStyle(fontSize: 30, color: Color.fromARGB(255, 44, 83, 99)),
        ),
        backgroundColor: Color.fromARGB(255, 188, 255, 234),
      ),
      body: ListView.builder(
        itemCount: spellList.length,
        itemBuilder: (context, index) {
          final spell = spellList[index];
          SizedBox(height: 10);
          return Card(
            color: Color.fromARGB(255, 227, 255, 242),
            margin: const EdgeInsets.all(7),
            child: ListTile(
              contentPadding: const EdgeInsets.all(20),
              leading: ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.asset(
                  spell.imageUrl,
                  width: 60,
                  height: 60,
                  fit: BoxFit.cover,
                ),
              ),
              title: Text(
                spell.name,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text(
                spell.description,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              onTap: () {
                Navigator.pushNamed(context, '/details', arguments: spell);
              },
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.pushNamed(context, '/profile'),
        tooltip: 'Go to Profile',
        backgroundColor: Colors.transparent,
        shape: CircleBorder(side: BorderSide(color: Colors.transparent)),
        child: SizedBox(
          width: 100,
          child: Image.asset("assets/dice_roller.png"),
        ),
      ),
    );
  }
}
