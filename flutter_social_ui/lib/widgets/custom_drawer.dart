import 'package:flutter/material.dart';
import 'package:flutter_social_ui/data/data.dart';
import 'package:flutter_social_ui/screens/Home_Screen.dart';
import 'package:flutter_social_ui/screens/Login_Screen.dart';
import 'package:flutter_social_ui/screens/Profile_Screen.dart';

class CustomDrawer extends StatelessWidget {
  _buildDrawerOption(Icon icon, String title, Function ontap) {
    return ListTile(
      leading: icon,
      title: Text(
        title,
        style: TextStyle(
          color: Color(0xFF0062AC),
          fontSize: 20,
        ),
      ),
      onTap: ontap,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Image(
                height: 200,
                width: double.infinity,
                image: AssetImage(currentUser.backgroundImageUrl),
                fit: BoxFit.cover,
              ),
              Positioned(
                bottom: 20,
                left: 20,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    Container(
                      height: 100,
                      width: 100,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          width: 3,
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                      child: ClipOval(
                        child: Image(
                          image: AssetImage(currentUser.profileImageUrl),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    SizedBox(width: 6),
                    Text(
                      currentUser.name,
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
          _buildDrawerOption(
            Icon(
              Icons.dashboard,
              color: Color(0xFF0062AC),
            ),
            'Home',
            () => Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (_) => HomeScreen(),
              ),
            ),
          ),
          _buildDrawerOption(
              Icon(
                Icons.chat,
                color: Color(0xFF0062AC),
              ),
              'Chat',
              () {}),
          _buildDrawerOption(
              Icon(
                Icons.location_on,
                color: Color(0xFF0062AC),
              ),
              'Map',
              () {}),
          _buildDrawerOption(
            Icon(
              Icons.account_circle,
              color: Color(0xFF0062AC),
            ),
            'Account',
            () => Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (_) => ProfileScreen(user: currentUser,),
              ),
            ),
          ),
          _buildDrawerOption(
              Icon(
                Icons.settings,
                color: Color(0xFF0062AC),
              ),
              'Settings',
              () {}),
          Expanded(
            child: Align(
              alignment: FractionalOffset.bottomCenter,
              child: _buildDrawerOption(
                Icon(
                  Icons.arrow_back,
                  color: Color(0xFF0062AC),
                ),
                'Logout',
                () => Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (_) => LoginScreen(),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
