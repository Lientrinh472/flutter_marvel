import 'dart:convert';

// To parse this JSON data, do
//
//     final marvel = marvelFromJson(jsonString);

import 'dart:convert';
import 'dart:js_util';

import 'package:flutter/src/material/data_table.dart';

Marvel marvelFromJson(String str) => Marvel.fromJson(json.decode(str));

String marvelToJson(Marvel data) => json.encode(data.toJson());

class Marvel {
    Marvel({
        required this.code,
        required this.status,
        required this.copyright,
        required this.attributionText,
        required this.attributionHtml,
        required this.etag,
        this.data,
    });

    int code;
    String status;
    String copyright;
    String attributionText;
    String attributionHtml;
    String etag;
    Data? data;

    factory Marvel.fromJson(Map<String, dynamic> json) => Marvel(
        code: json["code"],
        status: json["status"],
        copyright: json["copyright"],
        attributionText: json["attributionText"],
        attributionHtml: json["attributionHTML"],
        etag: json["etag"],
        data: Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "code": code,
        "status": status,
        "copyright": copyright,
        "attributionText": attributionText,
        "attributionHTML": attributionHtml,
        "etag": etag,
        "data": data?.toJson(),
    };

  static map(DataRow Function(dynamic book) param0) {}
}

class Data {
    Data({
        this.offset,
        this.limit,
        this.total,
        this.count,
        required this.results,
    });

    int? offset;
    int? limit;
    int? total;
    int? count;
    List<Result> results;

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        offset: json["offset"],
        limit: json["limit"],
        total: json["total"],
        count: json["count"],
        results: List<Result>.from(json["results"].map((x) => Result.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "offset": offset,
        "limit": limit,
        "total": total,
        "count": count,
        "results": List<dynamic>.from(results.map((x) => x.toJson())),
    };
}

class Result {
    Result({
        required this.id,
        required this.name,
        required this.description,
        required this.modified,
        required this.thumbnail,
        required this.resourceUri,
        required this.comics,
        this.series,
        this.stories,
        this.events,
        required this.urls,
    });

    int id;
    String name;
    String description;
    String modified;
    Thumbnail thumbnail;
    String resourceUri;
    Comics comics;
    Comics? series;
    Stories? stories;
    Comics? events;
    List<Url> urls = newObject();

