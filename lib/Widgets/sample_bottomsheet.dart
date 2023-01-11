import 'package:flutter/material.dart';


// ignore: must_be_immutable
class SampleBottomSheet extends StatelessWidget {
  void Function()? onFirstImageTapped;
  void Function()? onSecondImageTapped;
  final String firstImagePath;
  final String firstImageText;
   final String secondImagePath;
  final String secondImageText;
   SampleBottomSheet({super.key, required this.onFirstImageTapped, 
   required this.onSecondImageTapped,
   required this.firstImagePath,required this.firstImageText,required this.secondImagePath,required this.secondImageText
   });

  @override
  Widget build(BuildContext context) {
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
                  onTap: onFirstImageTapped
           
                  ,
                  child: Container(
                      height: 50,
                      decoration: BoxDecoration(
                          color: Colors.grey[500],
                          borderRadius: BorderRadius.circular(10)),
                      padding: const EdgeInsets.all(10),
                      child: Image.asset(firstImagePath),
                )),
                Text(
                  firstImageText,
                  style: TextStyle(color: Colors.grey[700], fontSize: 18),
                )
              ],
            ),
            Column(
              children: [
                GestureDetector(
                  onTap: onSecondImageTapped
         
                  ,
                  child: Container(
                      height: 50,
                      decoration: BoxDecoration(
                          color: Colors.grey[500],
                          borderRadius: BorderRadius.circular(10)),
                      padding: const EdgeInsets.all(10),
                      child: Image.asset(secondImagePath)),
                ),
                Text(
                  secondImageText,
                  style: TextStyle(color: Colors.grey[700], fontSize: 18),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
