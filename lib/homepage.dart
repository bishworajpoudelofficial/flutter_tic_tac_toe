// ignore_for_file: unnecessary_this

import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //  To add Icon Image
  // ignore: prefer_const_constructors
  var cross = Icon(
    Icons.cancel,
    size: 80,
  );
  // ignore: prefer_const_constructors
  var circle = Icon(
    Icons.circle,
    size: 80,
  );
  // ignore: prefer_const_constructors
  var edit = Icon(
    Icons.edit,
    size: 80,
  );

  bool isCross = true;
  late String message;
  late List<String> gameState;

  // Initialize Box With Empty Value
  @override
  void initState() {
    gameState = List.filled(9, "empty");
    message = "";
    super.initState();
  }

  // To Play Game
  playGame(int index) {
    if (gameState[index] == "empty") {
      setState(() {
        if (isCross) {
          gameState[index] = "cross";
        } else {
          gameState[index] = "circle";
        }
        isCross = !isCross;
        checkWin();
      });
    }
  }

// Reset Game

  resetGame() {
    setState(() {
      gameState = List.filled(9, "empty");
      message = "";
    });
  }

// To Get Icon Image
   getIcon(String title) {
    switch (title) {
      case ('empty'):
        return edit;

      case ('cross'):
        return cross;

      case ('circle'):
        return circle;
    }
  }

// To Check For Winning
  checkWin() {
    if((gameState[0] != "empty") && 
      (gameState[0] == gameState[1]) &&
      (gameState[1] == gameState[2])){
        setState(() {
          this.message = this.gameState[0] + 'Win';
        });
      }else if((gameState[3] != "empty") && 
      (gameState[3] == gameState[4]) &&
      (gameState[4] == gameState[5])){
        setState(() {
          this.message = this.gameState[3] + 'Win';
        });
      }else if((gameState[6] != "empty") && 
      (gameState[6] == gameState[7]) &&
      (gameState[7] == gameState[8])){
        setState(() {
          this.message = this.gameState[6] + 'Win';
        });
      }else if((gameState[0] != "empty") && 
      (gameState[0] == gameState[3]) &&
      (gameState[3] == gameState[6])){
        setState(() {
          this.message = this.gameState[0] + 'Win';
        });
      }else if((gameState[1] != "empty") && 
      (gameState[1] == gameState[4]) &&
      (gameState[4] == gameState[7])){
        setState(() {
          this.message = this.gameState[1] + 'Win';
        });
      }else if((gameState[2] != "empty") && 
      (gameState[2] == gameState[5]) &&
      (gameState[5] == gameState[8])){
        setState(() {
          this.message = this.gameState[2] + 'Win';
        });
      }else if((gameState[0] != "empty") && 
      (gameState[0] == gameState[4]) &&
      (gameState[4] == gameState[8])){
        setState(() {
          this.message = this.gameState[0] + 'Win';
        });
      }else if((gameState[2] != "empty") && 
      (gameState[2] == gameState[4]) &&
      (gameState[4] == gameState[6])){
        setState(() {
          this.message = this.gameState[2] + 'Win';
        });
      }else if(!gameState.contains("empty")){
        setState(() {
          message = "Game Draw";
        });
      }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tic Tac Toe"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: GridView.builder(
                padding: const EdgeInsets.all(10),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    childAspectRatio: 1.0,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10),
                itemCount: gameState.length,
                itemBuilder: (context, i) => SizedBox(
                      width: 100,
                      height: 100,
                      child: MaterialButton(
                          onPressed: () {
                            this.playGame(i);
                          },
                          child: getIcon(this.gameState[i])),
                    )),
          ),
          Text(message, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 25),),
          MaterialButton(
            color: Colors.blue[800],
            minWidth: 200,
            onPressed: () {
              resetGame();
            },
            child: const Text(
              "Reset Game",
              style: TextStyle(color: Colors.white),
            ),
          ),
          const SizedBox(height: 100,),
          const Text("#FlutterWithBRP")
        ],
      ),
    );
  }
}
