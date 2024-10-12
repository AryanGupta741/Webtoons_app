class WebtoonCategory {
  final String title;
  final String thumbnail;
  double rating;

  WebtoonCategory(this.title, this.thumbnail, {this.rating = 3.0});

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'thumbnail': thumbnail,
      'rating': rating,
    };
  }

  static WebtoonCategory fromJson(Map<String, dynamic> json) {
    return WebtoonCategory(
      json['title'],
      json['thumbnail'],
      rating: json['rating'] ?? 3.0,
    );
  }
}