    factory Result.fromJson(Map<String, dynamic> json) => Result(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        modified: json["modified"],
        thumbnail: Thumbnail.fromJson(json["thumbnail"]),
        resourceUri: json["resourceURI"],
        comics: Comics.fromJson(json["comics"]),
        series: Comics.fromJson(json["series"]),
        stories: Stories.fromJson(json["stories"]),
        events: Comics.fromJson(json["events"]),
        urls: List<Url>.from(json["urls"].map((x) => Url.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "modified": modified,
        "thumbnail": thumbnail.toJson(),
        "resourceURI": resourceUri,
        "comics": comics.toJson(),
        "series": series?.toJson(),
        "stories": stories?.toJson(),
        "events": events?.toJson(),
        "urls": List<dynamic>.from(urls.map((x) => x.toJson())),
    };
}

class Comics {
    Comics({
        this.available,
        this.collectionUri,
        required this.items,
        this.returned,
    });

    int? available;
    String? collectionUri;
    List<ComicsItem> items;
    int? returned;

    factory Comics.fromJson(Map<String, dynamic> json) => Comics(
        available: json["available"],
        collectionUri: json["collectionURI"],
        items: List<ComicsItem>.from(json["items"].map((x) => ComicsItem.fromJson(x))),
        returned: json["returned"],
    );

    Map<String, dynamic> toJson() => {
        "available": available,
        "collectionURI": collectionUri,
        "items": List<dynamic>.from(items.map((x) => x.toJson())),
        "returned": returned,
    };
}

class ComicsItem {
    ComicsItem({
        this.resourceUri,
        this.name,
    });

    String? resourceUri;
    String? name;

    factory ComicsItem.fromJson(Map<String, dynamic> json) => ComicsItem(
        resourceUri: json["resourceURI"],
        name: json["name"],
    );

    Map<String, dynamic> toJson() => {
        "resourceURI": resourceUri,
        "name": name,
    };
}

class Stories {
    Stories({
        this.available,
        this.collectionUri,
        required this.items,
        this.returned,
    });

    int? available;
    String? collectionUri;
    List<StoriesItem> items;
    int? returned;

    factory Stories.fromJson(Map<String, dynamic> json) => Stories(
        available: json["available"],
        collectionUri: json["collectionURI"],
        items: List<StoriesItem>.from(json["items"].map((x) => StoriesItem.fromJson(x))),
        returned: json["returned"],
    );

    Map<String, dynamic> toJson() => {
        "available": available,
        "collectionURI": collectionUri,
        "items": List<dynamic>.from(items.map((x) => x.toJson())),
        "returned": returned,
    };
}

class StoriesItem {
    StoriesItem({
        this.resourceUri,
        this.name,
        this.type,
    });

    String? resourceUri;
    String? name;
    String? type;

    factory StoriesItem.fromJson(Map<String, dynamic> json) => StoriesItem(
        resourceUri: json["resourceURI"],
        name: json["name"],
        type: json["type"],
    );

    Map<String, dynamic> toJson() => {
        "resourceURI": resourceUri,
        "name": name,
        "type": type,
    };
}

// enum ItemType { COVER, INTERIOR_STORY, EMPTY }

// final itemTypeValues = EnumValues({
//     "cover": ItemType.COVER,
//     "": ItemType.EMPTY,
//     "interiorStory": ItemType.INTERIOR_STORY
// });

class Thumbnail {
    Thumbnail({
        this.path,
        this.extension,
    });

    String? path;
    String? extension;

    factory Thumbnail.fromJson(Map<String, dynamic> json) => Thumbnail(
        path: json["path"],
        extension: json["extension"],
    );

    Map<String, dynamic> toJson() => {
        "path": path,
        "extension": extension,
    };
}

// enum Extension { JPG, GIF }

class Url {
    Url({
        required this.type,
        required this.url,
    });

    String type;
    String url;

    factory Url.fromJson(Map<String, dynamic> json) => Url(
        type: json["type"],
        url: json["url"],
    );

    Map<String, dynamic> toJson() => {
        "type": type,
        "url": url,
    };
}

// enum UrlType { DETAIL, WIKI, COMICLINK }

// final urlTypeValues = EnumValues({
//     "comiclink": UrlType.COMICLINK,
//     "detail": UrlType.DETAIL,
//     "wiki": UrlType.WIKI
// });

// class EnumValues<T> {
//     late Map<String, T> map;
//     late Map<T, String> reverseMap;

//     EnumValues(map);

//     Map<T, String> get reverse {
//         if (reverseMap == null) {
//             reverseMap = map.map((k, v) => MapEntry(v, k));
//         }
//         return reverseMap;
//     }
// }



// List<Marvel> marvelFromJson(String str) => List<Marvel>.from(json.decode(str).map((x) => Marvel.fromJson(x)));

// String marvelToJson(List<Marvel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

// class Marvel {
//     Marvel({
//         required this.id,
//         required this.name,
//         required this.description,
//         required this.modified,
//         required this.thumbnail,
//         required this.resourceUri,
//         required this.comics,
//     });

//     int id;
//     String name;
//     String description;
//     String modified;
//     String thumbnail;
//     String resourceUri;
//     String comics;


//     factory Marvel.fromJson(Map<String, dynamic> json) => Marvel(
//         id: json["id"],
//         name: json["name"],
//         description: json["description"],
//         modified: json["modified"],
//         thumbnail:json["thumbnail"],
//         resourceUri: json["resourceURI"],
//         comics: json["comics"],
        
//     );

//     Map<String, dynamic> toJson() => {
//         "id": id,
//         "name": name,
//         "description": description,
//         "modified": modified,
//         "thumbnail": thumbnail,
//         "resourceURI": resourceUri,
//         "comics": comics,
//     };
// }
