import 'package:flutter/material.dart';
class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String equation="0";
  String result="0";
  String expression="";
  double equationFontSize=38.0;
  double resultFontSize=48.0;
  buttonPressed( String buttonText){
    setState(() {
        if(buttonText=="C"){
          equation="0";
          result="0";
        }
        else if(buttonText=="!"){
          equation=equation.substring(0,equation.length -1);
          if(equation==""){
            equation="0";
          }
        }
        else if(buttonText=="="){

        }
        else {
          if(equation=="0"){
            equation=buttonText;
          }
         else{
            equation= equation + buttonText;
          }
        }

    });

  }

  Widget buildButton(String buttonText, double buttonHeight, Color buttonColor){
    return Container(
      height: MediaQuery.of(context).size.height*0.1 * buttonHeight,
      color: buttonColor,
      child: FlatButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(0.0),
            side: BorderSide(
              color: Colors.white,
              width: 1,
              style: BorderStyle.solid,
            ),
          ),
          padding: EdgeInsets.all(16.0),
          onPressed: ()=>buttonPressed(buttonText),
          child: Text(buttonText,  style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.normal,
              fontSize: 30.0),)
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculator'),
        centerTitle: true,
      ),
      body:Column(
        children: <Widget>[
          Container(
            alignment: Alignment.centerRight,
            padding: EdgeInsets.fromLTRB(10, 20, 10, 0),
            child: Text(equation, style: TextStyle(fontSize: equationFontSize,color: Colors.white),),
          ), Container(
            alignment: Alignment.centerRight,
            padding: EdgeInsets.fromLTRB(10, 20, 10, 0),
            child: Text(result, style: TextStyle(fontSize: resultFontSize,color: Colors.white),),
          ),
          Expanded(
            child: Divider(color: Colors.white,thickness:1,),
          ),
          Row(
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width*.75,
                child: Table(
                  children: [
                    TableRow(
                      children: [
                        buildButton('C', 1, Colors.red[600]),
                        buildButton('!', 1, Colors.green[600]),
                        buildButton('/', 1, Colors.green[600])
                      ],
                    )  ,
                    TableRow(
                      children: [
                        buildButton('7', 1, Colors.red[600]),
                        buildButton('8', 1, Colors.black12),
                        buildButton('9', 1, Colors.black12)
                      ],
                    ),
                    TableRow(
                      children: [
                        buildButton('6', 1, Colors.red[600]),
                        buildButton('5', 1, Colors.black12),
                        buildButton('4', 1, Colors.black12)
                      ],
                    ),    TableRow(
                      children: [
                        buildButton('3', 1, Colors.red[600]),
                        buildButton('2', 1, Colors.black12),
                        buildButton('1', 1, Colors.black12)
                      ],
                    ), TableRow(
                      children: [
                        buildButton('.', 1, Colors.red[600]),
                        buildButton('0', 1, Colors.green[600]),
                        buildButton('00', 1, Colors.green[600])
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width*0.25,
                child: Table(
                  children: [
                    TableRow(
                      children: [
                        buildButton('x', 1, Colors.blue[600]),
                      ]
                    ) ,
                    TableRow(
                      children: [
                        buildButton('-', 1, Colors.blue[600]),
                      ]
                    ) ,   TableRow(
                      children: [
                        buildButton('+', 1, Colors.blue[600]),
                      ]
                    ) ,
                    TableRow(
                      children: [
                        buildButton('=', 2, Colors.blue[600]),
                      ]
                    ),

                  ],
                ),
              )
            ],
          )
        ],
      )
    );
  }
}
