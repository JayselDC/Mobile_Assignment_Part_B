import 'package:Basketball_Scout_App/widgets/player_details_item.dart';
import 'package:flutter/material.dart';

import '../models/player.dart';

// Displays a list of players that have been toggled as favourites
class FavouritesScreen extends StatelessWidget {
  final List<Player> favouritePlayers;

  const FavouritesScreen(
    this.favouritePlayers,
  );

  @override
  Widget build(BuildContext context) {
    // Only builds the ListView if there are favourite players
    return favouritePlayers.isEmpty
        ? Center(
            child: const Text(
              'You have no favourite players yet!',
              style: const TextStyle(fontSize: 44),
            ),
          )
        : ListView.builder(
            itemBuilder: (context, i) {
              return PlayerDetailsItem(
                name: favouritePlayers[i].name,
                position: favouritePlayers[i].position,
                age: favouritePlayers[i].age,
                grade: favouritePlayers[i].grade,
                id: favouritePlayers[i].id,
                imgUrl: favouritePlayers[i].image,
              );
            },
            itemCount: favouritePlayers.length,
          );
  }
}
