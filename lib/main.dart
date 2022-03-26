import 'package:flutter/material.dart';
import 'package:tezxt/service.dart';

import 'model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  submitForm() async {
    ApiService _apiService = ApiService();
    List<Users> eachposts = await _apiService.fetchUsers();
    return eachposts;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Scaffold(
        body: FutureBuilder<dynamic>(
          future: submitForm(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                      leading: const CircleAvatar(
                        backgroundColor: Colors.green,
                      ),
                      title: Text(
                        "${snapshot.data![index].title}",
                        style:
                            const TextStyle(color: Colors.green, fontSize: 15),
                      ),
                    );
                  });
            } else if (snapshot.hasError) {
              return Text('${snapshot.error}');
            }
            return const CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}
