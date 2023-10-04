import 'package:flutter/material.dart';
import 'package:ox/XoScreen.dart';

class PlayerScreen extends StatefulWidget {
  static const String routeName = "PlayersScreen";

  @override
  State<PlayerScreen> createState() => _PlayerScreenState();
}

class _PlayerScreenState extends State<PlayerScreen> {
  String player1 = "";

  String player2 = "";
  final p1 = TextEditingController();
  bool validatep1 = false;
  final p2 = TextEditingController();

  bool validatep2 = false;
  @override
  void dispose() {
    p1.dispose();
    p2.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.indigo, Colors.blue.shade400],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Enter Player Name",style: TextStyle(color:Colors.amber,fontSize: 30,
                fontWeight: FontWeight.values.last),),
            Padding(
              padding: const EdgeInsets.only(left: 40,top: 40),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: Text("X",style: TextStyle(color:Colors.amber,fontSize: 50,
                        fontWeight: FontWeight.values.last),),
                  ),
                  Text("Player1",style: TextStyle(color:Colors.white,fontSize: 25,
                      fontWeight: FontWeight.values.last),)

                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 40, right: 40),
              child: TextField(
                controller: p1,
                decoration: InputDecoration(
                  hintText: 'Enter Player1 name',
                  errorText: validatep1 ? 'this field is Required' : null,
                    fillColor: Colors.white, // Set the background color
                    filled: true,
                  border: OutlineInputBorder( // Border style
                    borderRadius: BorderRadius.circular(10), // Border radius// Border color
                  ),

                ),
                onChanged: (text) {
                  player1 = text;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 40,top: 10),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: Text("O",style: TextStyle(color:Colors.amber,fontSize: 50,
                        fontWeight: FontWeight.values.last),),
                  ),
                  Text("Player2",style: TextStyle(color:Colors.white,fontSize: 25,
                      fontWeight: FontWeight.values.last),)

                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 40, right: 40,bottom: 10),
              child: TextField(
                controller: p2,
                decoration: InputDecoration(
                  hintText: 'Enter Player2 name',
                  errorText: validatep2 ? 'this field is Required' : null,
                    fillColor: Colors.white, // Set the background color
                    filled: true,
                  border: OutlineInputBorder( // Border style
                    borderRadius: BorderRadius.circular(10.0), // Border radius
                    // Border color
                  ),
                ),
                onChanged: (text) {
                  player2 = text;
                },
              ),
            ),
             ElevatedButton(
                  onPressed: () {
                    setState(() {
                      p1.text.isEmpty ? validatep1 = true : validatep1 = false;
                      p2.text.isEmpty ? validatep2 = true : validatep2 = false;

                    });
                    if (!validatep1 && !validatep2) {
                      Navigator.of(context).pushNamed(XoScreen.routeName, arguments: PlayersName(player1: player1, player2: player2));
                    }
                    // Navigator.of(context).pushNamed(XoScreen.routeName,
                    //     arguments:
                    //         PlayersName(player1: player1, player2: player2));
                  },
                 style:ElevatedButton.styleFrom(
                   backgroundColor: Colors.amber,),
                  child: Text("Start Game",style: TextStyle(fontSize: 25),)),
          ],
        ),
      ),
    );
  }
}
