class AviaData {
  bool? status;
  Data? data;

  AviaData({
    this.status,
    this.data,
  });

  factory AviaData.fromJson(Map<String, dynamic> json) {
    return AviaData(
      status: json['status'],
      data: json['data'] != null
          ? Data.fromJson(json['data'] as Map<String, dynamic>)
          : null,
    );
  }
}

class Data {
  SearchData? search;
  List<Segment>? segments;
  List<dynamic>? intervalSegments;
  Pagination? pagination;

  Data({
    this.search,
    this.segments,
    this.intervalSegments,
    this.pagination,
  });

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      search:
          json['search'] != null ? SearchData.fromJson(json['search']) : null,
      segments: json['segments'] != null
          ? (json['segments'] as List)
              .map((item) => Segment.fromJson(item))
              .toList()
          : null,
      intervalSegments: json['interval_segments'],
      pagination: json['pagination'] != null
          ? Pagination.fromJson(json['pagination'])
          : null,
    );
  }
}

class SearchData {
  SearchLocation? from;
  SearchLocation? to;
  String date;

  SearchData({
    this.from,
    this.to,
    required this.date,
  });

  factory SearchData.fromJson(Map<String, dynamic> json) {
    return SearchData(
      from: SearchLocation.fromJson(json['from']),
      to: SearchLocation.fromJson(json['to']),
      date: json['date'],
    );
  }
}

class SearchLocation {
  String type;
  String title;
  String shortTitle;
  String popularTitle;
  String code;

  SearchLocation({
    required this.type,
    required this.title,
    required this.shortTitle,
    required this.popularTitle,
    required this.code,
  });

  factory SearchLocation.fromJson(Map<String, dynamic> json) {
    return SearchLocation(
      type: json['type'],
      title: json['title'],
      shortTitle: json['short_title'],
      popularTitle: json['popular_title'],
      code: json['code'],
    );
  }
}

class Segment {
  Thread? thread;
  String? departureTerminal;
  String? arrivalTerminal;
  int? duration;
  String? startDate;
  String? departure;
  String? arrival;
  bool? hasTransfers;
  TicketsInfo? ticketsInfo;
  List<Transfer>? transfers;
  Station? from;
  Station? to;

  Segment({
    this.thread,
    this.departureTerminal,
    this.arrivalTerminal,
    this.duration,
    this.startDate,
    this.departure,
    this.arrival,
    this.hasTransfers,
    this.ticketsInfo,
    this.transfers,
    this.from,
    this.to,
  });

  factory Segment.fromJson(Map<String, dynamic> json) {
    return Segment(
      thread: json['thread'] != null ? Thread.fromJson(json['thread']) : null,
      departureTerminal: json['departure_terminal'],
      arrivalTerminal: json['arrival_terminal'],
      duration: json['duration'],
      startDate: json['start_date'],
      departure: json['departure'],
      arrival: json['arrival'],
      hasTransfers: json['has_transfers'],
      ticketsInfo: json['tickets_info'] != null
          ? TicketsInfo.fromJson(json['tickets_info'])
          : null,
      transfers: json['transfers'] != null
          ? (json['transfers'] as List)
              .map((item) => Transfer.fromJson(item))
              .toList()
          : null,
      from: json['from'] != null ? Station.fromJson(json['from']) : null,
      to: json['to'] != null ? Station.fromJson(json['to']) : null,
    );
  }
}

class Thread {
  String number;
  String title;
  String shortTitle;
  Carrier? carrier;
  String vehicle;
  String transportType;
  TransportSubtype transportSubtype;
  String uid;
  String threadMethodLink;

  Thread({
    required this.number,
    required this.title,
    required this.shortTitle,
    this.carrier,
    required this.vehicle,
    required this.transportType,
    required this.transportSubtype,
    required this.uid,
    required this.threadMethodLink,
  });

