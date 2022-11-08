import 'package:flutter/material.dart';

void main() => runApp(const MovieApp());

class MovieApp extends StatelessWidget with ConsumerWidget {
  const MovieApp({super.key});

  @override
  Widget build(
    BuildContext context,
  ) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Movie List'),
        ),
        body: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: 5,
                itemBuilder: (BuildContext context, int index) {
                  return const ListTile(
                      leading: Icon(Icons.list),
                      trailing: Text(
                        "GFG",
                        style: TextStyle(color: Colors.black, fontSize: 15),
                      ),
                      title: Text("List item"));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
