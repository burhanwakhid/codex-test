
import 'dart:convert';

CommentModel commentModelFromJson(String str) => CommentModel.fromJson(json.decode(str));

String commentModelToJson(CommentModel data) => json.encode(data.toJson());

class CommentModel {
    String by;
    int id;
    List<int> kids;
    int parent;
    String text;
    int time;
    String type;

    CommentModel({
        this.by,
        this.id,
        this.kids,
        this.parent,
        this.text,
        this.time,
        this.type,
    });

    factory CommentModel.fromJson(Map<String, dynamic> json) => CommentModel(
        by: json["by"] == null ? null : json["by"],
        id: json["id"] == null ? null : json["id"],
        kids: json["kids"] == null ? null : List<int>.from(json["kids"].map((x) => x)),
        parent: json["parent"] == null ? null : json["parent"],
        text: json["text"] == null ? null : json["text"],
        time: json["time"] == null ? null : json["time"],
        type: json["type"] == null ? null : json["type"],
    );

    Map<String, dynamic> toJson() => {
        "by": by == null ? null : by,
        "id": id == null ? null : id,
        "kids": kids == null ? null : List<dynamic>.from(kids.map((x) => x)),
        "parent": parent == null ? null : parent,
        "text": text == null ? null : text,
        "time": time == null ? null : time,
        "type": type == null ? null : type,
    };
}
