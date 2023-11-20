import 'package:flutter/material.dart';



class OnboardingScreen extends StatefulWidget {
  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  int _currentPage = 0;
  int _currentContent = 0;
  List<String> titles = ["Welcome", "Explore", "Connect"];
  List<String> descriptions = [
    "Discover amazing features of our app.",
    "Explore and enjoy a variety of content.",
    "Connect with friends and share experiences."
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
         
           AnimatedOpacity(
                duration: Duration(seconds: 1),
                opacity: _currentPage == _currentContent ? 1.0 : 0.0,
                child: Column(
                  children: [
                    Text(
                      titles[_currentContent],
                      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 16),
                    Text(
                      descriptions[_currentContent],
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              ),
          ElevatedButton(
            onPressed: () {
              if (_currentPage == titles.length - 1) {
                // Handle the action when reaching the last page
                // For example, navigate to the next screen
                print("Reached the last page");
              } else {
                setState(() {
                  _currentPage++;
                Future.delayed(Duration(milliseconds: 500), () {
                  setState(() {
                    _currentContent=_currentPage;
                  });
                });
                });
              }
            },
            child: Text(_currentPage == titles.length - 1 ? "Finish" : "Next"),
          ),
        ],
      ),
    );
  }

  Widget buildDot({required int index}) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 6),
      height: 10,
      width: 10,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: _currentPage == index ? Colors.blue : Colors.grey,
      ),
    );
  }
}
