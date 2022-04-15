// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: AnimatedNeumorphism(),
  ));
}

class AnimatedNeumorphism extends StatefulWidget {
  @override
  State<AnimatedNeumorphism> createState() => _AnimatedNeumorphismState();
}

class _AnimatedNeumorphismState extends State<AnimatedNeumorphism>
    with TickerProviderStateMixin {
  double turns = 0.0;
  bool isClikced = false;
  late AnimationController _controller;
  Color customBlackColor = const Color.fromARGB(255, 53, 53, 53);
  Color customWhiteColor = const Color.fromARGB(255, 237, 237, 237);
  @override
  void initState() {
    _controller = AnimationController(
      duration: Duration(microseconds: 800),
      vsync: this,
    );
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: customWhiteColor,
      appBar: AppBar(
        title: const Text('Animated Neumorphism'),
        centerTitle: true,
      ),
      body: Center(
        child: AnimatedRotation(
          turns: turns,
          duration: const Duration(
            seconds: 1,
          ),
          curve: Curves.easeOutExpo,
          child: GestureDetector(
            onTap: () {
              if (isClikced) {
                setState(() {
                  turns -= 1 / 4;
                });
                _controller.reverse();
              } else {
                setState(() {
                  turns += 1 / 4;
                });
                _controller.forward();
              }
              isClikced = !isClikced;
            },
            child: AnimatedContainer(
              curve: Curves.easeOutExpo,
              duration: Duration(seconds: 1),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: customWhiteColor,
                boxShadow: [
                  BoxShadow(
                    blurRadius: 30.0,
                    offset: isClikced
                        ? const Offset(20, -20)
                        : const Offset(20, 20),
                    color: Colors.grey,
                  ),
                  BoxShadow(
                      blurRadius: 30.0,
                      offset: isClikced
                          ? const Offset(-20, 20)
                          : const Offset(-20, -20),
                      color: Colors.white)
                ],
              ),
              child: SizedBox(
                height: 150,
                width: 150,
                child: Center(
                  child: AnimatedIcon(
                    icon: AnimatedIcons.menu_close,
                    progress: _controller,
                    size: 100,
                    color: customBlackColor,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
