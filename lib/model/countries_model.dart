// To parse this JSON data, do
//
//     final countriesModel = countriesModelFromJson(jsonString);

import 'dart:convert';

CountriesModel countriesModelFromJson(String str) => CountriesModel.fromJson(json.decode(str));

String countriesModelToJson(CountriesModel data) => json.encode(data.toJson());

class CountriesModel {
    final List<Datum>? data;
    final Links? links;
    final Meta? meta;

    CountriesModel({
        this.data,
        this.links,
        this.meta,
    });

    factory CountriesModel.fromJson(Map<String, dynamic> json) => CountriesModel(
        data: json["data"] == null ? [] : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
        links: json["links"] == null ? null : Links.fromJson(json["links"]),
        meta: json["meta"] == null ? null : Meta.fromJson(json["meta"]),
    );

    Map<String, dynamic> toJson() => {
        "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
        "links": links?.toJson(),
        "meta": meta?.toJson(),
    };
}

class Datum {
    final String? name;
    final String? fullName;
    final String? capital;
    final String? iso2;
    final String? iso3;
    final Covid19? covid19;
    final CurrentPresident? currentPresident;
    final String? currency;
    final String? phoneCode;
    final Continent? continent;
    final String? description;
    final String? size;
    final DateTime? independenceDate;
    final String? population;
    final DatumHref? href;

    Datum({
        this.name,
        this.fullName,
        this.capital,
        this.iso2,
        this.iso3,
        this.covid19,
        this.currentPresident,
        this.currency,
        this.phoneCode,
        this.continent,
        this.description,
        this.size,
        this.independenceDate,
        this.population,
        this.href,
    });

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        name: json["name"],
        fullName: json["full_name"],
        capital: json["capital"],
        iso2: json["iso2"],
        iso3: json["iso3"],
        covid19: json["covid19"] == null ? null : Covid19.fromJson(json["covid19"]),
        currentPresident: json["current_president"] == null ? null : CurrentPresident.fromJson(json["current_president"]),
        currency: json["currency"],
        phoneCode: json["phone_code"],
        continent: continentValues.map[json["continent"]],
        description: json["description"],
        size: json["size"],
        independenceDate: json["independence_date"] == null ? null : DateTime.parse(json["independence_date"]),
        population: json["population"],
        href: json["href"] == null ? null : DatumHref.fromJson(json["href"]),
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "full_name": fullName,
        "capital": capital,
        "iso2": iso2,
        "iso3": iso3,
        "covid19": covid19?.toJson(),
        "current_president": currentPresident?.toJson(),
        "currency": currency,
        "phone_code": phoneCode,
        "continent": continentValues.reverse[continent],
        "description": description,
        "size": size,
        "independence_date": "${independenceDate!.year.toString().padLeft(4, '0')}-${independenceDate!.month.toString().padLeft(2, '0')}-${independenceDate!.day.toString().padLeft(2, '0')}",
        "population": population,
        "href": href?.toJson(),
    };
}

enum Continent {
    AFRICA,
    ASIA,
    AUSTRALIA,
    CENTRAL_AMERICA,
    EUROPE,
    NORTH_AMERICA,
    OCEANA,
    SOUTH_AMERICA,
    THE_CARIBEAN
}

final continentValues = EnumValues({
    "Africa": Continent.AFRICA,
    "Asia": Continent.ASIA,
    "Australia": Continent.AUSTRALIA,
    "Central America": Continent.CENTRAL_AMERICA,
    "Europe": Continent.EUROPE,
    "North America": Continent.NORTH_AMERICA,
    "Oceana": Continent.OCEANA,
    "South America": Continent.SOUTH_AMERICA,
    "The Caribean": Continent.THE_CARIBEAN
});

class Covid19 {
    final String? totalCase;
    final String? totalDeaths;
    final DateTime? lastUpdated;

    Covid19({
        this.totalCase,
        this.totalDeaths,
        this.lastUpdated,
    });

