import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:splitmoney/data/friend_data.dart';
import 'package:splitmoney/models/friend_model.dart';
import 'package:provider/provider.dart';
import 'package:splitmoney/provider/friend_name_provider.dart';
import 'dart:convert';

class FriendListGroupSelector extends StatefulWidget {
  static const routeName = '/group_list_selector';
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<FriendListGroupSelector> {
  // List<Friend> contacts = List.copyRange<Friend>(friends, 0, contacts ) as List<Friend>;

  List<Friend> contacts = friends;

  List<Friend> selectedContacts =
      friends.where((element) => element.isSelected == true).toList();

  @override
  Widget build(BuildContext context) {
    print(contacts[0].isSelected);
    print(friends[0].isSelected);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Choose People"),
        centerTitle: true,
        backgroundColor: Colors.green[700],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.green,
        onPressed: () => {
          // print(selectedContacts),
          Navigator.pop(context, selectedContacts),
        },
        child: const Icon(Icons.verified),
      ),
      body: SafeArea(
        child: Container(
          child: Column(
            children: [
              Expanded(
                child: Container(
                  height: 200,
                  child: ListView.builder(
                      itemCount: contacts.length,
                      itemBuilder: (BuildContext context, int index) {
                        // return item
                        return ListTile(
                          leading: CircleAvatar(
                            backgroundColor: Colors.green[700],
                            child: const Icon(
                              Icons.person_outline_outlined,
                              color: Colors.white,
                            ),
                          ),
                          title: Text(
                            contacts[index].friendName,
                            style: const TextStyle(
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          subtitle: Text(contacts[index].friendName),
                          trailing: contacts[index].isSelected
                              ? Icon(
                                  Icons.check_circle,
                                  color: Colors.green[700],
                                )
                              : const Icon(
                                  Icons.check_circle_outline,
                                  color: Colors.grey,
                                ),
                          onTap: () {
                            setState(() {
                              contacts[index].isSelected =
                                  !contacts[index].isSelected;
                              if (contacts[index].isSelected == true) {
                                selectedContacts.add(contacts[index]);
                              } else if (contacts[index].isSelected == false) {
                                selectedContacts.removeWhere((element) =>
                                    element.friendName ==
                                    contacts[index].friendName);
                              }
                            });
                          },
                        );
                      }),
                ),
              ),
              // ignore: prefer_is_empty
              selectedContacts.length > 0
                  ? const Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 25,
                        vertical: 10,
                      ),
                      child: SizedBox(
                        width: double.infinity,

                        // child: RaisedButton(
                        //   color: Colors.green[700],
                        //   child: Text(
                        //     "Delete (${selectedContacts.length})",
                        //     style: TextStyle(
                        //       color: Colors.white,
                        //       fontSize: 18,
                        //     ),
                        //   ),
                        //   onPressed: () {
                        //     print(
                        //         "Delete List Lenght: ${selectedContacts.length}");
                        //   },
                        // ),
                      ),
                    )
                  : Container(),
            ],
          ),
        ),
      ),
    );
  }

  // Widget ContactItem(String name, String phoneNumber, int index) {}
}
