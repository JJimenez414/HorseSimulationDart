import "horse.dart";
import 'dart:math';

class Race {
  late List<Horse> roster;
  int distance = 0;

  Race(this.roster, this.distance);

  List<Horse> simulate() {
    final rand = Random();

    List<Horse> winners = [];

    // reset horses before the race
    for (var h in roster) {
      h.refresh_stats();
    }

  
    final Set<Horse> finished = {};

    // Keep doing rounds until at least 3 horses have crossed or all horses finished
    while (winners.length < 3 && finished.length < roster.length) {
      for (var h in roster) {
        if (finished.contains(h)) continue; // skip horses that already finished

        // Decrease current stamina by 1
        h.cur_stamina -= 1;

        // If current stamina is less than 0, horse is not allowed to accelerate this turn
        if (h.cur_stamina >= 0) {
          // Increase current speed by acceleration but do not exceed max speed
          h.cur_speed += h.acceleration;
          if (h.cur_speed > h.max_speed) h.cur_speed = h.max_speed;
        }

        // Roll 0..10 to determine if the horse stumbles
        int roll = rand.nextInt(11);
        if (roll > h.luck) {
          // horse stumbles and does not move this turn
        } else {
          // horse moves by its current speed
          h.cur_distance += h.cur_speed;
        }

        // Check if horse crossed the finish line
        if (h.cur_distance >= distance) {
          winners.add(h);
          finished.add(h);
        }

        // If we already have 3 or more winners, we can stop checking remaining horses this round
        // (but we still allow multiple horses in the same round to be added in their turn)
        if (winners.length >= 3 && finished.length >= roster.length) break;
      }
    }

    return winners;
  }
}
