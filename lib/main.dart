import 'package:flutter/material.dart';
import 'package:scratcher/scratcher.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: AppBody(),
      ),
    );
  }
}

class AppBody extends StatelessWidget {
  double _opacity = 0.0;

  Future<void> scratchCardDialog(BuildContext context) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
          title: Align(
            alignment: Alignment.center,
            child: Text(
              'You\'ve won a scratch card',
              style: TextStyle(
                  color: Colors.amber,
                  fontWeight: FontWeight.bold,
                  fontSize: 18),
            ),
          ),
          content: StatefulBuilder(builder: (context, StateSetter setState) {
            
            return Scratcher(
              accuracy: ScratchAccuracy.low,
              threshold: 25,
              brushSize: 50,
              onThreshold: () {
                setState(() {
                  _opacity = 1;
                });
              },
              image: Image.network(
                "https://media.istockphoto.com/vectors/present-box-with-ribbon-shining-gift-with-stars-surprising-big-gift-vector-id968383730?k=6&m=968383730&s=612x612&w=0&h=Dd-iuVSSYzN9gmRO8BdX5yttslaVTwRVVSz9gPJ3sHc="
              ),
              child: AnimatedOpacity(
                duration: Duration(milliseconds: 250),
                opacity: _opacity,
                child: Container(
                  height: 300,
                  width: 300,
                  alignment: Alignment.center,
                  child: Text(
                    "200\£",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 50,
                        color: Colors.amber
                      ),
                  ),
                ),
              ),
            );
          }),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: FlatButton(
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 35),
        shape: OutlineInputBorder(
          borderRadius: BorderRadius.circular(35),
          borderSide: BorderSide.none,
        ),
        color: Colors.amber,
        child: Text(
          "Get A ScratchCard",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 25,
          ),
        ),
        onPressed: () => scratchCardDialog(context),
      ),
    );
  }
}