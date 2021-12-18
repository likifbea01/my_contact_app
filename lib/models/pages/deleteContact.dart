// ignore: file_names
// ignore: file_names
import 'package:flutter/material.dart';

class DeleteContact extends StatelessWidget {
  const DeleteContact({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(" Confirm Delete"),
      content: Text("Are you sure ?"),
      actions: [
        TextButton(
            onPressed: () {
              Navigator.of(context).pop(false);
            },
            child: Text("No")),
        TextButton(
            onPressed: () {
              Navigator.of(context).pop(true);
            },
            child: Text("Yes")),
      ],
    );
  }
}