import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart';
import 'package:ui_project/data/datasources/homepagePost.dart';
import 'package:ui_project/domain/enities/allPostEntity.dart';
import 'package:ui_project/presentation/cubit/bottomnavbar_cubit/cubit/bottomnavbarcubit_cubit.dart';
import 'package:ui_project/presentation/cubit/homepageCubit/cubit/homepageposts_cubit.dart';
import 'package:ui_project/presentation/themes/icon_themes.dart';
import 'package:ui_project/presentation/widgets/progressDailogue.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    update();
  }

  void update() async {
    final storage = FlutterSecureStorage();
    print(await storage.readAll());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottomnavbarcubitCubit, BottomnavbarcubitState>(
        builder: (context, state) {
      return BlocConsumer<HomepagepostsCubit, HomepagepostsState>(
          listener: (context, states) {
        if (states is HomePagePostsError) {
          print(states.errorMsg);
        } else if (states is HomePagePostsLoded) {
          print(states.posts);
        } else if (state is HomePagePostsLoding) {
          showDialog(
              context: context,
              builder: (context) {
                return ProgressDailogue(msg: "please wait");
              });

          print(states);
        }
      }, builder: (context, states) {
        return Scaffold(
          bottomNavigationBar: CurvedNavigationBar(
            backgroundColor: Colors.transparent,
            buttonBackgroundColor: Colors.deepPurple[300],
            items: <Widget>[
              Icon(IconThemes.home,
                  color: state.page == 0 ? Colors.white : Colors.grey,
                  size: 30),
              Icon(IconThemes.explore,
                  color: state.page == 1 ? Colors.white : Colors.grey,
                  size: 30),
              Icon(IconThemes.email,
                  color: state.page == 2 ? Colors.white : Colors.grey,
                  size: 30),
              Icon(IconThemes.notification,
                  color: state.page == 3 ? Colors.white : Colors.grey,
                  size: 30),
              Icon(IconThemes.person,
                  color: state.page == 4 ? Colors.white : Colors.grey, size: 30)
            ],
            onTap: (index) {
              print(index);
              BlocProvider.of<BottomnavbarcubitCubit>(context)
                  .update(page: index);
            },
          ),
          body: state.page == 0
              ? CustomScrollView(slivers: [
                  SliverAppBar(
                    onStretchTrigger: () async {
                      BlocProvider.of<HomepagepostsCubit>(context).getPosts();
                    },
                    stretch: true,
                    backgroundColor: Colors.grey[100],
                    expandedHeight: 250,
                    flexibleSpace: FlexibleSpaceBar(
                      background: HomeWidget(),
                      stretchModes: <StretchMode>[
                        StretchMode.zoomBackground,
                      ],
                    ),
                  ),
                  states is HomePagePostsLoded
                      ? SliverStaggeredGrid.countBuilder(
                          staggeredTileBuilder: (c) => StaggeredTile.fit(1),
                          itemCount: states.posts.length,
                          crossAxisCount: 1,
                          itemBuilder: (context, index) {
                            return PostWidget(
                                username: states.posts[index].username,
                                image: states.posts[index].image);
                          },
                        )
                      : SliverToBoxAdapter(
                          child: Center(child: CircularProgressIndicator()),
                        ),
                ])
              : Container(),
        );
      });
    });
  }
}

class AddAndFriends extends StatelessWidget {
  const AddAndFriends({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      child: Padding(
        padding: const EdgeInsets.only(top: 20.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InkWell(
              onTap: () async {},
              child: Container(
                width: 55,
                height: 55,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: Colors.deepPurple[300],
                ),
                child: Center(
                  child: Icon(Icons.add, color: Colors.white, size: 30),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PostWidget extends StatelessWidget {
  PostWidget({
    Key? key,
    required this.image,
    required this.username,
  }) : super(key: key);
  final String username;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 28.0),
      child: Container(
          height: 350,
          color: Colors.white,
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Container(
                height: 70,
                child: Row(children: [
                  SizedBox(width: 10),
                  Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(100))),
                  SizedBox(width: 8),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: Text(username,
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold)),
                  ),
                  SizedBox(width: MediaQuery.of(context).size.width * 0.50),
                  IconButton(icon: Icon(Icons.more_vert), onPressed: () {})
                ])),
            Container(
                height: 230,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(image), fit: BoxFit.cover))),
            Row(
              children: [
                IconButton(
                    icon: FaIcon(FontAwesomeIcons.heart), onPressed: () {}),
                SizedBox(width: 5),
                Text("2.6K", style: TextStyle(fontWeight: FontWeight.bold)),
                SizedBox(width: MediaQuery.of(context).size.width * 0.70),
                FaIcon(FontAwesomeIcons.share)
              ],
            )
          ])),
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
      color: Colors.grey[50],
      child: Column(
        children: [
          Padding(
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
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 23),
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
                  style: TextStyle(
                      color: Colors.grey, fontWeight: FontWeight.bold),
                ),
                AddAndFriends()
              ],
            ),
          ),
        ],
      ),
    );
  }
}
