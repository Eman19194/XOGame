import 'package:flutter/material.dart';
import 'package:ox/MyButton.dart';

class XoScreen extends StatefulWidget {
  static const String routeName = 'xoScreen';

  @override
  State<XoScreen> createState() => _XoScreenState();
}

class _XoScreenState extends State<XoScreen> {
  List<String> boardstate = [
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
  ];
  int player1Score = 0;
  int player2Score = 0;
  @override
  Widget build(BuildContext context) {
    PlayersName args =
        ModalRoute.of(context)?.settings.arguments as PlayersName;
    return Scaffold(

      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.indigo, Colors.blue.shade400],
          ),
        ),
        child: Column(children: [
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  margin: EdgeInsets.only(top: 40,right: 20,left: 20,bottom: 20),
                  padding: EdgeInsets.all(10),
                  width: 150,
                  height: 150,
                  decoration: BoxDecoration(
                    color: Color(0xFF032A83), // Background color
                    borderRadius: BorderRadius.circular(15), // Border radius
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "$player1Score",
                        style: TextStyle(
                            color: Colors.amber,
                            fontSize: 30,
                            fontWeight: FontWeight.values.last),
                      ),
                      Text(
                        "${args.player1}",
                        style: TextStyle(color: Colors.white),
                      ), // Update to "Player 1"
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 40,right: 20,left: 20,bottom: 20),
                  padding: EdgeInsets.all(10),
                  width: 150,
                  height: 150,
                  decoration: BoxDecoration(
                    color: Color(0xFF032A83), // Background color
                    borderRadius: BorderRadius.circular(15), // Border radius
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "$player2Score",
                        style: TextStyle(
                            color: Colors.amber,
                            fontSize: 30,
                            fontWeight: FontWeight.values.last),
                      ), // Corrected to "Player 2"
                      Text(
                        "${args.player2}",
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                MyButton(
                  text: boardstate[0],
                  onButtonClick: onButtonClick,
                  index: 0,
                ),
                MyButton(
                  text: boardstate[1],
                  onButtonClick: onButtonClick,
                  index: 1,
                ),
                MyButton(
                  text: boardstate[2],
                  onButtonClick: onButtonClick,
                  index: 2,
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                MyButton(
                  text: boardstate[3],
                  onButtonClick: onButtonClick,
                  index: 3,
                ),
                MyButton(
                  text: boardstate[4],
                  onButtonClick: onButtonClick,
                  index: 4,
                ),
                MyButton(
                  text: boardstate[5],
                  onButtonClick: onButtonClick,
                  index: 5,
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                MyButton(
                  text: boardstate[6],
                  onButtonClick: onButtonClick,
                  index: 6,
                ),
                MyButton(
                  text: boardstate[7],
                  onButtonClick: onButtonClick,
                  index: 7,
                ),
                MyButton(
                  text: boardstate[8],
                  onButtonClick: onButtonClick,
                  index: 8,
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }

  int count = 0;

  void onButtonClick(int index) {
    if (boardstate[index].isNotEmpty) {
      return;
    }
    if (count % 2 == 0) {
      boardstate[index] = "X";
    } else {
      boardstate[index] = "O";
    }
    count++;
    if (checkWinner("X")) {
      player1Score++;
      initBoard();
    } else if (checkWinner("O")) {
      player2Score++;
      initBoard();
    } else if (count == 9) {
      initBoard();
    }
    setState(() {});
  }

  void initBoard() {
    boardstate = [
      '',
      '',
      '',
      '',
      '',
      '',
      '',
      '',
      '',
    ];
    count = 0;
  }

  bool checkWinner(String s) {
    // for Rows
    for (int i = 0; i < 9; i += 3) {
      if (boardstate[i] == s &&
          boardstate[i + 1] == s &&
          boardstate[i + 2] == s) {
        return true;
      }
    }
    //for columns
    for (int i = 0; i < 3; i++) {
      if (boardstate[i] == s &&
          boardstate[i + 3] == s &&
          boardstate[i + 6] == s) {
        return true;
      }
    }
    if (boardstate[0] == s && boardstate[4] == s && boardstate[8] == s) {
      return true;
    }
    if (boardstate[2] == s && boardstate[4] == s && boardstate[6] == s) {
      return true;
    }
    //diagonal
    return false;
  }
}

class PlayersName {
  String player1;
  String player2;
  PlayersName({required this.player1, required this.player2});
}
