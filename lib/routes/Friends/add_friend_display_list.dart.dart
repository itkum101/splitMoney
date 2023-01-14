import 'package:contacts_service/contacts_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:splitmoney/data/friend_data.dart';
import 'package:splitmoney/data/group_data.dart';

//Import models
import 'package:splitmoney/models/friend_model.dart';
//Import Provider
import 'package:splitmoney/provider/friend_name_provider.dart';

//Import routes
import 'package:splitmoney/routes/Friends/add_contact.dart';
//Import data
import 'package:splitmoney/data/data.dart';

//Import Utils
import 'package:splitmoney/utils/mini_heading_text.dart';
import 'package:splitmoney/utils/icon_button_sample.dart';

//Import Widgets
import 'package:splitmoney/widgets/text_box.dart';

import 'package:uuid/uuid.dart';

class AddFriendDisplayList extends StatefulWidget {
  const AddFriendDisplayList({super.key});

  @override
  State<AddFriendDisplayList> createState() => _AddFriendDisplayListState();
}

class _AddFriendDisplayListState extends State<AddFriendDisplayList> {
  bool isLoading = true;
  bool noMatch = false;
  @override
  void initState() {
    super.initState();
    getContactPermission();
  }

  Future<void> getContactPermission() async {
    if (await Permission.contacts.request().isGranted) {
      //Either user already granted permissions earlier or the user just granted it now
      fetchContacts();
    } else {
      await Permission.contacts.request();
    }
  }

  void fetchContacts() async {
    contactLists = await ContactsService.getContacts(withThumbnails: false);
    setState(() {
      demoList = contactLists;
      isLoading = false;
    });
  }

  void updateList(String valuex) {
    setState(() {
      demoList = contactLists
          .where((element) => (element.displayName!
                  .toLowerCase()
                  .contains(valuex.toLowerCase()) ||
              (element.phones!.isNotEmpty
                  ? element.phones![0].value!.contains(valuex.toLowerCase())
                  : noMatch)))
          .toList();
    });
  }

  var uuid = Uuid();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            children: [
              IconButtonSample(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icons.arrow_back_rounded),
              const SizedBox(width: 15),
              Expanded(
                child: TextBox(
                  onchangedFunc: (value) {
                    updateList(value);
                  },
                  isautoFocus: true,
                  hintText: "Enter name or phone no.",
                  border: InputBorder.none,
                  cursorColor: Colors.grey[600],
                  cursorHeight: 21,
                ),
              )
            ],
          ),
        ),
        Container(
          height: 1,
          color: Colors.grey[400],
        ),
        const SizedBox(
          height: 13,
        ),
        GestureDetector(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return const AddContact();
            }));
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Row(children: [
              CircleAvatar(
                radius: 20,
                backgroundColor: Colors.green[100],
                child: Icon(
                  Icons.person_add_outlined,
                  color: Colors.grey[800],
                ),
              ),
              const SizedBox(
                width: 15,
              ),
              Expanded(
                  child: Text(
                "Add a new Contact",
                style: TextStyle(
                    color: Colors.grey[800],
                    fontWeight: FontWeight.w500,
                    fontSize: 16),
              ))
            ]),
          ),
        ),
        const SizedBox(height: 20),
        const MiniHeadingText(text: "From your contacts"),
        const SizedBox(height: 15),
        Expanded(
          child: isLoading
              ? const Center(child: CircularProgressIndicator())
              : ListView.builder(
                  itemCount: demoList.length,
                  itemBuilder: ((context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 5),
                      child: ListTile(
                        onTap: (() {
                          // context
                          //     .read<FriendNameProvider>()
                          //     .addToFriendList(Friend(
                          //       friendEmail:
                          // demoList[index].emails!.isNotEmpty
                          //     ? demoList[index].emails![0].value!
                          //     : "N/A",
                          //       friendName: demoList[index].displayName!,
                          // imgChild: demoList[index].avatar!.isEmpty
                          //     ? const Icon(Icons.person)
                          //     : ClipOval(
                          //         child: Image.memory(
                          //           demoList[index].avatar!,
                          //           fit: BoxFit.fill,
                          //         ),
                          //       ),
                          //     ));
                          Provider.of<FriendNameProvider>(context,
                                  listen: false)
                              .addToFriendList(Friend(
                                  joinedGroup: [groups[0]],
                                  id: uuid.v1(),
                                  friendName: demoList[index].displayName!,
                                  friendEmail:
                                      demoList[index].emails!.isNotEmpty
                                          ? demoList[index].emails![0].value!
                                          : "N/A",
                                  imgChild: const Icon(Icons.person)));

                          Navigator.pop(context);
                        }),
                        leading: const CircleAvatar(
                          child: Icon(Icons.person),
                        ),
                        title: Text(
                          demoList[index].displayName!,
                          style: TextStyle(
                              color: Colors.grey[700],
                              fontWeight: FontWeight.w500),
                        ),
                        subtitle: Text(
                          (demoList[index].phones!.isNotEmpty)
                              ? demoList[index].phones![0].value!
                              : "N/A",
                        ),
                      ),
                    );
                  })),
        )
      ],
    );
  }
}
