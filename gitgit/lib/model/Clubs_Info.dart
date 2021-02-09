

class clubsInfo {
  int idx;
  String image;
  String name;
  String clubId;
  String address;
  String region;
  String telephone;
  String parkingLot;
  String detail;
  String module;
  int xim;
  int miniplus;
  int fitvisor;
  int bicycle;
  int treadmill;
  String placeType;

  clubsInfo({
    this.idx,
    this.image,
    this.name,
    this.clubId,
    this.address,
    this.region,
    this.telephone,
    this.parkingLot,
    this.detail,
    this.module,
    this.xim,
    this.miniplus,
    this.fitvisor,
    this.bicycle,
    this.treadmill,
    this.placeType});

  factory clubsInfo.fromJson(Map<String, dynamic> json){
    return clubsInfo(
      idx: json['idx'],
      image: json['image'],
      name: json['name'],
      clubId: json['club_id'],
      address: json['address'],
      region: json['region'],
      telephone: json['telephone'],
      parkingLot: json['parkingLot'],
      detail: json['detail'],
      module: json['module'],
      xim: json['xim'],
      miniplus: json['miniplus'],
      fitvisor: json['fitvisor'],
      bicycle: json['bicycle'],
      treadmill: json['treadmill'],
      placeType: json['place_type'],
    );
  }

}
  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = new Map<String, dynamic>();
  //   data['idx'] = this.idx;
  //   data['image'] = this.image;
  //   data['name'] = this.name;
  //   data['club_id'] = this.clubId;
  //   data['address'] = this.address;
  //   data['region'] = this.region;
  //   data['telephone'] = this.telephone;
  //   data['parkingLot'] = this.parkingLot;
  //   data['detail'] = this.detail;
  //   data['module'] = this.module;
  //   data['xim'] = this.xim;
  //   data['miniplus'] = this.miniplus;
  //   data['fitvisor'] = this.fitvisor;
  //   data['bicycle'] = this.bicycle;
  //   data['treadmill'] = this.treadmill;
  //   data['place_type'] = this.placeType;
  //   return data;
  // }
