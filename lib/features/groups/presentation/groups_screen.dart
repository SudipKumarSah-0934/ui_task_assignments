import 'package:flutter/material.dart';
import 'package:ui_task_assignments/features/groups/presentation/existing_group_list.dart';

class GroupsScreen extends StatefulWidget {
  const GroupsScreen({super.key});

  @override
  State<GroupsScreen> createState() => _GroupsScreenState();
}

class _GroupsScreenState extends State<GroupsScreen> {
  List<ChatUsers> chatUsers = [
    ChatUsers(name: "Jane Russel", imageURL: "images/userImage1.jpeg"),
    ChatUsers(name: "Jane Russel", imageURL: "images/userImage1.jpeg"),
    ChatUsers(name: "Jane Russel", imageURL: "images/userImage1.jpeg"),
    ChatUsers(name: "Jane Russel", imageURL: "images/userImage1.jpeg"),
    ChatUsers(name: "Jane Russel", imageURL: "images/userImage1.jpeg"),
    ChatUsers(name: "Jane Russel", imageURL: "images/userImage1.jpeg"),
    ChatUsers(name: "Jane Russel", imageURL: "images/userImage1.jpeg"),
    ChatUsers(name: "Jane Russel", imageURL: "images/userImage1.jpeg"),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.only(left: 16, right: 16, top: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  const Text(
                    "Groups",
                    style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                  ),
                  Container(
                    padding: const EdgeInsets.only(
                        left: 8, right: 8, top: 2, bottom: 2),
                    height: 30,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.pink[50],
                    ),
                    child: const Row(
                      children: <Widget>[
                        Icon(
                          Icons.add,
                          color: Colors.pink,
                          size: 20,
                        ),
                        SizedBox(
                          width: 2,
                        ),
                        Text(
                          "Create a Group",
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 16, left: 16, right: 16),
            child: TextField(
              decoration: InputDecoration(
                hintText: "Search...",
                hintStyle: TextStyle(color: Colors.grey.shade600),
                prefixIcon: Icon(
                  Icons.search,
                  color: Colors.grey.shade600,
                  size: 20,
                ),
                filled: true,
                fillColor: Colors.grey.shade100,
                contentPadding: const EdgeInsets.all(8),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(color: Colors.grey.shade100)),
              ),
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: ListView.builder(
                itemCount: chatUsers.length,
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                padding: const EdgeInsets.only(top: 16),
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return ExistingGroupList(
                    name: chatUsers[index].name,
                    imageUrl: chatUsers[index].imageURL,
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ChatUsers {
  String name;
  String imageURL;
  ChatUsers({
    required this.name,
    required this.imageURL,
  });
}
