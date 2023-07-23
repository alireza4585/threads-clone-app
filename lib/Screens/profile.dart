import 'package:flutter/material.dart';
import 'package:threads/data/datasource/datasource_thread.dart';
import 'package:threads/widgets/thread_widgets.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen>
    with SingleTickerProviderStateMixin {
  TabController? _controller;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = TabController(length: 2, vsync: this);
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(
                      Icons.language,
                      size: 30,
                    ),
                    Icon(
                      Icons.menu,
                      size: 30,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 15),
              Head(
                'Flutter Developer',
                'profile.jpg',
                'Alireza',
                'FlutterSkills89',
              ),
              SizedBox(height: 8),
              followers(),
              Container(
                height: 60,
                child: TabBar(
                  labelColor: Colors.black,
                  unselectedLabelColor: Colors.grey,
                  labelStyle: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                  ),
                  indicatorColor: Colors.black,
                  controller: _controller,
                  tabs: [
                    Tab(text: 'Threads'),
                    Tab(text: 'Replies'),
                  ],
                ),
              ),
              SizedBox(
                height: 500,
                child: TabBarView(
                  controller: _controller,
                  children: [
                    Column(
                      children: [
                        ThreadPage(threadRemoteDatasource().getThread()[0]),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 70, vertical: 30),
                      child: Text(
                        'You havent replies any threads yet',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class followers extends StatelessWidget {
  const followers({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 30,
            width: 40,
            child: Stack(
              children: [
                CircleAvatar(
                  radius: 10,
                  backgroundImage: AssetImage('images/p2.png'),
                ),
                Positioned(
                  left: 12,
                  child: CircleAvatar(
                    radius: 10,
                    backgroundImage: AssetImage('images/p3.jpg'),
                  ),
                ),
              ],
            ),
          ),
          Text(
            '8',
            style: TextStyle(
                fontSize: 15, fontWeight: FontWeight.w400, color: Colors.grey),
          ),
          SizedBox(width: 5),
          Text(
            'followers',
            style: TextStyle(
                fontSize: 15, fontWeight: FontWeight.w400, color: Colors.grey),
          ),
        ],
      ),
    );
  }
}

// ignore: must_be_immutable
class Head extends StatelessWidget {
  String name;
  String username;
  String bio;
  String image;
  Head(
    this.bio,
    this.image,
    this.name,
    this.username, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 8),
              Text(
                name,
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 5),
              Text(
                username,
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: 15),
              Text(
                bio,
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          CircleAvatar(
            backgroundImage: AssetImage('images/${image}'),
            radius: 30,
          )
        ],
      ),
    );
  }
}
