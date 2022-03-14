import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:racquet_v1/Mobile/Logic/Firebase/authoriser.dart';
import 'package:racquet_v1/Mobile/Logic/Firebase/clubmodel.dart';
import 'package:racquet_v1/Mobile/Logic/Firebase/usermodel.dart';
import 'package:racquet_v1/Mobile/Logic/providers/clubProvider.dart';
import 'package:gato/gato.dart' as gato;
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
  bool isFull = false;
  var clubDB = {};
  var clubDatabase = {};

  @override
  Widget build(BuildContext context) {
    int pvts = _participatesValue.toInt();
    return Scaffold(
      body: Stepper(
        type: StepperType.horizontal,
        currentStep: currentStep,
        onStepTapped: (index) {
          setState(() => currentStep = index);
        },
        onStepContinue: () {
          if (currentStep == 1) {
            if (_participatesValue.toInt() < selectedPlayersUID.length) {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text("My title"),
                    content: Text("This is my message."),
                    actions: [
                      TextButton(
                        child: Text("OK"),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    ],
                  );
                },
              );
            } else {
              AlertDialog(
                title: Text("My title"),
                content: Text("This is my message."),
                actions: [
                  TextButton(
                    child: Text("OK"),
                    onPressed: () {},
                  ),
                ],
              );
            }
          }

          if (currentStep != 2) {
            setState(() => currentStep++);
            print(' yes current step' + currentStep.toString());
            print(' yes pv:' + _participatesValue.toString());
            print(' yes uid' + selectedPlayersUID.length.toString());
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
                    return StreamBuilder(
                      stream: FirebaseFirestore.instance
                          .collection("clubs")
                          .doc(snap['Club UID'])
                          .snapshots(),
                      builder: (BuildContext context,
                          AsyncSnapshot<DocumentSnapshot> snapshot3) {
                        if (!snapshot.hasData) {
                          return CircularProgressIndicator();
                        } else {
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
                                subtitle: Text(
                                    snapshot3.data!['Club Abr'].toString()),
                                // subtitle:
                                //     Text(getClubDoc(snap['Club ID']).toString()),
                                trailing: _buildSelectIcon(isSelected!, snap)),
                          );
                        }
                      },
                    );
                  },
                );
              },
            ),
          ),

          // Step(
          Step(
            title: Text(
              'Review',
            ),
            isActive: currentStep >= 2,
            content: Column(
              children: [
                Text("Number of Participants: $pvts"),
                StreamBuilder(
                  stream: FirebaseFirestore.instance
                      .collection('users')
                      .snapshots(),
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
                        itemCount: selectedPlayersUID.length,
                        itemBuilder: (ctx, index) {
                          // var map =
                          //     lookUpPlayer(index, selectedPlayersUID[index]);
                          // var maps = FirebaseFirestore.instance
                          //     .collection("users")
                          //     .doc(selectedPlayersUID[index])
                          //     .get();

                          // var snap = UserModel.fromSnap(maps);

                          return StreamBuilder(
                            stream: FirebaseFirestore.instance
                                .collection("users")
                                .doc(selectedPlayersUID[index])
                                .snapshots(),
                            builder: (BuildContext context,
                                AsyncSnapshot<DocumentSnapshot> snapshot2) {
                              if (!snapshot.hasData) {
                                return CircularProgressIndicator();
                              } else {
                                return Card(
                                  margin: EdgeInsets.symmetric(vertical: 5),
                                  color: Theme.of(context).primaryColor,
                                  child: ListTile(
                                    title: Row(
                                      children: [
                                        Text(
                                          snapshot2.data!['forename'] +
                                              ' ' +
                                              snapshot2.data!['surname'],
                                        )
                                      ],
                                    ),
                                    subtitle: Text(
                                        snapshot2.data!['email'].toString()),
                                    trailing: CircleAvatar(
                                      backgroundImage: NetworkImage(
                                          snapshot2.data!['ppURL']),
                                      radius: 25,
                                    ),
                                  ),
                                );
                              }
                            },
                          );
                        });
                  },
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  void onTap(bool isSelected, int index, snap, alreadyExists) {
    print(selectedPlayersUID);

    if (selectedPlayersUID.length < _participatesValue) {
      if (isSelectionMode) {
        setState(() {
          selectedFlag[index] = !isSelected;
          print('selected Flag: $isSelected');
          //isSelectionMode = selectedFlag.containsValue(true);
        });
      } else {}
    }

    if (isSelected) {
      print('TRUE');
      selectedPlayersUID.remove(snap["uid"]);
      // selectedPlayersUID.remove(snap.toString());
    } else {
      if (selectedPlayersUID.length < _participatesValue) {
        print('FALSE');
        selectedPlayersUID.add(snap["uid"]);
        setState(() {
          isFull = true;
        });
        // selectedPlayersUID.add(snap.toString());
      }
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

  _buildSelectIcon(bool isSelected, Map snap) {
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

//   Future<String> getClubDoc(int ClubPlayerID) async {
//     setState(() {
//       isLoading = true;
//     });
//     try {
//       var clubIDFromDatabase = await FirebaseFirestore.instance
//           .collection("clubs")
//           .where("Club ID", isEqualTo: ClubPlayerID)
//           .get()
//           .then((querySnapshot) {
//         querySnapshot.docs.forEach((result) {
//           clubDB = result.data();
//           print(result.data());
//         });
//       });

//       var clubData = await FirebaseFirestore.instance
//           .collection("clubs")
//           .doc(clubDB['uid'])
//           .get();

//       print(clubDB);
//       clubDatabase = clubData.data()!;
//       print(clubDatabase);
//       return clubDatabase['Club Abr'];
//     } catch (err) {
//       showSnackBar(err.toString(), context);
//       setState(() {
//         isLoading = false;
//       });
//       return err.toString();
//     }
//   }
// }

