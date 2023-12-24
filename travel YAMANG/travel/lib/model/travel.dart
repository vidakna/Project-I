class Travel {
  String name;
  String location;
  String url;

  Travel(this.name, this.location, this.url);

  static List<Travel> generateTravelBlog() {
    return [
      Travel('Place 1', 'Place 1', 'img/1.jpeg'),
      Travel('Place 2', 'Place 2', 'img/2.jpeg'),
      Travel('Place 3', 'Place 3', 'img/3.jpeg'),
      Travel('Place 4', 'Place 4', 'img/4.jpeg'),
    ];
  }

  static List<Travel> generateMostPopular() {
    return [
      Travel('Place 5', 'Place 5', 'img/4.jpeg'),
      Travel('Place 6', 'Place 6', 'img/1.jpeg'),
      Travel('Place 7', 'Place 7', 'img/2.jpeg'),
      Travel('Place 8', 'Place 8', 'img/5.jpeg'),
      Travel('Place 8', 'Place 8', 'img/3.jpeg'),
      Travel('Place 8', 'Place 8', 'img/1.jpeg'),
      Travel('Place 8', 'Place 8', 'img/5.jpeg'),
    ];
  }
}
