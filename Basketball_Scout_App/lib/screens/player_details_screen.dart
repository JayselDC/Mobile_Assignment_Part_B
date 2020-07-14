import 'package:Basketball_Scout_App/dummy_data.dart';
import 'package:flutter/material.dart';

class PlayerDetailsScreen extends StatelessWidget {
  static const route = '/player-details';

  final Function toggleFavourite;
  final Function isFavourite;

  const PlayerDetailsScreen(this.toggleFavourite, this.isFavourite);

  shortenedPositionName(String posName) {
    if (posName == 'Point Guard') {
      return 'PG';
    }
    if (posName == 'Shooting Guard') {
      return 'SG';
    }
    if (posName == 'Small Forward') {
      return 'SF';
    }
    if (posName == 'Power Forward') {
      return 'PF';
    }
    if (posName == 'Center') {
      return 'C';
    }
  }

  @override
  Widget build(BuildContext context) {
    final id = ModalRoute.of(context).settings.arguments as String;
    final selectedPlayer =
        DUMMY_PLAYERS.firstWhere((player) => player.id == id);

    Widget cardRowBuilder(String text, String subText) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          SizedBox(
            height: 5,
          ),
          Text(
            text,
            style: TextStyle(fontSize: 58),
          ),
          Text(
            subText,
            style: TextStyle(fontSize: 24, color: Colors.grey),
          )
        ],
      );
    }

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Stack(
              overflow: Overflow.visible,
              alignment: Alignment.center,
              children: <Widget>[
                Container(
                  height: 250,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Theme.of(context).accentColor,
                        Theme.of(context).primaryColor,
                      ],
                      begin: FractionalOffset.bottomCenter,
                      end: FractionalOffset.topCenter,
                      stops: [0, 0.9],
                    ),
                  ),
                ),
                Positioned(
                  top: 30,
                  left: 5,
                  child: IconButton(
                    color: Colors.white,
                    icon: Icon(Icons.arrow_back),
                    iconSize: 25,
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ),
                Positioned(
                  bottom: -88,
                  child: CircleAvatar(
                    radius: 88,
                    backgroundColor: Colors.white,
                    child: CircleAvatar(
                      radius: 80,
                      backgroundImage: ExactAssetImage(selectedPlayer.image),
                      backgroundColor: Colors.blue[200],
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 110,
            ),
            Text(
              selectedPlayer.name,
              style: Theme.of(context).textTheme.headline4,
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              height: 95,
              width: 400,
              child: Center(
                child: Card(
                  elevation: 8,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      cardRowBuilder(
                          selectedPlayer.age.toString(), 'Years Old'),
                      cardRowBuilder(
                          shortenedPositionName(selectedPlayer.position),
                          'Position'),
                      cardRowBuilder(
                          selectedPlayer.height.toString(), 'Height'),
                      cardRowBuilder(selectedPlayer.grade, 'Class'),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
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
