// To parse this JSON data, do
//
//     final searchModel = searchModelFromJson(jsonString);

import 'dart:convert';

List<SearchModel> searchModelFromJson(String str) => List<SearchModel>.from(json.decode(str).map((x) => SearchModel.fromJson(x)));

String searchModelToJson(List<SearchModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class SearchModel {
  SearchModel({
    required this.data,
    required this.links,
    required this.meta,
    required this.status,
    required this.message,
  });

  List<Datum> data;
  Links links;
  Meta meta;
  String status;
  String message;

  factory SearchModel.fromJson(Map<String, dynamic> json) => SearchModel(
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    links: Links.fromJson(json["links"]),
    meta: Meta.fromJson(json["meta"]),
    status: json["status"],
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
    "links": links.toJson(),
    "meta": meta.toJson(),
    "status": status,
    "message": message,
  };
}

class Datum {
  Datum({
    required this.id,
    required this.name,
    required this.desc,
    required this.quantity,
    required this.productDetails,
  });

  int id;
  String name;
  String desc;
  int quantity;
  List<ProductDetail> productDetails;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    name: json["name"],
    desc: json["desc"],
    quantity: json["quantity"],
    productDetails: List<ProductDetail>.from(json["product_details"].map((x) => ProductDetail.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "desc": desc,
    "quantity": quantity,
    "product_details": List<dynamic>.from(productDetails.map((x) => x.toJson())),
  };
}

class ProductDetail {
  ProductDetail({
    required this.id,
    required this.price,
    required this.currency,
    required this.color,
    required this.images,
    required this.isFav,
    required this.quantity,
    this.haveSale,
  });

  int id;
  int price;
  Currency currency;
  Color color;
  List<Image> images;
  bool isFav;
  int quantity;
  HaveSale? haveSale;

  factory ProductDetail.fromJson(Map<String, dynamic> json) => ProductDetail(
    id: json["id"],
    price: json["price"],
    currency: currencyValues.map[json["currency"]]!,
    color: Color.fromJson(json["color"]),
    images: List<Image>.from(json["images"].map((x) => Image.fromJson(x))),
    isFav: json["is_fav"],
    quantity: json["quantity"],
    haveSale: json["have_sale"] == null ? null : HaveSale.fromJson(json["have_sale"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "price": price,
    "currency": currencyValues.reverse[currency],
    "color": color.toJson(),
    "images": List<dynamic>.from(images.map((x) => x.toJson())),
    "is_fav": isFav,
    "quantity": quantity,
    "have_sale": haveSale?.toJson(),
  };
}

class Color {
  Color({
    required this.id,
    required this.name,
    required this.hex,
    required this.image,
  });

  int id;
  String name;
  String hex;
  String image;

  factory Color.fromJson(Map<String, dynamic> json) => Color(
    id: json["id"],
    name: json["name"],
    hex: json["hex"],
    image: json["image"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "hex": hex,
    "image": image,
  };
}

enum Currency { EGP }

final currencyValues = EnumValues({
  "EGP": Currency.EGP
});

class HaveSale {
  HaveSale({
    required this.key,
    required this.keyId,
    required this.typeOfOffer,
    required this.typeOfProduct,
    required this.discountType,
    required this.percentage,
    required this.priceAfter,
    this.sold,
    required this.isReminder,
    required this.endAt,
    required this.endAtForWeb,
    this.isValid,
  });

  Key key;
  int keyId;
  TypeOfOffer typeOfOffer;
  TypeOfProduct typeOfProduct;
  DiscountType discountType;
  double percentage;
  int priceAfter;
  dynamic sold;
  bool isReminder;
  DateTime endAt;
  DateTime endAtForWeb;
  dynamic isValid;

  factory HaveSale.fromJson(Map<String, dynamic> json) => HaveSale(
    key: keyValues.map[json["key"]]!,
    keyId: json["key_id"],
    typeOfOffer: typeOfOfferValues.map[json["typeOfOffer"]]!,
    typeOfProduct: typeOfProductValues.map[json["typeOfProduct"]]!,
    discountType: discountTypeValues.map[json["discount_type"]]!,
    percentage: json["percentage"]?.toDouble(),
    priceAfter: json["price_after"],
    sold: json["sold"],
    isReminder: json["is_reminder"],
    endAt: DateTime.parse(json["end_at"]),
    endAtForWeb: DateTime.parse(json["end_at_for_web"]),
    isValid: json["is_valid"],
  );

  Map<String, dynamic> toJson() => {
    "key": keyValues.reverse[key],
    "key_id": keyId,
    "typeOfOffer": typeOfOfferValues.reverse[typeOfOffer],
    "typeOfProduct": typeOfProductValues.reverse[typeOfProduct],
    "discount_type": discountTypeValues.reverse[discountType],
    "percentage": percentage,
    "price_after": priceAfter,
    "sold": sold,
    "is_reminder": isReminder,
    "end_at": endAt.toIso8601String(),
    "end_at_for_web": endAtForWeb.toIso8601String(),
    "is_valid": isValid,
  };
}

enum DiscountType { VALUE }

final discountTypeValues = EnumValues({
  "value": DiscountType.VALUE
});

enum Key { OFFER }

final keyValues = EnumValues({
  "offer": Key.OFFER
});

enum TypeOfOffer { FIX_AMOUNT }

final typeOfOfferValues = EnumValues({
  "fix_amount": TypeOfOffer.FIX_AMOUNT
});

enum TypeOfProduct { FIX_AMOUNT_OR_PERCENTAGE }

final typeOfProductValues = EnumValues({
  "fixAmountOrPercentage": TypeOfProduct.FIX_AMOUNT_OR_PERCENTAGE
});

class Image {
  Image({
    required this.id,
    required this.image,
    required this.url,
  });

  int id;
  String image;
  String url;

  factory Image.fromJson(Map<String, dynamic> json) => Image(
    id: json["id"],
    image: json["image"],
    url: json["url"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "image": image,
    "url": url,
  };
}

class Links {
  Links({
    required this.first,
    required this.last,
    this.prev,
    required this.next,
  });

  String first;
  String last;
  dynamic prev;
  String next;

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
  Meta({
    required this.currentPage,
    required this.from,
    required this.lastPage,
    required this.links,
    required this.path,
    required this.perPage,
    required this.to,
    required this.total,
  });

  int currentPage;
  int from;
  int lastPage;
  List<Link> links;
  String path;
  int perPage;
  int to;
  int total;

  factory Meta.fromJson(Map<String, dynamic> json) => Meta(
    currentPage: json["current_page"],
    from: json["from"],
    lastPage: json["last_page"],
    links: List<Link>.from(json["links"].map((x) => Link.fromJson(x))),
    path: json["path"],
    perPage: json["per_page"],
    to: json["to"],
    total: json["total"],
  );

  Map<String, dynamic> toJson() => {
    "current_page": currentPage,
    "from": from,
    "last_page": lastPage,
    "links": List<dynamic>.from(links.map((x) => x.toJson())),
    "path": path,
    "per_page": perPage,
    "to": to,
    "total": total,
  };
}

class Link {
  Link({
    this.url,
    required this.label,
    required this.active,
  });

  String? url;
  String label;
  bool active;

  factory Link.fromJson(Map<String, dynamic> json) => Link(
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

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
