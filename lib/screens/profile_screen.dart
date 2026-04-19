import 'dart:math';
import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final diceTypes = ['d4', 'd6', 'd8', 'd10', 'd12', 'd20'];
  int counter = 1;
  int totalResult = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 227, 255, 242),
      appBar: AppBar(title: const Text('Dice Roller'), backgroundColor: Color.fromARGB(255, 188, 255, 234)),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(height: 70),
            Wrap(
              alignment: WrapAlignment.center,
              runSpacing: 15,
              children: diceTypes.map((type) => _buildDiceButton(context, type)).toList(),
            ),

            const SizedBox(height: 60),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                
                FloatingActionButton.small(
                  heroTag: "add",
                  onPressed: () {
                    setState(() {
                      counter++;
                    });
                  },
                  elevation: 4,
                  backgroundColor: const Color.fromARGB(255, 188, 255, 234),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Icon(Icons.add, color: Color.fromARGB(255, 0, 0, 0)),
                ),

                const SizedBox(width: 25),

                Text(
                  "$counter",
                  style: const TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(width: 25), 

                FloatingActionButton.small(
                  heroTag: "remove",
                  onPressed: () {
                    setState(() {
                      if (counter <= 1) {
                        counter = 1;
                      } else {
                        counter--;
                      }
                    });
                  },
                  elevation: 4,
                  backgroundColor: Color.fromARGB(255, 188, 255, 234),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Icon(Icons.remove, color: Color.fromARGB(255, 0, 0, 0)),
                ),
              ],
            ),
            Text(
              "Risultato Totale: $totalResult",
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDiceButton(BuildContext context, String type) {
    return SizedBox(
      width: 100,
      height: 100,
      child: FloatingActionButton(
        heroTag: 'btn_$type',
        onPressed: () {
          setState(() {
            totalResult = launchDice(type, counter);
          });
        },
        backgroundColor: Colors.transparent,
        elevation: 15,
        shape: BeveledRectangleBorder(borderRadius: BorderRadius.circular(40)),
        child: Image.asset("assets/dice-$type.png"),
      ),
    );
  }

  int launchDice(String type, int numDice) {
    int diceType = int.parse(type.replaceAll('d', ''));
    int sum = 0;
    final random = Random();
    for (int i = 0; i < numDice; i++) {
      sum += random.nextInt(diceType) + 1;
    }
    return sum;
  }
}
