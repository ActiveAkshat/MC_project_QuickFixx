import 'package:flutter/material.dart';

class Detail extends StatelessWidget {
  const Detail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail Screen'),

      ),
      body:Center(),
    );
  }
}



MAIN
import 'package:flutter/material.dart';
import 'custom_text_widget.dart';
import 'detail.dart';

void _onPressed() {
  print('Button Pressed');
}

void _onlongPressed() {
  print('Button Long Pressed');
}

String buttonText = 'Press Me';
void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.redAccent,
          title: Center(child: Text("QuickFixx")),
        ),
        backgroundColor: Colors.black,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/Picture1.png',
                width: 300,
                height: 300,
              ),
              const CustomText(
                text: 'Hey There',
                containerColor: Colors.blue,
                textColor: Colors.white,
              ),
              const CustomText(
                text: 'I am a Flutter Developer',
                containerColor: Colors.green,
                textColor: Colors.white,
              ),
              const ButtonWidget(),
              SizedBox(height: 20),
              Builder(
                builder:
                    (context) => ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const Detail(),
                          ),
                        );
                      },
                      child: const Text('Go to Detail Screen'),
                    ),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}

class ButtonWidget extends StatefulWidget {
  const ButtonWidget({super.key});

  @override
  State<ButtonWidget> createState() => _ButtonWidgetState();
}

class _ButtonWidgetState extends State<ButtonWidget> {
  void _changeText() {
    setState(() {
      buttonText = 'Button Pressed';
    });
    buttonText = 'Button Pressed';
    print('Button Pressed');
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: _changeText,
      onLongPress: _onlongPressed,
      child: Text(buttonText),
    );
  }
}
