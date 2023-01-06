import 'package:contacts_service/contacts_service.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';
import 'package:splitmoney/Widgets/text_box.dart';
import 'package:splitmoney/routes/add_contact.dart';
import 'package:splitmoney/utils/data.dart';

class AddFriend extends StatefulWidget {
  const AddFriend({super.key});

  @override
  State<AddFriend> createState() => _AddFriendState();
}

class _AddFriendState extends State<AddFriend> {
  bool isLoading = true;
  bool noMatch = false;
  @override
  void initState() {
    super.initState();
    getContactPermission();
  }

  Future<void> getContactPermission() async {
    if (await Permission.contacts.isGranted) {
      fetchContacts();
    } else {
      await Permission.contacts.request();
    }
  }

  void fetchContacts() async {
    contactLists = await ContactsService.getContacts();
    setState(() {
      demoList = contactLists;
      isLoading = false;
    });
  }

  void updateList(String valuex) {
    setState(() {
      //

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

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey[100],
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                children: [
                  IconButton(
                      color: Colors.grey[600],
                      splashRadius: 20,
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(Icons.arrow_back_rounded)),
                  const SizedBox(
                    width: 15,
                  ),
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
                  return AddContact();
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
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                children: [
                  Text(
                    "From your contacts",
                    style: TextStyle(
                        color: Colors.grey[800],
                        fontWeight: FontWeight.w700,
                        fontSize: 11),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 15,
            ),
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
                              context
                                  .read<FriendNameProvider>()
                                  .addToGroupList(FriendList(
                                    friendEmail:
                                        demoList[index].emails!.isNotEmpty
                                            ? demoList[index].emails![0].value!
                                            : "N/A",
                                    friendName: demoList[index].displayName!,
                                    imgChild: demoList[index].avatar!.isEmpty
                                        ? const Icon(Icons.person)
                                        : ClipOval(
                                            child: Image.memory(
                                              demoList[index].avatar!,
                                              fit: BoxFit.fill,
                                            ),
                                          ),
                                  ));

                              Navigator.pop(context);
                            }),
                            leading: CircleAvatar(
                                child: demoList[index].avatar!.isEmpty
                                    ? const Icon(Icons.person)
                                    : ClipOval(
                                        child: Image.memory(
                                          demoList[index].avatar!,
                                          fit: BoxFit.fill,
                                        ),
                                      )),
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
        ),
      ),
    );
  }
}
