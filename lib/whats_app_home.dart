import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:whats_app_clone/chat_summary_widget.dart';
import 'package:whats_app_clone/custom_search_widget.dart';
import 'package:whats_app_clone/models/chat_data_model.dart';
import 'package:whats_app_clone/models/setting_model.dart';
import 'package:whats_app_clone/screens/calls_screen.dart';
import 'package:whats_app_clone/screens/chat_details_screen.dart';
import 'package:whats_app_clone/screens/chats_screen.dart';
import 'package:whats_app_clone/screens/groups_screen.dart';
import 'package:whats_app_clone/screens/recents_screen.dart';
import 'package:whats_app_clone/screens/setting_screen.dart';
import 'package:whats_app_clone/test_widget.dart';

class WhatsAppHome extends StatefulWidget {
  const WhatsAppHome({super.key});

  @override
  State<WhatsAppHome> createState() => _WhatsAppHomeState();
}

class _WhatsAppHomeState extends State<WhatsAppHome> {
  List<ChatDataModel> chatList = [
    ChatDataModel(
        name: "Ahmed",
        imagePath: "assets/images/image_1.jpg",
        time: "2:30",
        lastMessage: "Hi How  are you?",
        mssgCount: 3),
    ChatDataModel(
        name: "Saeed",
        imagePath: "assets/images/image_2.jpg",
        time: "3:30",
        lastMessage: "Hi How  are you?",
        mssgCount: 2),
    ChatDataModel(
        name: "ALi",
        imagePath: "assets/images/image_3.jpg",
        time: "1:30",
        lastMessage: "Hi How  are you?",
        mssgCount: 20),
    ChatDataModel(
        name: "Khalid",
        imagePath: "assets/images/image_4.jpg",
        time: "3:50",
        lastMessage: "Hi How  are you?",
        mssgCount: 1),
  ];
  // List chatList = [
  //   {
  //     "name": "Ali",
  //     "lastMssg": "Alsalam alikom!",
  //     "time": "5:01",
  //     "imagePath": "assets/images/image_1.jpg",
  //   },
  //   {
  //     "name": "Ahmed",
  //     "lastMssg": "Alsalam alikom!",
  //     "time": "5:01",
  //     "imagePath": "assets/images/image_2.jpg",
  //   },
  //   {
  //     "name": "Ali",
  //     "lastMssg": "Alsalam alikom!",
  //     "time": "5:01",
  //     "imagePath": "assets/images/image_1.jpg",
  //   },
  //   {
  //     "name": "Ahmed",
  //     "lastMssg": "Alsalam alikom!",
  //     "time": "5:01",
  //     "imagePath": "assets/images/image_2.jpg",
  //   },
  //   {
  //     "name": "Ali",
  //     "lastMssg": "Alsalam alikom!",
  //     "time": "5:01",
  //     "imagePath": "assets/images/image_1.jpg",
  //   },
  //   {
  //     "name": "Ahmed",
  //     "lastMssg": "Alsalam alikom!",
  //     "time": "5:01",
  //     "imagePath": "assets/images/image_2.jpg",
  //   },
  //   {
  //     "name": "Ali",
  //     "lastMssg": "Alsalam alikom!",
  //     "time": "5:01",
  //     "imagePath": "assets/images/image_1.jpg",
  //   },
  //   {
  //     "name": "Ahmed",
  //     "lastMssg": "Alsalam alikom!",
  //     "time": "5:01",
  //     "imagePath": "assets/images/image_2.jpg",
  //   },
  // ];
  int _currentIndex = 3;
  final List<Widget> _pages = const [
    CallsScreen(),
    GroupsScreen(),
    RecentsScreen(),
    ChatsScreen()
  ];
  int _mssgCount = 0;
  @override
  Widget build(BuildContext context) {
    final settings = Provider.of<SettingModel>(context);
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          bottom: const PreferredSize(
              preferredSize: Size.fromHeight(100), child: CustomSearchWidget()),
          leadingWidth: 100,
          leading: Padding(
            padding: EdgeInsets.only(left: 16),
            child: Row(
              children: [
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SettingScreen(),
                        ));
                  },
                  child: Icon(
                    Icons.more_vert,
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/test');
                  },
                  child: Icon(
                    Icons.camera_alt_outlined,
                    color: Colors.white,
                  ),
                )
              ],
            ),
          ),
          title: Container(
            padding: const EdgeInsets.only(right: 16.0),
            alignment: Alignment.centerRight,
            child:  Text(
              "واتساب ${settings.getName()}",
              style: TextStyle(color: Colors.white),
            ),
          ),
          backgroundColor: Colors.black,
        ),
        body:

            // _pages[_currentIndex]

            ListView.builder(
          itemCount: chatList.length,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ChatDetailsScreen(
                        chatData: chatList[index],
                      ),
                    ));
              },
              child: ChatSummaryWidget(
                name: chatList[index].name,
                lastMessage: chatList[index].lastMessage,
                time: chatList[index].time,
                imagePath: chatList[index].imagePath,
                mssgCount: chatList[index].mssgCount,
              ),
            );
          },
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.green,
          onPressed: () {
            setState(() {
              _mssgCount++;
            });
          },
          child: const Icon(
            Icons.add_comment,
            color: Colors.white,
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
        bottomNavigationBar: BottomNavigationBar(
            onTap: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
            unselectedItemColor: Colors.white,
            selectedItemColor: Colors.green,
            backgroundColor: Colors.black,
            currentIndex: _currentIndex,
            type: BottomNavigationBarType.fixed,
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(Icons.call), label: "المكالمات"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.groups_3_outlined), label: "المجتمعات"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.refresh), label: "التحديثات"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.comment), label: "الدردشات"),
            ]),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
