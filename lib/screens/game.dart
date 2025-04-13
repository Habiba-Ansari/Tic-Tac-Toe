import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import "../constants/colors.dart";

class GameScreen extends StatefulWidget {
  const GameScreen({super.key});
  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  bool xTurn = true;
  List<String> displayXO = ['', '', '', '', '', '', '', '', ''];
  String resultDeclaration = '';
  List<int> matchedIndexes = [];

  int oScore = 0;
  int xScore = 0;
  int filledBoxes = 0;
  bool winnerFound = false;

    static var customFontWithMe = GoogleFonts.coiny(
    textStyle: TextStyle(
      color: Colors.white,
      letterSpacing: 3,
      fontSize: 28,
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MainColor.primaryColor,
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: Container(child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text('Player O', style: customFontWithMe,),
                      Text(oScore.toString(), style: customFontWithMe,),
                    ],
                  ),
                  SizedBox(width: 20),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text('Player X', style: customFontWithMe,),
                      Text(xScore.toString(), style: customFontWithMe,),
                    ],
                  ),
                ],
              ),
              )
            ),
            Expanded(
              flex: 3,
              child: GridView.builder(
                gridDelegate:
                    SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
                itemCount: 9,
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () {
                      _tapped(index);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(
                          width: 5,
                          color: MainColor.primaryColor,
                        ),
                        color: matchedIndexes.contains(index)
                        ? MainColor.accentColor
                        : MainColor.secondaryColor,
                      ),
                      child: Center(
                        child: Text(
                          displayXO[index],
                          style: GoogleFonts.coiny(
                            textStyle: TextStyle(
                                fontSize: 64, color: MainColor.primaryColor),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            Expanded(
              flex: 2, 
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(resultDeclaration, style: customFontWithMe),
                    SizedBox(height: 10),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        padding: EdgeInsets.symmetric(
                          horizontal: 32, vertical: 16
                        )
                      ),
                      onPressed: () {
                        _clearBoard();
                    }, child: Text('Play Agian',
                    style: TextStyle(fontSize: 20, color: Colors.black)
                    ),
                    )
                  ],
                ),
              )
            ),
          ],
        ),
      ),
    );
  }

  void _tapped(int index) {
    setState(() {
      if (xTurn && displayXO[index] == '') {
        displayXO[index] = 'X';
       filledBoxes++;
      } else if (!xTurn && displayXO[index] == '') {
        displayXO[index] = 'O';
        filledBoxes++;
      }
      xTurn = !xTurn;
      _checkWinner();
    });
  }

  void _checkWinner() {
    // Row checks
    if (displayXO[0] == displayXO[1] &&
        displayXO[0] == displayXO[2] &&
        displayXO[0] != '') {
      setState(() {
        resultDeclaration = "Player ${displayXO[0]} Wins!";
        matchedIndexes.addAll([0, 1, 2]);
        _updateScore(displayXO[0]);
         winnerFound = true;
      });
    }

    if (displayXO[3] == displayXO[4] &&
        displayXO[3] == displayXO[5] &&
        displayXO[3] != '') {
      setState(() {
        resultDeclaration = "Player ${displayXO[3]} Wins!";
        matchedIndexes.addAll([3, 4, 5]);
        _updateScore(displayXO[3]);
         winnerFound = true;
      });
    }

    if (displayXO[6] == displayXO[7] &&
        displayXO[6] == displayXO[8] &&
        displayXO[6] != '') {
      setState(() {
        resultDeclaration = "Player ${displayXO[6]} Wins!";
        matchedIndexes.addAll([6, 7, 8]);
        _updateScore(displayXO[6]);
         winnerFound = true;
      });
    }

    // Column checks
    if (displayXO[0] == displayXO[3] &&
        displayXO[0] == displayXO[6] &&
        displayXO[0] != '') {
      setState(() {
        resultDeclaration = "Player ${displayXO[0]} Wins!";
        matchedIndexes.addAll([0, 3, 6]);
        _updateScore(displayXO[0]);
         winnerFound = true;
      });
    }

    if (displayXO[1] == displayXO[4] &&
        displayXO[1] == displayXO[7] &&
        displayXO[1] != '') {
      setState(() {
        resultDeclaration = "Player ${displayXO[1]} Wins!";
        matchedIndexes.addAll([1, 4, 7]);
        _updateScore(displayXO[1]);
         winnerFound = true;
      });
    }

    if (displayXO[2] == displayXO[5] &&
        displayXO[2] == displayXO[8] &&
        displayXO[2] != '') {
      setState(() {
        resultDeclaration = "Player ${displayXO[2]} Wins!";
        matchedIndexes.addAll([2, 5, 8]);
        _updateScore(displayXO[2]);
         winnerFound = true;
      });
    }

    // Diagonal checks
    if (displayXO[0] == displayXO[4] &&
        displayXO[0] == displayXO[8] &&
        displayXO[0] != '') {
      setState(() {
        resultDeclaration = "Player ${displayXO[0]} Wins!";
        matchedIndexes.addAll([0, 4, 8]);
        _updateScore(displayXO[0]);
         winnerFound = true;
      });
    }

    if (displayXO[2] == displayXO[4] &&
        displayXO[2] == displayXO[6] &&
        displayXO[2] != '') {
      setState(() {
        resultDeclaration = "Player ${displayXO[2]} Wins!";
        matchedIndexes.addAll([2, 4, 6]);
        _updateScore(displayXO[2]);
         winnerFound = true;
      });
    }
    
    if (filledBoxes == 9 && !winnerFound) {
      setState(() {
        resultDeclaration = 'Nobody wins!';
      });
    }
  }

  void _updateScore (String winner) {
    if (winner == 'O') {
      oScore++;
    } else if (winner == 'X'){
      xScore++;
    }
  }

  void _clearBoard() {
    setState(() {
      for (int i=0; i<9; i++){
        displayXO[i]= '';
      }
      resultDeclaration = '';
      matchedIndexes.clear();
      filledBoxes = 0;
      filledBoxes = 0;
    });
    
  }
}
