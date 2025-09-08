import "dart:io";
import "horse.dart";
import "race.dart";

void main() {
  stdout.write("Race distance: ");
  String? distance_input = stdin.readLineSync(); // get distance from user
  int distance = int.tryParse(distance_input ?? '') ?? 0; //parse the distance given by user to an int

  stdout.write("Number of horses (per race): ");
  String? num_horses_input = stdin.readLineSync(); // get num of horses
  int num_horses = int.tryParse(num_horses_input ?? '') ?? 0; // parse the num of horses given by user to an int

  stdout.write("Number of races: ");
  String? num_races_input = stdin.readLineSync(); // get number of races
  int num_races = int.tryParse(num_races_input ?? '') ?? 0; // parse the num of races given by user to an int

  print("");

  List<Horse> race_roster = [];

  // get the first inital batch of horses
  for (int i = 0; i < num_horses; i++) {
    Horse horse = Horse();
    race_roster.add(horse);
  }

  // Repeat until we have no more races
  for (int i = 0; i < num_races; i++) {
    // create a random race
    Race race = Race(race_roster, distance);

    // grab the horses that won the race. (Print non-current stats)
    List<Horse> winners = race.simulate();

    winners.forEach((horse) {
      horse.get_horse_info();
    });

    // enter them into a new race, with a brand new roster
    race_roster = []; // create new roster
    int new_horses = num_horses - winners.length; // grab the number of horses we need to create for next race
    
    race_roster.addAll(winners); // keep the winners

    // create new horse and add them to the new roster
    for (int h = 0; h < new_horses; h++) {
      Horse epona = Horse();
      race_roster.add(epona); 
    }

  }

  print("");
  print("Overall Champions");
  for(int c = 0; c < 3; c++) {
    race_roster[c].get_horse_info();
  }
}