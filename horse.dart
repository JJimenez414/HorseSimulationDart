import "dart:math";
import "dart:io";

class Horse {
  final rand = Random();
  String name = "";
  int cur_distance = 0;
  int cur_speed = 0;
  int cur_stamina = 0;
  int max_stamina = 0;
  int max_speed = 0;
  int acceleration = 0;
  int luck = 0;

  Horse() {
    name = generate_name();
    max_stamina = 1 + rand.nextInt(10-1); // gets a random value from 1 - 10
    max_speed = 10 + rand.nextInt(101 - 10); // gets a random value from 10-100
    acceleration = 1 + rand.nextInt(10-1);
    luck = 1 + rand.nextInt(11-1);
    cur_stamina = max_stamina; // set current stamina to max stamina
  }

  String generate_name() {

    final noun_file = File("nouns-1.txt");
    final adj_file = File("adj-1.txt");

    List<String> noun_list = noun_file.readAsLinesSync();
    List<String> adj_list = adj_file.readAsLinesSync();

    String first_name = noun_list[rand.nextInt(noun_list.length)]; // get a random nous name
    String last_name = adj_list[rand.nextInt(adj_list.length)]; // get a random adj name


    return first_name + " " + last_name; // concatenate the noun and adj and return
  }

  void refresh_stats() {
    cur_stamina = max_stamina;
    cur_distance = 0;
    cur_speed = 0;
  }

  void get_horse_info() {
    print("-----------------------------");
    print("Name: $name");
    print("Max Stamina: $max_stamina");
    print("Max Speed: $max_speed");
    print("Acceleration: $acceleration");
    print("Luck: $luck");
  }

}
