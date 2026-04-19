// lib/screens/home_screen.dart
import 'package:flutter/material.dart';
import '../data/dummy_data.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Color.fromARGB(255, 188, 255, 234),
      
      appBar: AppBar(
        title: const Text(
          "Spells' Book",
          style: TextStyle(
            fontSize: 30,
            // color: Color.fromARGB(255, 44, 83, 99),
          ),
        ),
        backgroundColor: Colors.transparent,
      ),
      body: ListView.builder(
        itemCount: spellList.length,
        itemBuilder: (context, index) {
          final spell = spellList[index];
          SizedBox(height: 10);
          return Card.outlined(
            surfaceTintColor: const Color.fromARGB(255, 255, 255, 255),
            color: Color.fromARGB(103, 59, 255, 193),
            margin: const EdgeInsets.all(9),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(120),
            ),
            elevation: 8,
            shadowColor: Color.fromARGB(255, 8, 163, 101),


            child: ListTile(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(120),
              ),
              contentPadding: const EdgeInsets.all(20),
              leading: ClipRRect(
                // borderRadius: BorderRadius.circular(8.0),
                child: Image.asset(
                  spell.imageUrl,
                  width: 60,
                  height: 100,
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
        tooltip: 'Go to Roller',
        backgroundColor: Colors.transparent,
        elevation: 10,
        shape: CircleBorder(side: BorderSide(color: Colors.transparent)),
        child: SizedBox(
          width: 100,
          child: Image.asset("assets/dice_roller.png"),
        ),
      ),
    );
  }
}
