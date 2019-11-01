class Schedule {
  List<Booking> data;

  Schedule({this.data});

  Schedule.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = new List<Booking>();
      json['data'].forEach((v) {
        data.add(new Booking.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Booking {
  String id;
  String userId;
  String title;
  String start;

  Booking({this.id, this.userId, this.title, this.start});

  Booking.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    title = json['title'];
    start = json['start'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['title'] = this.title;
    data['start'] = this.start;
    return data;
  }
}
