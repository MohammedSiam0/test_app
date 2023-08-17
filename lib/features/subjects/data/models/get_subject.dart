class Item {
  final int id;
  final String name;

  Item({
    required this.id,
    required this.name,
  });
}

class GetSubject {
  final bool status;
  final String message;
  final List<Item> object;
  final int code;

  GetSubject({
    required this.status,
    required this.message,
    required this.object,
    required this.code,
  });

  factory GetSubject.fromJson(Map<String, dynamic> json) {
    return GetSubject(
      status: json['status'] as bool,
      message: json['message'] as String,
      object: (json['object'] as List<dynamic>)
          .map((item) => Item(
                id: item['id'] as int,
                name: item['name'] as String,
              ))
          .toList(),
      code: json['code'] as int,
    );
  }
}
