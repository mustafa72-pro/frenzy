import 'package:flutter/material.dart';
import 'package:flutter_social_ui/data/data.dart';
import 'package:flutter_social_ui/widgets/custom_drawer.dart';
import 'package:flutter_social_ui/widgets/following_users.dart';
import 'package:flutter_social_ui/widgets/posts_carousel.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  PageController _pageController;
  @override
  void initState() {
    // TODO: implement initState
    _tabController = TabController(length: 2, vsync: this);
    _pageController = PageController(initialPage: 0,viewportFraction: 0.8);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        brightness: Brightness.light,
        iconTheme: IconThemeData(color: Theme.of(context).primaryColor),
        title: Center(
          child: Text(
            'FRENZY',
            style: TextStyle(
              color: Theme.of(context).primaryColor,
              fontWeight: FontWeight.bold,
              letterSpacing: 10.0,
            ),
          ),
        ),
        bottom: TabBar(
          controller: _tabController,
          indicatorWeight: 3.0,
          labelColor: Theme.of(context).primaryColor,
          labelStyle: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w900,
          ),
          unselectedLabelStyle: TextStyle(fontSize: 18),
          tabs: <Widget>[
            Tab(text: 'Trending'),
            Tab(text: 'Latest'),
          ],
        ),
      ),
      drawer: CustomDrawer(),
      body: ListView(
        children: <Widget>[
          FollowingUsers(),
          PostsCarousel(
            pageController: _pageController,
            title: 'Posts',
            posts: posts,
          ),
        ],
      ),
    );
  }
}
