class Present {
  String? hackName;
  String? town;
  String? dateOfLive;
  String? isOpen;
  String? address;
  String? url;
  String? description;

  Present({
    this.hackName,
    this.description,
    this.address,
    this.dateOfLive,
    this.isOpen,
    this.town,
    this.url,
  });

  Present.fromJson(Map<String, dynamic> json) {
    hackName = json['hackName'];
    description = json['description'];
    address = json['address'];
    dateOfLive = json['dateOfLive'];
    isOpen = json['isOpen'];
    town = json['town'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['hackName'] = hackName;
    data['description'] = description;
    data['address'] = address;
    data['dateOfLive'] = dateOfLive;
    data['isOpen'] = isOpen;
    data['town'] = town;
    data['url'] = url;
    return data;
  }
}
