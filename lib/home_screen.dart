

import 'package:flutter/material.dart';
import 'dart:math';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
  
    final List<Map<String, dynamic>> books = List.generate(10, (index) {
      final random = Random();
      return {
        'title': 'Book Title $index',
        'author': 'Author $index',
        'rating': (3.0 + random.nextDouble() * 2.0).toStringAsFixed(1),
        'description': 'Description of Book $index',
        
        'image': 'https://unsplash.com/photos/qXuMWgoga6Q',
      };
    });

    return Scaffold(
      appBar: AppBar(
        title: Text('My Book List'),
      ),
      body: ListView.builder(
        itemCount: books.length,
        itemBuilder: (context, index) {
          final book = books[index];
          return ListTile(
            leading: Image.network(book['image']),
            title: Text(book['title']),
            subtitle: Text('Author: ${book['author']}'),
            trailing: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Rating: ${book['rating']}'),
              ],
            ),
            onTap: () {
              
            },
          );
        },
      ),
    );
  }
}
