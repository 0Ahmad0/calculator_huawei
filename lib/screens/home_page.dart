import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  String text = '0';
  double number1 = 0.0;
  double number2 = 0.0;

  String result = '0';
  String finalResult = '0';

  String opreation = '';
  String preOprtation = '';

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Color wButton = Color(0xFFFFFFFF);
  Color gButton = Color(0xFFF5F5F5);


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: double.infinity,
            height: 150.0,
            decoration: BoxDecoration(color: Color(0xFFFAFAFA)),
            child: Center(
              child: Text(
                widget.text,
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      Expanded(
                        child: Row(
                          children: [
                            ButtonText(
                              color: gButton,
                              text: 'mc',
                            ),
                            ButtonText(
                              color: gButton,
                              text: 'm+',
                            ),
                            ButtonText(
                              color: gButton,
                              text: 'm-',
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Row(
                          children: [
                            ButtonText(
                              color: gButton,
                              text: 'C',
                              textColor: Color(0xFF596FE1),
                            ),
                            ButtonText(
                              color: gButton,
                              text: '÷',
                              textColor: Color(0xFF596FE1),
                            ),
                            ButtonText(
                              color: gButton,
                              text: 'x',
                              textColor: Color(0xFF596FE1)
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Row(
                          children: [
                            ButtonText(
                              color: wButton,
                              text: '7',
                            ),
                            ButtonText(
                              color: wButton,
                              text: '8',
                            ),
                            ButtonText(
                              color: wButton,
                              text: '9',
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Row(
                          children: [
                            ButtonText(
                              color: wButton,
                              text: '4',
                            ),
                            ButtonText(
                              color: wButton,
                              text: '5',
                            ),
                            ButtonText(
                              color: wButton,
                              text: '6',
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Row(
                          children: [
                            ButtonText(
                              color: wButton,
                              text: '1',
                            ),
                            ButtonText(
                              color: wButton,
                              text: '2',
                            ),
                            ButtonText(
                              color: wButton,
                              text: '3',
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Row(
                          children: [
                            ButtonText(
                              color: wButton,
                              text: '%',
                            ),
                            ButtonText(
                              color: wButton,
                              text: '0',
                            ),
                            ButtonText(
                              color: wButton,
                              text: '.',
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Column(
                  children: [
                    ButtonText(
                      color: gButton,
                      text: 'mr',
                    ),
                    ButtonText(
                      color: gButton,
                      text: 'del',
                      textColor: Color(0xFF596FE1),
                    ),
                    ButtonText(
                      color: gButton,
                      text: '-',
                      textColor: Color(0xFF596FE1),
                    ),
                    ButtonText(
                      color: gButton,
                      text: '+',
                      textColor: Color(0xFF596FE1),
                    ),
                    Container(
                      height: 156,
                      child: ButtonText(
                          color: Color(0xFF596FE1),
                          text: '=',
                          textColor: Color(0xFFFFFFFF),
                      ),
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
  Widget ButtonText({Color color,String text,Color textColor}){
    return  Expanded(
      child: GestureDetector(
        onTap: (){
          setState(() {
            calculate(text);
          });
        },
        child: Container(
          decoration: BoxDecoration(
              color: color,
              border: Border.all(color: Color(0xFFE0E0E0), width: .8)),
          height: 100,
          width: MediaQuery.of(context).size.width / 4,
          child: Center(
            child: Text(
              text,
              style: TextStyle(color: textColor,fontSize: 20,fontWeight: FontWeight.w500),
            ),
          ),
        ),
      ),
    );
  }
  void calculate(txtButton){
    if( txtButton== 'C'){
      widget.text = '0';
      widget.number1 = 0.0;
      widget.number2 = 0.0;
      widget.result = '';
      widget.finalResult = '0';
      widget.opreation ='';
      widget.preOprtation ='';
    }else if(txtButton == '=' && widget.opreation == '='){
      switch(widget.preOprtation){
        case '+':
          widget.finalResult = add();
          break;
        case '-':
          widget.finalResult = sub();
          break;
        case 'x':
          widget.finalResult = mult();
          break;
        case '÷':
          widget.finalResult = div();
          break;
        case '%':
          widget.finalResult = persent();
          break;
      }
    }
    else if(txtButton == '=' ||txtButton =='+' ||txtButton =='-' ||txtButton =='x'||txtButton =='÷'||txtButton =='%'){
      if(widget.number1 == 0){
        widget.number1 = double.parse(widget.result);
      }else{
        widget.number2 = double.parse(widget.result);
      }
      switch(widget.opreation){
        case '+':
          widget.finalResult = add();
          break;
        case '-':
          widget.finalResult = sub();
          break;
        case 'x':
          widget.finalResult = mult();
          break;
        case '÷':
          widget.finalResult = div();
          break;
        case '%':
          widget.finalResult = persent();
          break;
      }
      widget.preOprtation = widget.opreation;
      widget.opreation =txtButton;
      widget.result = '';
    } else{
      if(widget.result == '0'){
        widget.result = txtButton;
      }else
      widget.result += txtButton;
      widget.finalResult = widget.result;
    }
    setState(() {
      widget.text =widget.finalResult;
    });
  }

  String add(){
    widget.result = (widget.number1 + widget.number2).toString();
    widget.number1 = double.parse(widget.result);
    return widget.result;
  }
  String sub(){
    widget.result = (widget.number1 - widget.number2).toString();
    widget.number1 = double.parse(widget.result);
    return widget.result;
  }
  String mult(){
    widget.result = (widget.number1 * widget.number2).toString();
    widget.number1 = double.parse(widget.result);
    return widget.result;
  }
  String div(){
    widget.result = (widget.number1 / widget.number2).toString();
    widget.number1 = double.parse(widget.result);
    return widget.result;
  }
  String persent(){
    widget.result = (widget.number1 % widget.number2).toString();
    widget.number1 = double.parse(widget.result);
    return widget.result;
  }
}


