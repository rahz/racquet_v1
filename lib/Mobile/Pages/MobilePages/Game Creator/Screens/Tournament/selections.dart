// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:racquet_v1/Mobile/Pages/MobilePages/Game%20Creator/Screens/Tournament/liveTournament.dart';

import '../../../Player Analytics/Screen/clubRankingScreen.dart';

class TournamentSelectionEntries extends StatefulWidget {
  const TournamentSelectionEntries({Key? key}) : super(key: key);

  @override
  State<TournamentSelectionEntries> createState() =>
      _TournamentSelectionEntriesState();
}

class _TournamentSelectionEntriesState
    extends State<TournamentSelectionEntries> {
  int currentStep = 0;
  double _ParticipatesValue = 20;
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
          //type: StepperType.vertical,
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
                  value: _ParticipatesValue,
                  divisions: 20,
                  label: '${_ParticipatesValue.round()}',
                  onChanged: (value) {
                    setState(() {
                      _ParticipatesValue = value;
                    });
                  },
                )
                //Text("Dropbox of numbers ranging from 4 - 24"),
                ),
            Step(
              isActive: currentStep >= 1,
              title: Text("Choose Participants"),
              content: Text("List of clubs and corresponding players"),
            ),
            Step(
              title: Text("Review"),
              content: Text(
                  "Relay all options chosen by user\nParticipants: $_ParticipatesValue"),
            ),
          ],
        ),
      ),
    );
  }
}
