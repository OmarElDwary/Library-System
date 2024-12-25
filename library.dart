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
      borrowedBooks[book] = user;
      user.borrowedBooks.add(book);
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

  void returnBook(Books book, Users user) {
    book.borrowed = false;
    user.borrowedBooks.remove(book);
  }

  List getBookDetails(Books book) {
    return [book.id, book.title, book.borrowed];
  }

  String checkAvailability(String bookName) {
    for (var book in books) {
      if (book.title == bookName) {
        return book.borrowed ? 'Not available' : 'Available';
      }
    }
    return 'This book isnt in the library';
  }
}

class Books {
  int id;
  String title;
  bool borrowed;
  String? borrowedBy;
  Books(this.id, this.title,
      [this.borrowed = false]); // set the default of borrowed to be false

  @override
  String toString() {
    bool available = borrowed ? false : true;
    return 'Book ID: $id, Book title: $title, Available: $available';
  }
}

class Users {
  int id;
  String name;
  List<Books> borrowedBooks = [];
  Users(this.id, this.name);

  List myBooks() {
    return borrowedBooks;
  }

  @override
  String toString() {
    return 'User Id: $id, Name: $name';
  }
}
