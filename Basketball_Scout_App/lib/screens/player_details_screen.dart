import 'package:flutter/material.dart';

import '../dummy_data.dart';
import '../widgets/gradient_container.dart';
import '../widgets/player_info_card.dart';

// Displays the details of a player
class PlayerDetailsScreen extends StatelessWidget {
  static const route = '/player-details';

  final Function toggleFavourite;
  final Function isFavourite;

  const PlayerDetailsScreen(
    this.toggleFavourite,
    this.isFavourite,
  );

  @override
  Widget build(BuildContext context) {
    final id = ModalRoute.of(context).settings.arguments as String;
    final selectedPlayer =
        DUMMY_PLAYERS.firstWhere((player) => player.id == id);

    return Scaffold(
      // Scrollable, should there ever be extra data added to this screen
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Stack(
              // Allows overlaying of the avatar over the gradient and the container following
              overflow: Overflow.visible,
              alignment: Alignment.center,
              children: <Widget>[
                GradientContainer(
                  250,
                  double.infinity,
                  [
                    Theme.of(context).primaryColor,
                    Theme.of(context).accentColor
                  ],
                ),
                // Return functionality without the need for an AppBar
                Positioned(
                  top: 30,
                  left: 5,
                  child: IconButton(
                    color: Colors.white,
                    icon: const Icon(Icons.arrow_back),
                    iconSize: 25,
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ),
                Positioned(
                  bottom: -88,
                  // Nested CircleAvatars to create a border effect
                  child: CircleAvatar(
                    radius: 88,
                    backgroundColor: Colors.white,
                    child: CircleAvatar(
                      radius: 80,
                      // Stops errors being thrown if the player has no image
                      backgroundImage: selectedPlayer.image != ''
                          ? ExactAssetImage(selectedPlayer.image)
                          : null,
                      backgroundColor: Colors.blue[200],
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 110,
            ),
            Text(
              selectedPlayer.name,
              style: Theme.of(context).textTheme.headline4,
            ),
            const SizedBox(
              height: 10,
            ),
            PlayerInfoCard(
              age: selectedPlayer.age,
              height: selectedPlayer.height,
              grade: selectedPlayer.grade,
              position: selectedPlayer.position,
            ),
          ],
        ),
      ),
      // Button to add the currently viewed player to the list of favourites
      floatingActionButton: FloatingActionButton(
        onPressed: () => toggleFavourite(selectedPlayer.id),
        child: Icon(
          isFavourite(selectedPlayer.id) ? Icons.star : Icons.star_border,
        ),
        elevation: 8,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
