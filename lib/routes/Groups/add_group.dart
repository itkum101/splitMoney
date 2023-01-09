import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
// ignore: depend_on_referenced_packages, library_prefixes
import 'package:path/path.dart' as Path;
import 'package:provider/provider.dart';

//Import Widgets
import 'package:splitmoney/Widgets/alert_dialog_box.dart';
import 'package:splitmoney/Widgets/app_bar_sample.dart';
import 'package:splitmoney/Widgets/group_type_item.dart';
import 'package:splitmoney/Widgets/text_box.dart';

//Import utils
import 'package:splitmoney/utils/icon_button_sample.dart';

//Import data
import 'package:splitmoney/data/grouptype_data.dart';

//Import models
import 'package:splitmoney/models/group_model.dart';

//Import Provider
import 'package:splitmoney/provider/group_name_provider.dart';


class AddGroup extends StatefulWidget {
  const AddGroup({super.key});

  @override
  State<AddGroup> createState() => _AddGroupState();
}

class _AddGroupState extends State<AddGroup> {
  final _controller = TextEditingController();
  late String groupName = _controller.text;
  File? _image;
  String? img;
  Future getImage(ImageSource source) async {
    try {
      final image = await ImagePicker().pickImage(source: source);
      if (image == null) {
        return;
      } else {
        // final imageTemporary = File(image.path);
        final cropimage = await cropImage(image.path);
        final finalImage = await saveFilePermanently(cropimage!);

        setState(() {
          this._image = finalImage;
          img = finalImage.path;
        });
      }
    } on PlatformException catch (e) {
      print(e);
    }
  }

  Future<String?> cropImage(imageFile) async {
    CroppedFile? croppedImage = await ImageCropper().cropImage(
        sourcePath: imageFile,
        aspectRatio: const CropAspectRatio(ratioX: 1, ratioY: 1));
    if (croppedImage == null) {
      return null;
    } else {
      return croppedImage.path;
    }
  }

  Future<File> saveFilePermanently(String imagePath) async {
    final directory = await getApplicationDocumentsDirectory();
    final name = Path.basename(imagePath);
    final image = File('${directory.path}/$name');
    return File(imagePath).copy(image.path);
  }

  void tapped() {
    if (_controller.text.isEmpty) {
      showDialog(
          context: context,
          builder: (context) {
            return const AlertDialogBox(alertText: "Group name is required!");
          });
    } else {
      Provider.of<GroupNameProvider>(context, listen: false).addToGroupList(
        GroupList(
          groupName: groupName,
          grpImgChild: img == null
              ? Padding(
                  padding: const EdgeInsets.all(5),
                  child: Image.asset(
                    "lib/assets/shareholders.png",
                    height: 65,
                    width: 65,
                  ),
                )
              : ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.file(
                    File(img!),
                    height: 75,
                    width: 75,
                  ),
                ),
        ),
      );
      Navigator.pop(context);
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void showSheet() {
    showModalBottomSheet(
        context: context,
        builder: ((context) {
          return Container(
            color: Colors.grey[300],
            height: 101,
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          getImage(ImageSource.camera);
                          Navigator.pop(context);
                        },
                        child: Container(
                            height: 50,
                            decoration: BoxDecoration(
                                color: Colors.grey[500],
                                borderRadius: BorderRadius.circular(10)),
                            padding: const EdgeInsets.all(10),
                            child: Image.asset("lib/assets/camera.png")),
                      ),
                      Text(
                        "Camera",
                        style: TextStyle(color: Colors.grey[700], fontSize: 18),
                      )
                    ],
                  ),
                  Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          getImage(ImageSource.gallery);
                          Navigator.pop(context);
                        },
                        child: Container(
                            height: 50,
                            decoration: BoxDecoration(
                                color: Colors.grey[500],
                                borderRadius: BorderRadius.circular(10)),
                            padding: const EdgeInsets.all(10),
                            child: Image.asset("lib/assets/picture.png")),
                      ),
                      Text(
                        "Gallery",
                        style: TextStyle(color: Colors.grey[700], fontSize: 18),
                      )
                    ],
                  ),
                ],
              ),
            ),
          );
        }));
  }

  @override
  Widget build(BuildContext context) {
    // var myList = context.watch<GroupNameProvider>().groupList;

    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(56),
        child: AppBarSample(
          title: "Add Group",
          leading: IconButtonSample(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icons.close),
          actions: [
            IconButtonSample(onPressed: tapped, icon: Icons.check),
          ],
        ),
      ),
      body: Column(
        children: [
          Container(
            height: 1,
            color: Colors.grey[400],
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              children: [
                Container(
                  height: 54,
                  width: 54,
                  decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(10)),
                  child: _image != null
                      ? ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.file(
                            _image!,
                            width: 52,
                          ),
                        )
                      : GestureDetector(
                          onTap: showSheet,
                          child: Padding(
                            padding: const EdgeInsets.all(9),
                            child: Image.asset(
                              "lib/assets/add_image.png",
                              width: 35,
                            ),
                          ),
                        ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                    child: TextBox(
                  isautoFocus: false,
                  isFilled: true,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15)),
                  labelText: "Group Name",
                  cursorColor: Colors.grey[400],
                  cursorHeight: 20,
                  controller: _controller,
                ))
              ],
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Row(
              children: [
                Text(
                  "Type",
                  style: TextStyle(
                    color: Colors.grey[800],
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Container(
              height: 40,
              child: ListView.builder(
                  itemCount: grouptype.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: ((context, index) {
                    return GroupTypeItem(
                      icon: grouptype[index].icon,
                      type: grouptype[index].type,
                      onTap: () {
                        print("Type Selected");
                      },
                    );
                  })),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Row(
              children: [
                Text(
                  "Group Members",
                  style: TextStyle(
                    color: Colors.grey[800],
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Row(
              children: [
                Icon(
                  Icons.person_add,
                  color: Colors.grey[700],
                ),
                const SizedBox(
                  width: 15,
                ),
                Expanded(
                  child: Text(
                    "You will be able to add your friends after you save this new group.",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      color: Colors.grey[600],
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
