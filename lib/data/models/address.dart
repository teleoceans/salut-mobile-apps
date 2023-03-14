class Address {
  final int id;
  final Area area;
  final String streetName;
  final BuildingType buildingType;
  final String buildNumber;
  final String floorNumber;
  final String apartmentNumber;
  final String addressName;
  final String nearbyLandmark;

  const Address({
    required this.id,
    required this.area,
    required this.addressName,
    required this.apartmentNumber,
    required this.buildNumber,
    required this.floorNumber,
    required this.buildingType,
    required this.nearbyLandmark,
    required this.streetName,
  });
}

class Area {
  final int id;
  final String areaName;
  const Area({
    required this.id,
    required this.areaName,
  });
}

class BuildingType {
  final int id;
  final String buildingType;
  const BuildingType({
    required this.buildingType,
    required this.id,
  });
}
