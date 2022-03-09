import 'package:flutter/material.dart';

class RowOfPlayers extends StatefulWidget {
  final snap;
  const RowOfPlayers({
    Key? key,
    required this.snap,
  }) : super(key: key);

  @override
  _RowOfPlayersState createState() => _RowOfPlayersState();
}

class _RowOfPlayersState extends State<RowOfPlayers> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 5),
      color: Theme.of(context).primaryColor,
      child: ListTile(
        leading: CircleAvatar(
          backgroundImage: NetworkImage(widget.snap['ppURL']),
          //player.ppURL!),
          radius: 24,
        ),
        title: Row(
          children: [
            Text(widget.snap['forename'].toString()),
            Text(' '),
            Text(widget.snap['surname'].toString()),
          ],
        ),
        trailing: CircleAvatar(
          backgroundImage: NetworkImage(widget.snap['ppURL']),
          //player.ppURL!),
          radius: 24,
        ),
      ),
    );
  }
}
