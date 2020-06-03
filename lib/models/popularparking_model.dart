class PopularPark {
  String parkname;
  String city;
  String imageUrl;

  PopularPark({this.parkname, this.imageUrl, this.city});
}

List<PopularPark> popularpark = [
  PopularPark(
      city: 'Lahore',
      imageUrl: 'lib/assets/images/l.jpg'),

      PopularPark(
      city: 'Islamabad',
      imageUrl: 'lib/assets/images/i.jpg'),

  PopularPark(
      city: 'Karachi',
      imageUrl: 'lib/assets/images/k.jpg'),

  PopularPark(
      parkname: 'A Fresh Edge To Evryday',
      city: 'Peshawer',
      imageUrl: 'lib/assets/images/pes.png'),

  PopularPark(
      parkname: 'Up to 50% Off',
      city: 'Quetta',
      imageUrl: 'lib/assets/images/q.jpg')
];