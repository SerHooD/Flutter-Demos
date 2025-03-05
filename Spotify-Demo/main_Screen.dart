import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle.light,
        backgroundColor: Colors.transparent,
      ),
      backgroundColor: UtilityColors.pageColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: UtilityPadding.pageHorizontalPadding,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const ProfilePhoto(),
                  Row(
                    children: const [
                      TapButton(
                        title: "All",
                        backgroundColor1: UtilityColors.green,
                        textColor1: UtilityColors.pageColor,
                      ),
                      TapButton(title: "Music"),
                      TapButton(title: "Podcasts"),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 15),
              SizedBox(
                height: 300,
                child: Row(
                  children: [
                    Flexible(
                      child: Column(
                        children: [
                          Expanded(child: _musicCard()),
                          Expanded(child: _musicCard()),
                          Expanded(child: _musicCard()),
                          Expanded(child: _musicCard()),
                        ],
                      ),
                    ),
                    Flexible(
                      child: Column(
                        children: [
                          Expanded(child: _musicCard()),
                          Expanded(child: _musicCard()),
                          Expanded(child: _musicCard()),
                          Expanded(child: _musicCard()),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15),
                child: Text(
                  "Picked for you",
                  style: Theme.of(context).textTheme.displaySmall?.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 31,
                      ),
                ),
              ),
              _musicCard(),
              Padding(
                padding: const EdgeInsets.only(top: 15),
                child: Text(
                  "New releases for you",
                  style: Theme.of(context).textTheme.displaySmall?.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 31,
                      ),
                ),
              ),
              SizedBox(
                height: 100,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    _musicCard(),
                    _musicCard(),
                    _musicCard(),
                  ],
                ),
              ),
              SizedBox(
                height: 100,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    _musicCard(),
                    _musicCard(),
                    _musicCard(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed, // Bu satırı ekleyin
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home, color: Colors.white), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.search_outlined, color: Colors.white), label: "Search"),
          BottomNavigationBarItem(icon: Icon(Icons.library_books_rounded, color: Colors.white), label: "Your Library"),
          BottomNavigationBarItem(icon: Icon(Icons.add, color: Colors.white), label: "Create"), // 4. item
        ],
        backgroundColor: UtilityColors.pageColor,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white,
      ),
    );
  }
}

class _musicCard extends StatelessWidget {
  const _musicCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(3),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
      ),
      color: UtilityColors.grey,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(5),
        child: Row(
          children: [
            Image.network(
              "https://picsum.photos/200",
              fit: BoxFit.cover,
            ),
            Center(
              widthFactor: 1.5,
              child: Text(
                "Music name",
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ProfilePhoto extends StatelessWidget {
  const ProfilePhoto({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
      ),
      child: SizedBox(
        height: 40,
        width: 40,
        child: ClipOval(
          child: Image.network(
            "https://picsum.photos/200",
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}

class TapButton extends StatelessWidget {
  const TapButton({
    super.key,
    required this.title,
    this.backgroundColor1 = UtilityColors.grey,
    this.textColor1 = Colors.white,
  });

  final String title;
  final Color backgroundColor1;
  final Color textColor1;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 3),
      child: TextButton(
        onPressed: () {},
        style: TextButton.styleFrom(
          backgroundColor: backgroundColor1,
        ),
        child: Text(
          title,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: textColor1,
                fontWeight: FontWeight.w400,
              ),
        ),
      ),
    );
  }
}

class UtilityPadding {
  static EdgeInsets pageHorizontalPadding = const EdgeInsets.symmetric(horizontal: 10.0);
}

class UtilityColors {
  static const Color grey = Color(0xFF333333);
  static const Color pageColor = Color(0xFF111111);
  static const Color green = Color(0xFF1ED860);
}
