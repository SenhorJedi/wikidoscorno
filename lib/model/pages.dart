import 'dart:convert';

Pages pagesFromJson(String str) => Pages.fromJson(json.decode(str));

String pagesToJson(Pages data) => json.encode(data.toJson());

class Pages {
  Pages({
    this.url = '',
    this.label = '',
    this.active = '',
  });

  dynamic url;
  dynamic label;
  dynamic active;

  factory Pages.fromJson(Map<String, dynamic> json) => Pages(
        url: json["url"],
        label: json["label"],
        active: json["active"],
      );

  Map<String, dynamic> toJson() => {
        "url": url,
        "label": label,
        "active": active,
      };
}
