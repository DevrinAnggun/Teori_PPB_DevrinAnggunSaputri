import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  final List<Map<String, String>> apps = [
    {'title': 'Native App', 'detail': 'Kotlin, Swift, Java'},
    {'title': 'Hybrid App', 'detail': 'Android, iOS, Web\nJavascript, Dart'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ListView Dialog Example'),
      ),
      body: ListView.builder(
        itemCount: apps.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: CircleAvatar(
              backgroundColor: index == 0 ? Colors.red : Colors.grey,
            ),
            title: Text(apps[index]['title']!),
            onTap: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text('Detail'),
                    content: RichText(
                      text: TextSpan(
                        text: '',
                        style: DefaultTextStyle.of(context).style,
                        children: <TextSpan>[
                          TextSpan(
                            text: apps[index]['title']! + ": ",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.blue, // Warna khusus untuk judul
                              fontSize: 16,
                            ),
                          ),
                          TextSpan(
                            text: "\n\n" + apps[index]['detail']!,
                            style: TextStyle(color: Colors.black), // Warna teks normal
                          ),
                        ],
                      ),
                    ),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Text('Close'),
                      ),
                    ],
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}
