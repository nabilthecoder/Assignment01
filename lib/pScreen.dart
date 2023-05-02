// ignore_for_file: file_names

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

// ignore: use_key_in_widget_constructors
class PScreen extends StatefulWidget {
  @override
  // ignore: library_private_types_in_public_api
  _PScreenState createState() => _PScreenState();
}

class _PScreenState extends State<PScreen> {
  Map<String, dynamic> _profileData = {};

  @override
  void initState() {
    super.initState();
    _fetchProfileData();
  }

  Future<void> _fetchProfileData() async {
    final response = await http
        .get(Uri.parse('https://jsonplaceholder.typicode.com/comments/2'));
    final data = jsonDecode(response.body) as Map<String, dynamic>;
    setState(() {
      _profileData = data;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: const Text('Profile'),
        centerTitle: true,
        backgroundColor: Colors.teal,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10),
        child: Center(
          child: _profileData.isEmpty
              ? const CircularProgressIndicator()
              : Column(
                  children: [
                    const SizedBox(height: 80),
                    const CircleAvatar(
                      radius: 60,
                      child: Icon(
                        Icons.person,
                        size: 70,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Container(
                      padding: const EdgeInsets.only(left: 40, right: 40),
                      child: Text(
                        _profileData['name'],
                        style: const TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      _profileData['email'],
                      style: const TextStyle(fontSize: 18),
                    ),
                    const SizedBox(height: 32),
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 32),
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 1,
                            blurRadius: 5,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Text(
                        _profileData['body'],
                        textAlign: TextAlign.center,
                        style: const TextStyle(fontSize: 18),
                      ),
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}
