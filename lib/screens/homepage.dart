import 'package:flutter/material.dart';
import 'package:horizontal_list_02/screens/fooddetails.dart';



class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final PageController _pageController = PageController();
  int _currentIndex = 0;


  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _onPageChanged(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  void _onSwipeLeft() {
    if (_currentIndex < 4 - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.ease,
      );
    }
  }

  void _onSwipeRight() {
    if (_currentIndex > 0) {
      _pageController.previousPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.ease,
      );
    }
  }

  void _onCardTapped(int index) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const DetailsPage(),
      ),
    );
  }



  @override
  Widget build(BuildContext context) {
    final mediaquery = MediaQuery.of(context);

    final List<Widget> cards =[
      Card(
        child: GestureDetector(
          onTap: () => _onCardTapped(0),
          child: Container(
            margin: const EdgeInsets.all(10.0),
            width: mediaquery.size.width * 0.3,
            child: Image.asset(
              'assets/images/20-0.jpg',
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
      Card(
        child: GestureDetector(
          onTap: () => _onCardTapped(1),
          child: Container(
            margin: const EdgeInsets.all(10.0),
            width: mediaquery.size.width * 0.3,
            child: Image.asset(
              'assets/images/21-0.jpg',
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
      Card(
        child: GestureDetector(
          onTap: () => _onCardTapped(2),
          child: Container(
            margin: const EdgeInsets.all(10.0),
            width: mediaquery.size.width * 0.3,
            child: Image.asset(
              'assets/images/30-0.jpg',
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
      Card(
        child: GestureDetector(
          onTap: () => _onCardTapped(3),
          child: Container(
            margin: const EdgeInsets.all(10.0),
            width: mediaquery.size.width * 0.3,
            child: Image.asset(
              'assets/images/42-0.jpg',
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('MenuBar'),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  color: Colors.green.shade100,
                  margin: const EdgeInsets.symmetric(vertical: 20),
                  width: mediaquery.size.width * 0.3,
                  height: mediaquery.size.height * 0.3,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const DetailsPage(),
                        )
                      );
                    },
                    onHorizontalDragEnd: (DragEndDetails details) {
                      if (details.primaryVelocity! > 0) {
                        _onSwipeRight();
                      } else if (details.primaryVelocity! < 0) {
                        _onSwipeLeft();
                      }
                    },
                    child: PageView(
                      controller: _pageController,
                      onPageChanged: _onPageChanged,
                      scrollDirection: Axis.horizontal,
                      children: cards.map((card) {
                        return Container(
                          padding: const EdgeInsets.all(20.0),
                          child: card,
                        );
                      }).toList(),
                    )
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}