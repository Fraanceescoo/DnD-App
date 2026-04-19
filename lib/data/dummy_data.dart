// lib/data/dummy_data.dart
import '../models/spell.dart';

final List<Spell> spellList = [
  Spell(
    id: '1',
    name: 'Palla di fuoco',
    imageUrl: 'assets/fireball.png',
    description: 'I CAST FIREBALL!',
  ),
  Spell(
    id: '2',
    name: 'Illusione Minore',
    imageUrl: 'assets/minor_illusion.png',
    description: 'Life is just an illusion',
  ),
  Spell(
    id: '3',
    name: 'Acido acidoso',
    imageUrl: 'assets/acid_splash.png',
    description: 'Someone ate kebab',
  ),
];
