// To parse this JSON data, do
//
//     final stateModel = stateModelFromJson(jsonString);

import 'dart:convert';

StateModel stateModelFromJson(String str) => StateModel.fromJson(json.decode(str));

String stateModelToJson(StateModel data) => json.encode(data.toJson());

class StateModel {
    final List<State>? data;

    StateModel({
        this.data,
    });

    factory StateModel.fromJson(Map<String, dynamic> json) => StateModel(
        data: json["data"] == null ? [] : List<State>.from(json["data"]!.map((x) => State.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
    };
}

class State {
    final String? name;
    final String? iso2;
    final String? fipsCode;
    final String? population;
    final dynamic size;
    final dynamic officialLanguage;
    final dynamic region;
    final Href? href;

    State({
        this.name,
        this.iso2,
        this.fipsCode,
        this.population,
        this.size,
        this.officialLanguage,
        this.region,
        this.href,
    });

    factory State.fromJson(Map<String, dynamic> json) => State(
        name: json["name"],
        iso2: json["iso2"],
        fipsCode: json["fips_code"],
        population: json["population"],
        size: json["size"],
        officialLanguage: json["official_language"],
        region: json["region"],
        href: json["href"] == null ? null : Href.fromJson(json["href"]),
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "iso2": iso2,
        "fips_code": fipsCode,
        "population": population,
        "size": size,
        "official_language": officialLanguage,
        "region": region,
        "href": href?.toJson(),
    };
}

class Href {
    final String? self;
    final String? country;

    Href({
        this.self,
        this.country,
    });

    factory Href.fromJson(Map<String, dynamic> json) => Href(
        self: json["self"],
        country: json["country"],
    );

    Map<String, dynamic> toJson() => {
        "self": self,
        "country": country,
    };
}
