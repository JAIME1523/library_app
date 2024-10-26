
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

class ImageSelect extends StatelessWidget {
  const ImageSelect({super.key, 
    required this.image,
  });

  final String image;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Image.network(
        fit: BoxFit.cover,
        width: 120,
        image,
        errorBuilder: (context, error, stackTrace) {
          return const Icon(
            Icons.not_interested_sharp,
            color: Colors.red,
            size: 50,
          );
        },
        loadingBuilder: (context, child, loadingProgress) {
          if (loadingProgress != null) {
            return const Padding(
              padding: EdgeInsets.all(8.0),
              child: Center(
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                ),
              ),
            );
          }
          return FadeIn(child: child);
        },
      ),
    );
  }
}