sealed class SearchAction {}

class GetSearchedBooks extends SearchAction {
  final String query;

  GetSearchedBooks(this.query);
}
