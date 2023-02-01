import 'package:flutter/material.dart';
import 'package:paddy/data/friend_model.dart';
import 'package:paddy/data/friend_repository.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Friend> listOfFriends = FriendsRepo().friends;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Friends"),
      ),
      body: ListView.builder(
        itemCount: listOfFriends.length,
        itemBuilder: ((context, index) {
          return listOfItem(listOfFriends[index]);
        }),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  Widget listOfItem(Friend friend) {
    return ListTile(
      leading: CircleAvatar(
          backgroundImage: AssetImage(
        friend.image,
      )),
      title: Text(friend.name),
      subtitle: Text(friend.email),
      trailing: Icon(
        friend.fav ? Icons.star : Icons.star_border,
        color: Color.fromARGB(255, 240, 219, 33),
      ),
    );
  }
}
