import 'package:flutter/material.dart';
import 'package:pokemonapp/pokemon.dart';

class PokeDetail extends StatelessWidget {
  final Pokemon pokemon;

  PokeDetail({this.pokemon});

  bodyWidget(BuildContext context) => Stack(
        children: <Widget>[
          Positioned(
              height: MediaQuery.of(context).size.height / 1.5,
              width: MediaQuery.of(context).size.width - 20,
              left: 10.0,
              top: MediaQuery.of(context).size.height * 0.1,
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(100.0),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    SizedBox(
                      height: 90.0,
                    ),
                    Text(
                      pokemon.name,
                      style: TextStyle(
                          fontSize: 25.0, fontWeight: FontWeight.bold),
                    ),
                    Text("Height: ${pokemon.height}"),
                    Text("Weight: ${pokemon.weight}"),
                    Text("Types"),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: pokemon.type
                          .map((t) => FilterChip(
                              backgroundColor: Colors.amber,
                              label: Text(t),
                              onSelected: (b) {}))
                          .toList(),
                    ),
                    Text("Weakness"),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: pokemon.weaknesses
                          .map((t) => FilterChip(
                              backgroundColor: Colors.blueGrey,
                              label: Text(
                                t,
                                style: TextStyle(color: Colors.white),
                              ),
                              onSelected: (b) {}))
                          .toList(),
                    ),
                    Text("Next Evolution"),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: pokemon.nextEvolution
                          ?.map((n) => FilterChip(
                              backgroundColor: Colors.green,
                              label: Text(
                                n.name,
                                style: TextStyle(color: Colors.white),
                              ),
                              onSelected: (b) {}))
                          ?.toList()?? [Text('No more evolutions')],
                    ),
                  ],
                ),
              ),
            ),

            Align(
              alignment: Alignment.topCenter,
              child: Hero(
                tag: pokemon.img, 
                child: Container(
                  height: 200.0,
                  width: 200.0,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(pokemon.img)
                      )
                  ),
              )),
            )
        ],
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      appBar: AppBar(
        elevation: 0.0,
        title: Text(pokemon.name),
        backgroundColor: Colors.red,
      ),
      body: bodyWidget(context),
    );
  }
}
