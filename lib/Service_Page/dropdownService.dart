class Bed {
  int id;
  String name;

  Bed(this.id, this.name);
  static List<Bed> getBed() {
    return <Bed>[
      Bed(1, "1 giường/phòng"),
      Bed(2, "2 giường/phòng"),
    ];
  }
}

class Time {
  int id;
  String name;

  Time(this.id, this.name);
  static List<Time> getTime() {
    return <Time>[
      Time(1, "Qua đêm"),
      Time(2, "Cả ngày"),
    ];
  }
}
