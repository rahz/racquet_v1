import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:racquet_v1/Mobile/Logic/Firebase/clubmodel.dart';
import 'package:racquet_v1/Mobile/Logic/providers/clubProvider.dart';

import '../../../../../Logic/Utilities/snackbar.dart';
import 'liveTournament.dart';

class HorizontalSelectionsForTournament extends StatefulWidget {
  const HorizontalSelectionsForTournament({Key? key}) : super(key: key);

  @override
  _HorizontalSelectionsForTournamentState createState() =>
      _HorizontalSelectionsForTournamentState();
}

class _HorizontalSelectionsForTournamentState
    extends State<HorizontalSelectionsForTournament> {
  int currentStep = 0;
  double _participatesValue = 20;
  Map<int, bool> selectedFlag = {};
  List<String> selectedPlayersUID = <String>[];
  bool isSelectionMode = true;
  final firestore = FirebaseFirestore.instance;
  bool isLoading = false;
  bool isPressed = false;
  var playerDatabase = {};

  Future<String> lookUpPlayer(uid) async {
    try {
      var clubData =
          await FirebaseFirestore.instance.collection("users").doc(uid).get();

      playerDatabase = clubData.data()!;
    } catch (err) {
      showSnackBar(err.toString(), context);
    }
    return 'null';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stepper(
        type: StepperType.horizontal,
        currentStep: currentStep,
        onStepTapped: (index) {
          setState(() => currentStep = index);
        },
        onStepContinue: () {
          if (currentStep != 2) {
            setState(() => currentStep++);
          } else if (currentStep == 2) {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const LiveTourneyScreen()),
            );
          }
        },
        onStepCancel: () {
          if (currentStep != 0) {
            setState(() => currentStep--);
          }
        },
        steps: [
          Step(
            title: Text(
              'Participants',
            ),
            isActive: currentStep >= 0,
            content: Column(
              children: [
                Text('Choose how many players will be participating:'),
                Slider(
                  min: 4,
                  max: 24,
                  value: _participatesValue,
                  divisions: 20,
                  label: '${_participatesValue.round()}',
                  onChanged: (value) {
                    setState(() {
                      _participatesValue = value;
                    });
                  },
                ),
              ],
            ),
          ),
          Step(
            title: Text('Players'),
            isActive: currentStep >= 1,

            //content: Text('Content')),
            content: StreamBuilder(
              stream:
                  FirebaseFirestore.instance.collection('users').snapshots(),
              builder: (context,
                  AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                // return Text('Hi');
                return ListView.builder(
                  padding: EdgeInsets.only(top: 5, bottom: 5),
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (ctx, index) {
                    var snap = snapshot.data!.docs[index].data();
                    final alreadyExistsInSelected =
                        selectedPlayersUID.contains(snap['uid']);

                    index = index;
                    selectedFlag[index] = selectedFlag[index] ?? false;
                    bool? isSelected = selectedFlag[index];
                    return Card(
                      margin: EdgeInsets.symmetric(vertical: 5),
                      color: Theme.of(context).primaryColor,
                      child: ListTile(
                          onLongPress: () => onLongPress(
                                isSelected!,
                                index,
                              ),
                          onTap: () => onTap(isSelected!, index, snap,
                              alreadyExistsInSelected),
                          title: Row(
                            children: [
                              Text(
                                snap['forename'].toString(),
                                style: TextStyle(fontSize: 18),
                              ),
                              Text(' '),
                              Text(
                                snap['surname'].toString(),
                                style: TextStyle(fontSize: 18),
                              ),
                            ],
                          ),
                          subtitle: Text(snap['Club ID'].toString()),
                          trailing: _buildSelectIcon(isSelected!, snap)),
                    );
                  },
                );
              },
            ),
          ),
          Step(
              title: Text(
                'Review',
              ),
              isActive: currentStep >= 2,
              // content: Slider(
              //   min: 4,
              //   max: 24,
              //   value: _participatesValue,
              //   divisions: 20,
              //   label: '${_participatesValue.round()}',
              //   onChanged: (value) {
              //     setState(() {
              //       _participatesValue = value;
              //     });
              //   },
              // ),
              content: Column(
                children: [
                  Text(selectedPlayersUID.toString()),
                  Text(playerDatabase.toString()),
                ],
              )),
        ],
      ),
    );
  }

  void onTap(bool isSelected, int index, snap, alreadyExists) {
    if (isSelectionMode) {
      setState(() {
        selectedFlag[index] = !isSelected;
        print('selected Flag: $isSelected');
        //isSelectionMode = selectedFlag.containsValue(true);
      });
    } else {}

    if (isSelected) {
      print('TRUE');
      selectedPlayersUID.remove(snap['uid']);
    } else {
      print('FALSE');
      selectedPlayersUID.add(snap['uid']);
    }
    // _PlayersSelected.addAll(snap);

    print(snap['forename']);
  }

  void onLongPress(bool isSelected, int index) {
    setState(() {
      // isSelectionMode = selectedFlag.containsValue(true);
      print(isSelected);
      print(selectedPlayersUID);
    });
  }

  Widget _buildSelectIcon(bool isSelected, Map snap) {
    if (isSelected) {
      return Stack(
        children: [
          CircleAvatar(
            backgroundImage: NetworkImage(snap['ppURL']),
            radius: 25,
          ),
          Container(
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Theme.of(context).backgroundColor.withOpacity(0.4)),
            height: 50,
            width: 50,
          ),
          SizedBox(
            height: 50,
            width: 50,
            child: Icon(
              Icons.check_rounded,
              color: Theme.of(context).textTheme.bodyText2?.color,
              size: 40,
            ),
          ),
        ],
      );
    } else {
      return CircleAvatar(
        backgroundImage: NetworkImage(snap['ppURL']),
        radius: 25,
      );
    }
  }
}
