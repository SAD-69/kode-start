import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../models/character.dart';
import '../widgets/custom_bar.dart';

class CharacterDetailPage extends StatelessWidget {
  final Character character;
  const CharacterDetailPage({super.key, required this.character});

  Color _getStatusColor(String status) {
    if (status.toLowerCase() == 'alive') {
      return Colors.green;
    } else if (status.toLowerCase() == 'dead') {
      return Colors.red;
    } else {
      return Colors.grey;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1C1B1F),
      appBar: CustomAppBar(
        showBackButton: true,
        onBack: () {
          Navigator.popUntil(context, (route) => route.isFirst);
        },
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(12.0),
        child: Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          clipBehavior: Clip.antiAlias,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Top image
              CachedNetworkImage(
                imageUrl: character.image,
                width: double.infinity,
                height: 200,
                fit: BoxFit.cover,
              ),

              // Info section
              Container(
                color: Color.fromARGB(255, 135, 161, 250),
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Name
                    Text(
                      character.name.toUpperCase(),
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 8),

                    // Status + species
                    Row(
                      children: [
                        Icon(Icons.circle,
                            size: 10, color: _getStatusColor(character.status)),
                        const SizedBox(width: 6),
                        Text(
                          '${character.status} - ${character.species}',
                          style: const TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),

                    // Gender
                    Text(
                      'Gender:',
                      style: TextStyle(color: Colors.white.withValues(alpha: .7)),
                    ),
                    Text(
                      character.gender,
                      style: const TextStyle(
                        color: Colors.white,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                    const SizedBox(height: 16),

                    // Origin
                    Text(
                      'Origin:',
                      style: TextStyle(color: Colors.white.withValues(alpha: .7)),
                    ),
                    Text(
                      character.origin,
                      style: const TextStyle(
                        color: Colors.white,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                    const SizedBox(height: 16),

                    // Last known location
                    Text(
                      'Last known location:',
                      style: TextStyle(color: Colors.white.withValues(alpha: .7)),
                    ),
                    Text(
                      character.location,
                      style: const TextStyle(
                        color: Colors.white,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                    const SizedBox(height: 16),

                    // First seen in
                    Text(
                      'First seen in:',
                      style: TextStyle(color: Colors.white.withValues(alpha: .7)),
                    ),
                    Text(
                      character.firstEpisode,
                      style: const TextStyle(
                        color: Colors.white,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
