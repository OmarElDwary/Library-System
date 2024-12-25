import 'library.dart';

void main() {
  Library library = Library();
  Books book1 = Books(library.books.length + 1, 'Learn Flutter', true);
  Users user1 = Users(1234567, 'Omar');
  library.addBook('Dart Programming');

  // display all books
  print(library.displayBooks());

  library.returnBook(book1);
  print(book1.checkAvailability('Dart Programming'));
  print(library.borrowBook(book1, user1));
  print(library.allBorrowedBooks());
  print(book1.checkAvailability('bookName'));
  print(library.getBookDetails(book1));
}