  factory Thread.fromJson(Map<String, dynamic> json) {
    return Thread(
      number: json['number'],
      title: json['title'],
      shortTitle: json['short_title'],
      carrier: Carrier.fromJson(json['carrier']),
      vehicle: json['vehicle'],
      transportType: json['transport_type'],
      transportSubtype: TransportSubtype.fromJson(json['transport_subtype']),
      uid: json['uid'],
      threadMethodLink: json['thread_method_link'],
    );
  }
}

class Transfer {
  String type;
  String title;
  String shortTitle;
  String popularTitle;
  String code;

  Transfer({
    required this.type,
    required this.title,
    required this.shortTitle,
    required this.popularTitle,
    required this.code,
  });

  factory Transfer.fromJson(Map<String, dynamic> json) {
    return Transfer(
      type: json['type'],
      title: json['title'],
      shortTitle: json['short_title'],
      popularTitle: json['popular_title'],
      code: json['code'],
    );
  }
}

class Station {
  String type;
  String title;
  String shortTitle;
  String popularTitle;
  String code;
  String stationType;
  String stationTypeName;
  String transportType;

  Station({
    required this.type,
    required this.title,
    required this.shortTitle,
    required this.popularTitle,
    required this.code,
    required this.stationType,
    required this.stationTypeName,
    required this.transportType,
  });

  factory Station.fromJson(Map<String, dynamic> json) {
    return Station(
      type: json['type'],
      title: json['title'],
      shortTitle: json['short_title'],
      popularTitle: json['popular_title'],
      code: json['code'],
      stationType: json['station_type'],
      stationTypeName: json['station_type_name'],
      transportType: json['transport_type'],
    );
  }
}

class Carrier {
  int code;
  String title;
  CarrierCodes? codes;
  String address;
  String url;
  String email;
  String contacts;
  String phone;
  String logo;
  String logoSvg;

  Carrier({
    required this.code,
    required this.title,
    this.codes,
    required this.address,
    required this.url,
    required this.email,
    required this.contacts,
    required this.phone,
    required this.logo,
    required this.logoSvg,
  });

  factory Carrier.fromJson(Map<String, dynamic> json) {
    return Carrier(
      code: json['code'],
      title: json['title'],
      codes: CarrierCodes.fromJson(json['codes']),
      address: json['address'],
      url: json['url'],
      email: json['email'],
      contacts: json['contacts'],
      phone: json['phone'],
      logo: json['logo'],
      logoSvg: json['logo_svg'],
    );
  }
}

class CarrierCodes {
  dynamic sirena;
  String iata;
  String icao;

  CarrierCodes({
    required this.sirena,
    required this.iata,
    required this.icao,
  });

  factory CarrierCodes.fromJson(Map<String, dynamic> json) {
    return CarrierCodes(
      sirena: json['sirena'],
      iata: json['iata'],
      icao: json['icao'],
    );
  }
}

class TransportSubtype {
  String? title;
  String? code;
  String? color;

  TransportSubtype({
    this.title,
    this.code,
    this.color,
  });

  factory TransportSubtype.fromJson(Map<String, dynamic> json) {
    return TransportSubtype(
      title: json['title'],
      code: json['code'],
      color: json['color'],
    );
  }
}

class TicketsInfo {
  bool etMarker;
  List<dynamic> places;

  TicketsInfo({
    required this.etMarker,
    required this.places,
  });

  factory TicketsInfo.fromJson(Map<String, dynamic> json) {
    return TicketsInfo(
      etMarker: json['et_marker'],
      places: List<dynamic>.from(json['places']),
    );
  }
}

class Pagination {
  int total;
  int limit;
  int offset;

  Pagination({
    required this.total,
    required this.limit,
    required this.offset,
  });

  factory Pagination.fromJson(Map<String, dynamic> json) {
    return Pagination(
      total: json['total'],
      limit: json['limit'],
      offset: json['offset'],
    );
  }
}
