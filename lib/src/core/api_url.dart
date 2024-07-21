const String baseUrl = 'https://api.github.com/users';
const String searchUrl = 'https://api.github.com/search/users?q=';
const String followersUrl = '/followers';
const String followingUrl = '/following';

 String trimUrl(String url) {
  return url.replaceAll('{/other_user}', '');
}

