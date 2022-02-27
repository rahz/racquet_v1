import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'Logic/Utilities/snackbar.dart';

class ProfilePicForAppBar extends StatefulWidget {
  final snap;
  const ProfilePicForAppBar({Key? key, required this.snap}) : super(key: key);

  @override
  State<ProfilePicForAppBar> createState() => _ProfilePicForAppBarState();
}

class _ProfilePicForAppBarState extends State<ProfilePicForAppBar> {
  @override
  void initState() {
    super.initState();
    fetchCommentLen();
  }

  fetchCommentLen() async {
    try {
      QuerySnapshot snap = await FirebaseFirestore.instance
          .collection('posts')
          .doc(widget.snap['postId'])
          .collection('comments')
          .get();
    } catch (err) {
      showSnackBar(err.toString(), context);
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: const CircleAvatar(
        radius: 30,
        backgroundImage: ExactAssetImage('assets/images/person.jpeg'),
      ),
      padding: const EdgeInsets.all(1.5), // borde width
      decoration: BoxDecoration(
          color: Theme.of(context).backgroundColor, // border color
          shape: BoxShape.circle),
    );
  }
}
