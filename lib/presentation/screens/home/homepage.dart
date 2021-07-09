import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:ui_project/presentation/themes/icon_themes.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _page = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.transparent,
        buttonBackgroundColor: Colors.deepPurple[300],
        items: <Widget>[
          Icon(IconThemes.home,
              color: _page == 0 ? Colors.white : Colors.grey, size: 30),
          Icon(IconThemes.explore,
              color: _page == 1 ? Colors.white : Colors.grey, size: 30),
          Icon(IconThemes.email,
              color: _page == 2 ? Colors.white : Colors.grey, size: 30),
          Icon(IconThemes.notification,
              color: _page == 3 ? Colors.white : Colors.grey, size: 30),
          Icon(IconThemes.person,
              color: _page == 4 ? Colors.white : Colors.grey, size: 30)
        ],
        onTap: (index) {
          print(index);
          setState(() {
            _page = index;
          });
        },
      ),
      body: _page == 0
          ? CustomScrollView(slivers: [
              SliverList(
                delegate: SliverChildListDelegate([
                  HomeWidget(),
                  Container(
                    height: 100,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 20.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(width: 10),
                          Container(
                            width: 55,
                            height: 55,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              color: Colors.deepPurple[300],
                            ),
                            child: Center(
                              child: Icon(Icons.add,
                                  color: Colors.white, size: 30),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ]),
              ),
            ])
          : Container(),
    );
  }
}

class HomeWidget extends StatelessWidget {
  const HomeWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.only(left: 12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 34.0),
                  child: Icon(Icons.camera_alt_outlined, size: 30),
                ),
                SizedBox(width: MediaQuery.of(context).size.width * 0.55),
                Padding(
                  padding: const EdgeInsets.only(top: 14.0),
                  child: Container(
                    child: Row(
                      children: [
                        Text("Create post",
                            style: TextStyle(
                                fontWeight: FontWeight.w700, fontSize: 18)),
                        Icon(Icons.edit_attributes)
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 15),
            Row(
              children: [
                Text(
                  "Feed",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 23),
                ),
                SizedBox(width: MediaQuery.of(context).size.width * 0.70),
                Padding(
                  padding: const EdgeInsets.only(top: 14.0),
                  child: Icon(Icons.search, size: 40),
                )
              ],
            ),
            SizedBox(height: 8.0),
            Text(
              "Personal stories",
              style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
