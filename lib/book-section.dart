import 'package:flutter/material.dart';
import 'package:flutter_authentication/book.dart';

class Section extends StatelessWidget {
  String title;
  List titles;
  List authors;
  List rating;
  List images;
  List votes;
  Section({
    super.key,
    required this.title,
    required this.authors,
    required this.images,
    required this.rating,
    required this.votes,
    required this.titles,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 480,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 20,
              color: Colors.purple[900],
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Expanded(
            child: ListView.separated(
              itemCount: 10,
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Book(
                  title: titles[index],
                  author: authors[index],
                  votes: votes[index],
                  rating: rating[index],
                  image: images[index],
                );
              },
              separatorBuilder: (context, index) {
                return const SizedBox(
                    width: 10); // Set your desired gap height here
              },
            ),
          ),
        ],
      ),
    );
  }
}
