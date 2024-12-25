import 'library.dart';

void main() {
  Library library = Library();
  Users user1 = Users(1234567, 'Omar');
  Users user2 = Users(1234568, 'Ali');
  library.addBook('Dart Programming');
  library.addBook('Learn Flutter');
  Books book1 = Books(library.books.length + 1, 'Programming with Dart');
  // ensure that book1 is added to the library
  library.addBook(book1.title);
  // display all books
  print(library.displayBooks());

  // check if the book is available
  print(library.checkAvailability('Dart Programming'));
  // test the borrowing and make user borrow a book and another user try to borrow after him
  print(library.borrowBook(book1, user1));
  print(library.borrowBook(book1, user2));
  // test the return of the book
  library.returnBook(book1, user1);
  print(library.borrowBook(book1, user2));
  library.returnBook(book1, user1);
  // see all borrowed books
  print(library.allBorrowedBooks());
  print(library.checkAvailability('Dart Programming'));
  // test a none existing book
  print(library.checkAvailability('C Programming'));
  print(library.getBookDetails(book1));
  // check for the books i borrowed.
  library.borrowBook(book1, user1);
  print(user1.myBooks());
}
