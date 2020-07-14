import 'package:Basketball_Scout_App/widgets/player_details_item.dart';
import 'package:flutter/material.dart';

import '../models/player.dart';

class FavouritesScreen extends StatelessWidget {
  final List<Player> favouritePlayers;

  const FavouritesScreen(this.favouritePlayers);

  @override
  Widget build(BuildContext context) {
    return favouritePlayers.isEmpty
        ? Center(
            child: Text(
              'You have no favourite players yet!',
              style: TextStyle(fontSize: 44),
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
