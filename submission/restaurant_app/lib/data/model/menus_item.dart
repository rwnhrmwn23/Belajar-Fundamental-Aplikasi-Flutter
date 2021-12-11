class MenusItem {
  String name;

  MenusItem({
    required this.name,
  });

  factory MenusItem.fromJson(Map<String, dynamic> json) =>
      MenusItem(name: json['name']);

  Map<String, dynamic> toJson() => {
    'name': name,
  };
}