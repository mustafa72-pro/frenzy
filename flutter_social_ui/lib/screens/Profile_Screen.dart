import 'package:flutter/material.dart';
import 'package:flutter_social_ui/models/user_model.dart';
import 'package:flutter_social_ui/widgets/custom_drawer.dart';
import 'package:flutter_social_ui/widgets/posts_carousel.dart';
import 'package:flutter_social_ui/widgets/profile_clipper.dart';

class ProfileScreen extends StatefulWidget {
  final User user;
  ProfileScreen({this.user});
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final GlobalKey<ScaffoldState> _Scafoldkey = GlobalKey<ScaffoldState>();
  PageController _yourPostsPC;
  PageController _yourFavoritsPC;
  @override
  void initState() {
    // TODO: implement initState
    _yourPostsPC = PageController(initialPage: 0,viewportFraction: 0.8);
    _yourFavoritsPC = PageController(initialPage: 0,viewportFraction: 0.8);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _Scafoldkey,
      drawer: CustomDrawer(),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Stack(
              alignment: Alignment.center,
              children: <Widget>[
                ClipPath(
                  clipper: ProfileClipper(),
                  child: Image(
                    height: 300,
                    width: double.infinity,
                    image: AssetImage(widget.user.backgroundImageUrl),
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  top: 50,
                  left: 20,
                  child: IconButton(
                    iconSize: 30,
                    icon: Icon(Icons.menu),
                    color: Theme.of(context).primaryColor,
                    onPressed: () => _Scafoldkey.currentState.openDrawer(),
                  ),
                ),
                Positioned(
                  bottom: 10,
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black45,
                          offset: Offset(0, 2),
                          blurRadius: 6,
                        ),
                      ],
                    ),
                    child: ClipOval(
                      child: Image(
                        height: 120,
                        width: 120,
                        image: AssetImage(widget.user.profileImageUrl),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.all(15.0),
              child: Text(
                widget.user.name,
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF0062AC),
                  letterSpacing: 1.5,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Text(
                      'Following',
                      style: TextStyle(
                        fontSize: 22,
                        color: Color(0xFF0062AC),
                      ),
                    ),
                    SizedBox(height: 2),
                    Text(
                      widget.user.following.toString(),
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF0062AC),
                      ),
                    ),
                  ],
                ),
                Column(
                  children: <Widget>[
                    Text(
                      'Followers',
                      style: TextStyle(
                        fontSize: 22,
                        color: Color(0xFF0062AC),
                      ),
                    ),
                    SizedBox(height: 2),
                    Text(
                      widget.user.followers.toString(),
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF0062AC),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            PostsCarousel(pageController: _yourPostsPC,title: 'Your Posts',posts: widget.user.posts,),
            PostsCarousel(pageController: _yourFavoritsPC,title: 'Favorits',posts: widget.user.favorites,),
            SizedBox(height: 50,),
          ],
        ),
      ),
    );
  }
}
