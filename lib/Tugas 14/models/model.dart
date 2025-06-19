// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

Welcome welcomeFromJson(String str) => Welcome.fromJson(json.decode(str));

String welcomeToJson(Welcome data) => json.encode(data.toJson());

class Welcome {
  Pagination pagination;
  List<Datum> data;

  Welcome({required this.pagination, required this.data});

  factory Welcome.fromJson(Map<String, dynamic> json) => Welcome(
    pagination: Pagination.fromJson(json["pagination"]),
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "pagination": pagination.toJson(),
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class Datum {
  int malId;
  String url;
  Map<String, AnimeImage> images;
  Trailer trailer;
  bool approved;
  List<Title> titles;
  String title;
  String? titleEnglish;
  String titleJapanese;
  List<String> titleSynonyms;
  DatumType type;
  Source source;
  int? episodes;
  Status status;
  bool airing;
  Aired aired;
  String duration;
  Rating rating;
  double? score;
  int scoredBy;
  int rank;
  int popularity;
  int members;
  int favorites;
  String synopsis;
  String? background;
  Season? season;
  int? year;
  Broadcast broadcast;
  List<Demographic> producers;
  List<Demographic> licensors;
  List<Demographic> studios;
  List<Demographic> genres;
  List<dynamic> explicitGenres;
  List<Demographic> themes;
  List<Demographic> demographics;

  Datum({
    required this.malId,
    required this.url,
    required this.images,
    required this.trailer,
    required this.approved,
    required this.titles,
    required this.title,
    this.titleEnglish,
    required this.titleJapanese,
    required this.titleSynonyms,
    required this.type,
    required this.source,
    this.episodes,
    required this.status,
    required this.airing,
    required this.aired,
    required this.duration,
    required this.rating,
    this.score,
    required this.scoredBy,
    required this.rank,
    required this.popularity,
    required this.members,
    required this.favorites,
    required this.synopsis,
    this.background,
    this.season,
    this.year,
    required this.broadcast,
    required this.producers,
    required this.licensors,
    required this.studios,
    required this.genres,
    required this.explicitGenres,
    required this.themes,
    required this.demographics,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    malId: json["mal_id"],
    url: json["url"],
    images: {'jpg': AnimeImage.fromJson(json["images"]["jpg"])},
    trailer: Trailer.fromJson(json["trailer"]),
    approved: json["approved"] ?? false,
    titles: List<Title>.from(
      (json["titles"] as List<dynamic>?)?.map((x) => Title.fromJson(x)) ?? [],
    ),
    title: json["title"] ?? 'No title',
    titleEnglish: json["title_english"],
    titleJapanese: json["title_japanese"] ?? '',
    titleSynonyms: List<String>.from(
      (json["title_synonyms"] as List<dynamic>?)?.map((x) => x.toString()) ??
          [],
    ),
    type: datumTypeValues.map[json["type"]] ?? DatumType.TV,
    source: sourceValues.map[json["source"]] ?? Source.ORIGINAL,
    episodes: json["episodes"] as int?,
    status: statusValues.map[json["status"]] ?? Status.FINISHED_AIRING,
    airing: json["airing"] ?? false,
    aired: Aired.fromJson(json["aired"]),
    duration: json["duration"] ?? 'N/A',
    rating: ratingValues.map[json["rating"]] ?? Rating.PG_13_TEENS_13_OR_OLDER,
    score: (json["score"] as num?)?.toDouble(),
    scoredBy: json["scored_by"] ?? 0,
    rank: json["rank"] ?? 0,
    popularity: json["popularity"] ?? 0,
    members: json["members"] ?? 0,
    favorites: json["favorites"] ?? 0,
    synopsis: json["synopsis"] ?? '',
    background: json["background"],
    season: seasonValues.map[json["season"]],
    year: json["year"] as int?,
    broadcast: Broadcast.fromJson(json["broadcast"]),
    producers: List<Demographic>.from(
      (json["producers"] as List<dynamic>?)?.map(
            (x) => Demographic.fromJson(x),
          ) ??
          [],
    ),
    licensors: List<Demographic>.from(
      (json["licensors"] as List<dynamic>?)?.map(
            (x) => Demographic.fromJson(x),
          ) ??
          [],
    ),
    studios: List<Demographic>.from(
      (json["studios"] as List<dynamic>?)?.map(
            (x) => Demographic.fromJson(x),
          ) ??
          [],
    ),
    genres: List<Demographic>.from(
      (json["genres"] as List<dynamic>?)?.map((x) => Demographic.fromJson(x)) ??
          [],
    ),
    explicitGenres: List<dynamic>.from(
      (json["explicit_genres"] as List<dynamic>?) ?? [],
    ),
    themes: List<Demographic>.from(
      (json["themes"] as List<dynamic>?)?.map((x) => Demographic.fromJson(x)) ??
          [],
    ),
    demographics: List<Demographic>.from(
      (json["demographics"] as List<dynamic>?)?.map(
            (x) => Demographic.fromJson(x),
          ) ??
          [],
    ),
  );

  Map<String, dynamic> toJson() => {
    "mal_id": malId,
    "url": url,
    "images": {'jpg': images['jpg']!.toJson()},
    "trailer": trailer.toJson(),
    "approved": approved,
    "titles": List<dynamic>.from(titles.map((x) => x.toJson())),
    "title": title,
    "title_english": titleEnglish,
    "title_japanese": titleJapanese,
    "title_synonyms": List<dynamic>.from(titleSynonyms.map((x) => x)),
    "type": datumTypeValues.reverse[type],
    "source": sourceValues.reverse[source],
    "episodes": episodes,
    "status": statusValues.reverse[status],
    "airing": airing,
    "aired": aired.toJson(),
    "duration": duration,
    "rating": ratingValues.reverse[rating],
    "score": score,
    "scored_by": scoredBy,
    "rank": rank,
    "popularity": popularity,
    "members": members,
    "favorites": favorites,
    "synopsis": synopsis,
    "background": background,
    "season": season != null ? seasonValues.reverse[season] : null,
    "year": year,
    "broadcast": broadcast.toJson(),
    "producers": List<dynamic>.from(producers.map((x) => x.toJson())),
    "licensors": List<dynamic>.from(licensors.map((x) => x.toJson())),
    "studios": List<dynamic>.from(studios.map((x) => x.toJson())),
    "genres": List<dynamic>.from(genres.map((x) => x.toJson())),
    "explicit_genres": List<dynamic>.from(explicitGenres.map((x) => x)),
    "themes": List<dynamic>.from(themes.map((x) => x.toJson())),
    "demographics": List<dynamic>.from(demographics.map((x) => x.toJson())),
  };
}

class Aired {
  DateTime from;
  DateTime? to;
  Prop prop;
  String string;

  Aired({
    required this.from,
    this.to,
    required this.prop,
    required this.string,
  });

  factory Aired.fromJson(Map<String, dynamic> json) => Aired(
    from: DateTime.parse(json["from"]),
    to: json["to"] != null ? DateTime.parse(json["to"]) : null,
    prop: Prop.fromJson(json["prop"]),
    string: json["string"] ?? '',
  );

  Map<String, dynamic> toJson() => {
    "from": from.toIso8601String(),
    "to": to?.toIso8601String(),
    "prop": prop.toJson(),
    "string": string,
  };
}

class Prop {
  From from;
  From? to;

  Prop({required this.from, this.to});

  factory Prop.fromJson(Map<String, dynamic> json) => Prop(
    from: From.fromJson(json["from"]),
    to: json["to"] != null ? From.fromJson(json["to"]) : null,
  );

  Map<String, dynamic> toJson() => {"from": from.toJson(), "to": to?.toJson()};
}

class From {
  int? day;
  int? month;
  int? year;

  From({this.day, this.month, this.year});

  factory From.fromJson(Map<String, dynamic> json) => From(
    day: json["day"] as int?,
    month: json["month"] as int?,
    year: json["year"] as int?,
  );

  Map<String, dynamic> toJson() => {"day": day, "month": month, "year": year};
}

class Broadcast {
  String? day;
  String? time;
  Timezone? timezone;
  String? string;

  Broadcast({this.day, this.time, this.timezone, this.string});

  factory Broadcast.fromJson(Map<String, dynamic> json) => Broadcast(
    day: json["day"],
    time: json["time"],
    timezone: timezoneValues.map[json["timezone"]],
    string: json["string"],
  );

  Map<String, dynamic> toJson() => {
    "day": day,
    "time": time,
    "timezone": timezone != null ? timezoneValues.reverse[timezone] : null,
    "string": string,
  };
}

enum Timezone { ASIA_TOKYO }

final timezoneValues = EnumValues({"Asia/Tokyo": Timezone.ASIA_TOKYO});

class Demographic {
  int malId;
  DemographicType type;
  String name;
  String url;

  Demographic({
    required this.malId,
    required this.type,
    required this.name,
    required this.url,
  });

  factory Demographic.fromJson(Map<String, dynamic> json) => Demographic(
    malId: json["mal_id"],
    type: demographicTypeValues.map[json["type"]] ?? DemographicType.ANIME,
    name: json["name"] ?? '',
    url: json["url"] ?? '',
  );

  Map<String, dynamic> toJson() => {
    "mal_id": malId,
    "type": demographicTypeValues.reverse[type],
    "name": name,
    "url": url,
  };
}

enum DemographicType { ANIME }

final demographicTypeValues = EnumValues({"anime": DemographicType.ANIME});

class AnimeImage {
  String? imageUrl;
  String? smallImageUrl;
  String? mediumImageUrl;
  String? largeImageUrl;
  String? maximumImageUrl;

  AnimeImage({
    this.imageUrl,
    this.smallImageUrl,
    this.mediumImageUrl,
    this.largeImageUrl,
    this.maximumImageUrl,
  });

  factory AnimeImage.fromJson(Map<String, dynamic> json) => AnimeImage(
    imageUrl: json["image_url"],
    smallImageUrl: json["small_image_url"],
    mediumImageUrl: json["medium_image_url"],
    largeImageUrl: json["large_image_url"],
    maximumImageUrl: json["maximum_image_url"],
  );

  Map<String, dynamic> toJson() => {
    "image_url": imageUrl,
    "small_image_url": smallImageUrl,
    "medium_image_url": mediumImageUrl,
    "large_image_url": largeImageUrl,
    "maximum_image_url": maximumImageUrl,
  };
}

enum Rating {
  PG_13_TEENS_13_OR_OLDER,
  PG_CHILDREN,
  R_17_VIOLENCE_PROFANITY,
  R_MILD_NUDITY,
}

final ratingValues = EnumValues({
  "PG-13 - Teens 13 or older": Rating.PG_13_TEENS_13_OR_OLDER,
  "PG - Children": Rating.PG_CHILDREN,
  "R - 17+ (violence & profanity)": Rating.R_17_VIOLENCE_PROFANITY,
  "R+ - Mild Nudity": Rating.R_MILD_NUDITY,
});

enum Season { FALL, SPRING, SUMMER }

final seasonValues = EnumValues({
  "fall": Season.FALL,
  "spring": Season.SPRING,
  "summer": Season.SUMMER,
});

enum Source { LIGHT_NOVEL, MANGA, ORIGINAL }

final sourceValues = EnumValues({
  "Light novel": Source.LIGHT_NOVEL,
  "Manga": Source.MANGA,
  "Original": Source.ORIGINAL,
});

enum Status { CURRENTLY_AIRING, FINISHED_AIRING }

final statusValues = EnumValues({
  "Currently Airing": Status.CURRENTLY_AIRING,
  "Finished Airing": Status.FINISHED_AIRING,
});

class Title {
  TitleType type;
  String title;

  Title({required this.type, required this.title});

  factory Title.fromJson(Map<String, dynamic> json) => Title(
    type: titleTypeValues.map[json["type"]] ?? TitleType.DEFAULT,
    title: json["title"] ?? '',
  );

  Map<String, dynamic> toJson() => {
    "type": titleTypeValues.reverse[type],
    "title": title,
  };
}

enum TitleType { DEFAULT, ENGLISH, FRENCH, GERMAN, JAPANESE, SPANISH, SYNONYM }

final titleTypeValues = EnumValues({
  "Default": TitleType.DEFAULT,
  "English": TitleType.ENGLISH,
  "French": TitleType.FRENCH,
  "German": TitleType.GERMAN,
  "Japanese": TitleType.JAPANESE,
  "Spanish": TitleType.SPANISH,
  "Synonym": TitleType.SYNONYM,
});

class Trailer {
  String? youtubeId;
  String? url;
  String? embedUrl;
  AnimeImage images;

  Trailer({this.youtubeId, this.url, this.embedUrl, required this.images});

  factory Trailer.fromJson(Map<String, dynamic> json) => Trailer(
    youtubeId: json["youtube_id"],
    url: json["url"],
    embedUrl: json["embed_url"],
    images: AnimeImage.fromJson(json["images"]),
  );

  Map<String, dynamic> toJson() => {
    "youtube_id": youtubeId,
    "url": url,
    "embed_url": embedUrl,
    "images": images.toJson(),
  };
}

enum DatumType { MOVIE, TV }

final datumTypeValues = EnumValues({
  "Movie": DatumType.MOVIE,
  "TV": DatumType.TV,
});

class Pagination {
  int lastVisiblePage;
  bool hasNextPage;
  int currentPage;
  Items items;

  Pagination({
    required this.lastVisiblePage,
    required this.hasNextPage,
    required this.currentPage,
    required this.items,
  });

  factory Pagination.fromJson(Map<String, dynamic> json) => Pagination(
    lastVisiblePage: json["last_visible_page"],
    hasNextPage: json["has_next_page"],
    currentPage: json["current_page"],
    items: Items.fromJson(json["items"]),
  );

  Map<String, dynamic> toJson() => {
    "last_visible_page": lastVisiblePage,
    "has_next_page": hasNextPage,
    "current_page": currentPage,
    "items": items.toJson(),
  };
}

class Items {
  int count;
  int total;
  int perPage;

  Items({required this.count, required this.total, required this.perPage});

  factory Items.fromJson(Map<String, dynamic> json) => Items(
    count: json["count"],
    total: json["total"],
    perPage: json["per_page"],
  );

  Map<String, dynamic> toJson() => {
    "count": count,
    "total": total,
    "per_page": perPage,
  };
}

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
