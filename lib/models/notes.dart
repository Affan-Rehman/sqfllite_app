// ignore_for_file: prefer_typing_uninitialized_variables

class Notes {
  late String _title;
  late String _date;
  late String _description;
  late int _priority;
  var _id;

  Notes(this._date, this._title, this._description, this._priority, [this._id]);

  String get title => _title;
  set title(String value) => _title = value;

  String get date => _date;
  set date(String value) => _date = value;

  String get description => _description;
  set description(String value) => _description = value;

  int get priority => _priority;
  set priority(int value) => _priority = value;

  get id => _id;

  //converting to db map
  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = <String, dynamic>{};
    map["id"] = _id;
    map["title"] = _title;
    map["description"] = _description;
    map["date"] = _date;
    map["priority"] = _priority;

    return map;
  }

// converting from db map
  Notes.fromMapObject(Map<String, dynamic> map) {
    _id = map["id"];
    _priority = map["priority"];
    _date = map["date"] ?? "";
    _description = map["description"] ?? "";
    _title = map["title"] ?? "";
  }
}
