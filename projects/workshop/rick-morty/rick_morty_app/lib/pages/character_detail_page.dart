import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../models/character.dart';

class CharacterDetailPage extends StatelessWidget {
  final Character character;
  const CharacterDetailPage({super.key, required this.character});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(character.name)),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CachedNetworkImage(
              imageUrl: character.image,
              height: 300,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            ListTile(title: Text('Espécie'), subtitle: Text(character.species)),
            ListTile(title: Text('Gênero'), subtitle: Text(character.gender)),
            ListTile(title: Text('Status'), subtitle: Text(character.status)),
            ListTile(title: Text('Origem'), subtitle: Text(character.origin)),
            ListTile(title: Text('Última localização'), subtitle: Text(character.location)),
            ListTile(title: Text('Primeira aparição'), subtitle: Text(character.firstEpisode)),
          ],
        ),
      ),
    );
  }
}
