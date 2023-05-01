class Past {
  String? hackName;
  String? town;
  String? dateOfLive;
  String? isOpen;
  String? isOnline;
  String? address;
  String? imageUrl;
  String? description;

  Past({
    this.hackName,
    this.description,
    this.address,
    this.dateOfLive,
    this.isOpen,
    this.isOnline,
    this.town,
    this.imageUrl,
  });

  Past.fromJson(Map<String, dynamic> json) {
    hackName = json['hackName'];
    description = json['description'];
    address = json['address'];
    dateOfLive = json['dateOfLive'];
    isOpen = json['isOpen'];
    isOnline = json['isOnline'];
    town = json['town'];
    imageUrl = json['imageUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['hackName'] = hackName;
    data['description'] = description;
    data['address'] = address;
    data['dateOfLive'] = dateOfLive;
    data['isOpen'] = isOpen;
    data['isOnline'] = isOnline;
    data['town'] = town;
    data['imageUrl'] = imageUrl;
    return data;
  }
}
