import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_authentication/header.dart';
import 'package:http/http.dart' as http;

import 'book.dart';

// ignore: must_be_immutable
class Search extends StatefulWidget {
  String name;

  Search({super.key, required this.name});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  final _controller = TextEditingController();
  Future getData(String name) async {
    final uri = 'http://127.0.0.1:5000//search/$name';
    final res = await http.get(Uri.parse(uri));
    final data = json.decode(res.body);
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
        final List data = snapshot.data!;
        return SingleChildScrollView(
          child: Column(
            children: [
              Header(),
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
                        controller: _controller,
                        onSubmitted: (value) {
                          setState(() {
                            widget.name = value;
                          });
                        },
                        decoration: InputDecoration(
                          hintText: "Enter book name to search..",
                          hintStyle: const TextStyle(color: Colors.grey),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: BorderSide.none),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Flexible(
                      child: ListView.builder(
                        itemCount: data.length,
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
