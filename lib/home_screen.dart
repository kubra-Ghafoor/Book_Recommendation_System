import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_authentication/search_screen.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_authentication/book-section.dart';
import 'header.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    Future<Map<String, dynamic>> getData() async {
      const uri = 'http://127.0.0.1:5000/';
      final res = await http.get(Uri.parse(uri));
      final data = json.decode(res.body);
      return data;
    }

    return Scaffold(
        body: FutureBuilder(
      future: getData(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator.adaptive());
        }
        final data = snapshot.data!;
        final List titles = data['titles'];
        final List authors = data['authors'];
        final List rating = data['rating'];
        final List votes = data['votes'];
        final List images = data['images'];
        return SingleChildScrollView(
          child: Column(
            children: [
              const Header(),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    Card(
                      elevation: 8,
                      shape: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide.none),
                      child: TextField(
                        decoration: InputDecoration(
                            hintText: "Enter book name to search..",
                            hintStyle: const TextStyle(color: Colors.grey),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide: BorderSide.none),
                            suffixIcon: IconButton(
                              icon: const Icon(Icons.search),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const Search(name: '1984')),
                                );
                              },
                            )),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Text(
                      'Top 20 books',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.purple[900],
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Section(
                      title: 'Top 10',
                      titles: titles.sublist(0, 10),
                      authors: authors.sublist(0, 10),
                      votes: votes.sublist(0, 10),
                      rating: rating.sublist(0, 10),
                      images: images.sublist(0, 10),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Section(
                      title: '11-20',
                      titles: titles.sublist(10, 20),
                      authors: authors.sublist(10, 20),
                      votes: votes.sublist(10, 20),
                      rating: rating.sublist(10, 20),
                      images: images.sublist(10, 20),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    ));
  }
}
