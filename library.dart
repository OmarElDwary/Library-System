class Library {
  List<Books> books = [];
  List<Users> users = [];
  Map<Books, Users> borrowedBooks = {};

  void addBook(String bookName) {
    Books newBook = Books(books.length + 1, bookName);
    books.add(newBook);
  }

  List<Books> displayBooks() {
    return books;
  }

  String borrowBook(Books book, Users user) {
    if (book.borrowed) {
      return 'Book is already borrowed';
    } else {
      book.borrowed = true;
      book.borrowedBy = user.name;
      return 'Book Borrowed succesfully';
    }
  }

  List<Map<String, String>> allBorrowedBooks() {
    return borrowedBooks.entries.map((book) {
      return {
        'Book Name': book.key.title,
        'Borrowed By': book.value.name,
      };
    }).toList();
  }

  void returnBook(Books book) {
    book.borrowed = false;
  }

  List getBookDetails(Books book) {
    return [book.id, book.title, book.borrowed];
  }
}

class Books {
  int id;
  String title;
  bool borrowed;
  String? borrowedBy;
  Books(this.id, this.title,
      [this.borrowed = false]); // set the default of borrowed to be false

  String checkAvailability(String bookName) {
    return borrowed ? 'Not Available' : 'Available';
  }

  @override
  String toString() {
    return 'Book ID: $id, Book title: $title, Available: $borrowed';
  }
}

class Users {
  int id;
  String name;
  Users(this.id, this.name);
}