    factory Covid19.fromJson(Map<String, dynamic> json) => Covid19(
        totalCase: json["total_case"],
        totalDeaths: json["total_deaths"],
        lastUpdated: json["last_updated"] == null ? null : DateTime.parse(json["last_updated"]),
    );

    Map<String, dynamic> toJson() => {
        "total_case": totalCase,
        "total_deaths": totalDeaths,
        "last_updated": lastUpdated?.toIso8601String(),
    };
}

class CurrentPresident {
    final String? name;
    final String? gender;
    final DateTime? appointmentStartDate;
    final dynamic appointmentEndDate;
    final CurrentPresidentHref? href;

    CurrentPresident({
        this.name,
        this.gender,
        this.appointmentStartDate,
        this.appointmentEndDate,
        this.href,
    });

    factory CurrentPresident.fromJson(Map<String, dynamic> json) => CurrentPresident(
        name: json["name"],
        gender: json["gender"],
        appointmentStartDate: json["appointment_start_date"] == null ? null : DateTime.parse(json["appointment_start_date"]),
        appointmentEndDate: json["appointment_end_date"],
        href: json["href"] == null ? null : CurrentPresidentHref.fromJson(json["href"]),
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "gender": gender,
        "appointment_start_date": "${appointmentStartDate!.year.toString().padLeft(4, '0')}-${appointmentStartDate!.month.toString().padLeft(2, '0')}-${appointmentStartDate!.day.toString().padLeft(2, '0')}",
        "appointment_end_date": appointmentEndDate,
        "href": href?.toJson(),
    };
}

class CurrentPresidentHref {
    final String? self;
    final String? country;
    final String? picture;

    CurrentPresidentHref({
        this.self,
        this.country,
        this.picture,
    });

    factory CurrentPresidentHref.fromJson(Map<String, dynamic> json) => CurrentPresidentHref(
        self: json["self"],
        country: json["country"],
        picture: json["picture"],
    );

    Map<String, dynamic> toJson() => {
        "self": self,
        "country": country,
        "picture": picture,
    };
}

class DatumHref {
    final String? self;
    final String? states;
    final String? presidents;
    final String? flag;

    DatumHref({
        this.self,
        this.states,
        this.presidents,
        this.flag,
    });

    factory DatumHref.fromJson(Map<String, dynamic> json) => DatumHref(
        self: json["self"],
        states: json["states"],
        presidents: json["presidents"],
        flag: json["flag"],
    );

    Map<String, dynamic> toJson() => {
        "self": self,
        "states": states,
        "presidents": presidents,
        "flag": flag,
    };
}

class Links {
    final String? first;
    final String? last;
    final dynamic prev;
    final dynamic next;

    Links({
        this.first,
        this.last,
        this.prev,
        this.next,
    });

    factory Links.fromJson(Map<String, dynamic> json) => Links(
        first: json["first"],
        last: json["last"],
        prev: json["prev"],
        next: json["next"],
    );

    Map<String, dynamic> toJson() => {
        "first": first,
        "last": last,
        "prev": prev,
        "next": next,
    };
}

class Meta {
    final int? currentPage;
    final int? from;
    final int? lastPage;
    final String? path;
    final int? perPage;
    final int? to;
    final int? total;

    Meta({
        this.currentPage,
        this.from,
        this.lastPage,
        this.path,
        this.perPage,
        this.to,
        this.total,
    });

    factory Meta.fromJson(Map<String, dynamic> json) => Meta(
        currentPage: json["current_page"],
        from: json["from"],
        lastPage: json["last_page"],
        path: json["path"],
        perPage: json["per_page"],
        to: json["to"],
        total: json["total"],
    );

    Map<String, dynamic> toJson() => {
        "current_page": currentPage,
        "from": from,
        "last_page": lastPage,
        "path": path,
        "per_page": perPage,
        "to": to,
        "total": total,
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
