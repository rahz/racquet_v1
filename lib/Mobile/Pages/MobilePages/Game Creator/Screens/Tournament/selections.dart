// ignore_for_file: prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:racquet_v1/Mobile/Logic/Firebase/clubmodel.dart';
import 'package:racquet_v1/Mobile/Pages/MobilePages/Game%20Creator/Screens/Tournament/liveTournament.dart';

import '../../../../../Logic/Utilities/snackbar.dart';
import '../../../../../Logic/providers/clubProvider.dart';
import '../../../Player Analytics/Screen/clubRankingScreen.dart';
import 'Widgets/ClubSelection.dart';

class TournamentSelectionEntries extends StatefulWidget {
  const TournamentSelectionEntries({Key? key}) : super(key: key);

  @override
  State<TournamentSelectionEntries> createState() =>
      _TournamentSelectionEntriesState();
}

class _TournamentSelectionEntriesState
    extends State<TournamentSelectionEntries> {
  int currentStep = 0;
  double _participatesValue = 20;
  Map<int, bool> selectedFlag = {};
  List<String> selectedPlayersUID = <String>[];
  bool isSelectionMode = true;
  final firestore = FirebaseFirestore.instance;
  bool isLoading = false;
  bool isPressed = false;
  var clubDatabase = {};
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.arrow_back,
          color: Theme.of(context).backgroundColor,
        ),
        backgroundColor: Theme.of(context).primaryColor,
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Padding(
        padding: const EdgeInsets.only(top: 10.0),
        child: Stepper(
          type: StepperType.vertical,
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
              isActive: currentStep >= 0,
              title: Text("Number of Participants"),
              content: Slider(
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
            ),
            Step(
              isActive: currentStep >= 1,
              title: Text("Choose Participants"),
              content: StreamBuilder(
                stream:
                    FirebaseFirestore.instance.collection('users').snapshots(),
                builder: (context,
                    AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>>
                        snapshot) {
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
                      var clubData = FirebaseFirestore.instance
                          .collection('clubs')
                          .doc(snap['Club UID'])
                          .get();
                      index = index + 1;
                      selectedFlag[index] = selectedFlag[index] ?? false;
                      bool? isSelected = selectedFlag[index];
                      return Card(
                        margin: EdgeInsets.symmetric(vertical: 5),
                        color: Theme.of(context).primaryColor,
                        child: ListTile(
                            onLongPress: () => onLongPress(isSelected!, index),
                            onTap: () => onTap(isSelected!, index),
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
                            subtitle: Text(clubDatabase['Club Abr'].toString()),
                            trailing: _buildSelectIcon(isSelected!, snap)),
                      );
                    },
                  );
                },
              ),
            ),
            Step(
              title: Text("Review"),
              content: Text(
                  "Relay all options chosen by user\nParticipants: $_participatesValue"),
            ),
          ],
        ),
      ),
    );
  }

  void onTap(bool isSelected, int index) {
    if (isSelectionMode) {
      setState(() {
        selectedFlag[index] = !isSelected;
        isSelectionMode = selectedFlag.containsValue(true);
      });
    } else {}
  }

  void onLongPress(bool isSelected, int index) {
    setState(() {
      isSelectionMode = selectedFlag.containsValue(true);
      print(selectedFlag);
    });
  }

  Widget _buildSelectIcon(bool isSelected, Map snap) {
    if (isSelectionMode) {
      if (isSelected) {
        return CircleAvatar(
          backgroundImage: NetworkImage(snap['ppURL']),
          radius: 25,
        );
      } else {
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
      }
    } else {
      return CircleAvatar(
        backgroundImage: NetworkImage(snap['ppURL']),
        radius: 25,
      );
    }
  }
}
