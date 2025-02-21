import 'package:flutter/material.dart';
import 'package:pokedex_graphql/domain/models.dart';
import 'package:pokedex_graphql/presentation/core/theme/colors.dart';
import 'package:pokedex_graphql/utils/string_extension.dart';

class AboutTab extends StatelessWidget {
  const AboutTab({
    super.key,
    required this.pokemon
  });

  final Pokemon pokemon;

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 15,
      children: [
        const SizedBox(height: 5),
        Text.rich(
          TextSpan(
            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w700
            ),
            children: [
              const TextSpan(text: '#', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w300)),
              TextSpan(text: pokemon.id.toString().padLeft(3, '0')),
              const TextSpan(text: ' - ', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w300)),
              TextSpan(text: pokemon.name.capitalize()),
            ]
          ),
        ),
        Row(
          spacing: 10,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _PropertyChip(
              title: 'Weight',
              description: 'Kilog.',
              value: pokemon.weight,
              icon: Icons.scale
            ),
            const SizedBox(height: 55, child: VerticalDivider(thickness: 0.5, color: Colors.black45)),
            _PropertyChip(
              title: 'Height',
              description: 'Meters',
              value: pokemon.height,
              icon: Icons.height
            )
          ],
        )
      ]
    );
  }
}

class _PropertyChip extends StatelessWidget {
  const _PropertyChip({
    required this.title,
    required this.description,
    required this.value,
    required this.icon
  });

  final String title;
  final String description;
  final double value;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 4,
      children: [
        Row(
          spacing: 2,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon),
            Text(
              title,
              style: const TextStyle(fontSize: 18),
            )
          ],
        ),
        Container(
          padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
          decoration: BoxDecoration(
            color: AppColors.highlight,
            border: Border.all(),
            borderRadius: BorderRadius.circular(15),
            boxShadow: const [BoxShadow(offset: Offset(2, 2))]
          ),
          child: Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: (value / 10).toString(),
                  style: const TextStyle(                        
                    fontSize: 16,
                    fontWeight: FontWeight.w900
                  )
                ),
                TextSpan(text: ' $description')
              ]
            )
          )
        )
      ]
    );
  }
}
