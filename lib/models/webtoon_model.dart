class WebtoonModel {
  final String title, thumb, id;

//"flutter: {id: 812354, title: 신혼일기, thumb: https://image-comic.pstatic.net/webtoon/812354/thumbnail/thumbnail_IMAG21_f391c11a-9a74-4e0c-b601-2fcebafffd07.jpg}"

  WebtoonModel.fromJson(Map<String, dynamic> json)
      : title = json['title'],
        thumb = json['thumb'],
        id = json['id']; // named constructor 그냥 초기화
}
