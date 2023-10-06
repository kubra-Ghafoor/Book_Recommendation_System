import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_authentication/header.dart';
import 'package:http/http.dart' as http;

import 'book.dart';

class Search extends StatefulWidget {
  final name;

  const Search({super.key, required this.name});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  Future getData(String name) async {
    final uri = 'http://127.0.0.1:5000//search/$name';
    final res = await http.get(Uri.parse(uri));
    final data = json.decode(res.body);
    print('name $data');
    return data;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FutureBuilder(
      future: getData(widget.name),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator.adaptive());
        }
        final data = snapshot.data!;
        print('data $data');
        return SingleChildScrollView(
          child: Column(
            children: [
              const Header(),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
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
                              onPressed: () {},
                            )),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Flexible(
                      child: ListView.builder(
                        itemCount: 5,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return Book(
                              title: data[index][0],
                              author: data[index][1],
                              image: data[index][2],
                              votes: data[index][3],
                              rating: data[index][4]);
                        },
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        );
      },
    ));
  }
}
