import 'package:flutter/material.dart';

import '../../../domain/entities/message.dart';

class HerMessageBubble extends StatelessWidget {
  final Message message;
  const HerMessageBubble({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
              color: colors.secondary, borderRadius: BorderRadius.circular(20)),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text(
              message.text,
              style: const TextStyle(color: Colors.white),
            ),
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        ImageBubble(message.imageUrl!),
        const SizedBox(height: 10)
      ],
    );
  }
}

class ImageBubble extends StatelessWidget {
  final String imageUrl;
  const ImageBubble(this.imageUrl, {super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: Image.network(
        imageUrl,
        width: size.width - 100,
        height: 230,
        fit: BoxFit.cover,
        loadingBuilder: (context, child, loadingProgress) {
          if (loadingProgress == null) return child;

          return Container(
            width: size.width - 100,
            height: 230,
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: const Text(
              "Name esta enviando una imagen..",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.w400),
            ),
          );
        },
      ),
    );
  }
}
