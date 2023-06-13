class Movie {
  int id;
  String imageUrl;
  String name;
  String description;
  String creator;
  String genre;
  int rating;
  String linkUrl;

  Movie(
      {this.id,
      this.imageUrl,
      this.name,
      this.description,
      this.creator,
      this.genre,
      this.rating,
      this.linkUrl});

  Movie.fromJson(json) {
    id = json['id'];
    imageUrl = json['image_url'];
    name = json['name'];
    description = json['description'];
    creator = json['creator'];
    genre = json['genre'];
    rating = json['rating'];
    linkUrl = json['link_url'];
  }
}
