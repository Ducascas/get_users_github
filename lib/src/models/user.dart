class User {
  final String login;
  final int id;
  final String avatarUrl;
  final String followersUrl;
  final String followingUrl;
  int followers;
  int following;

  User({
    required this.login,
    required this.id,
    required this.avatarUrl,
    required this.followersUrl,
    required this.followingUrl,
    this.followers = 0,
    this.following = 0,
  });

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      login: map['login'],
      id: map['id'],
      avatarUrl: map['avatar_url'],
      followersUrl: map['followers_url'],
      followingUrl: map['following_url'],
    );
  }
}
