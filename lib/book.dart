import 'package:flutter/material.dart';

class Book extends StatelessWidget {
  final title;
  final image;
  final votes;
  final rating;
  final author;
  const Book({
    super.key,
    required this.title,
    required this.author,
    required this.image,
    required this.votes,
    required this.rating,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200,
      child: Card(
        elevation: 5,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(
                    image,
                    // width: double.infinity,
                    height: 250,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                title,
                style: const TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: 15,
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                author,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.grey[600],
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              Row(
                children: [
                  const Icon(Icons.star_border),
                  Text(
                    rating.toStringAsFixed(2),
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    '${votes.toString()} Reviews',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.grey,
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
