import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tic Tac Toe',
      home: TicTacToe(),
    );
  }
}

class TicTacToe extends StatefulWidget {
  @override
  _TicTacToeState createState() => _TicTacToeState();
}

class _TicTacToeState extends State<TicTacToe> {
  List<List<String>> _grid = [
    ['', '', ''],
    ['', '', ''],
    ['', '', '']
  ];
  void _reset() {
    setState(() {
      _grid = [
        ['', '', ''],
        ['', '', ''],
        ['', '', '']
      ];
      _turn = 'X';
    });
  }

  String _turn = 'X';

  void _playTurn(int row, int col) {
    setState(() {
      if (_grid[row][col] == '') {
        _grid[row][col] = _turn;
        _turn = (_turn == 'X') ? 'O' : 'X';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tic Tac Toe'),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Expanded(
              child: GridView.builder(
                padding: EdgeInsets.all(10.0),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  childAspectRatio: 1.0,
                  crossAxisSpacing: 10.0,
                  mainAxisSpacing: 10.0,
                ),
                itemCount: 9,
                itemBuilder: (context, index) {
                  int row = index ~/ 3;
                  int col = index % 3;
                  return GestureDetector(
                    onTap: () => _playTurn(row, col),
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 1.0,
                          // color: Colors.grey[500],
                        ),
                      ),
                      child: Center(
                        child: Text(
                          _grid[row][col],
                          style: TextStyle(
                            fontSize: 30.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 10.0),
              child: ElevatedButton(
                onPressed: _reset,
                child: Text('Reset'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
