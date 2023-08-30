//
//  2105-IntegrateCoreData.swift
//  Cookbook
//
//  Created by guojian on 2023/8/30.
//

import SwiftUI
import CoreData

class PersistenceController: ObservableObject {
  let container = NSPersistentContainer(name: "Book")

  static let shared = PersistenceController()

  private init() {
    container.loadPersistentStores { description, error in
      if let error = error {
        print("Core Data failed to load: \(error.localizedDescription)")
      }
    }
  }
}

struct ContentView_2105_01: View {
  @Environment(\.managedObjectContext) var moc
  @FetchRequest(entity: Book.entity(), sortDescriptors: [NSSortDescriptor(keyPath: \Book.title, ascending: true)]) var books: FetchedResults<Book>
  @State private var isAlertModalPresented = false
  @State private var bookTitleInput = ""
  @State private var bookAuthorInput = ""

  var body: some View {
    NavigationStack {
      List {
        ForEach(books, id: \.self) { book in
          VStack(alignment: .leading, spacing: 8) {
            Text(book.title ?? "Unknown Title")
              .font(.headline)
            Text(book.author ?? "Unknown Author")
              .font(.subheadline)
          }
        }
        .onDelete(perform: deleteBook)
      }
      .navigationTitle("Bookshelf")
      .toolbar {
        ToolbarItem(placement: .navigationBarTrailing) {
          Button(action: { isAlertModalPresented.toggle() }) {
            Image(systemName: "plus")
          }
        }
      }
      .alert("Add a Book", isPresented: $isAlertModalPresented) {
        TextField("Book Title", text: $bookTitleInput)
        TextField("Book Author", text: $bookAuthorInput)
        Button("OK", action: addBook)
        Button("Cancel", role: .cancel, action: cleanupInputs)
      }
    }
  }

  func addBook() {
    let newBook = Book(context: self.moc)
    newBook.title = bookTitleInput
    newBook.author = bookAuthorInput

    do {
      try self.moc.save()
    } catch {
      print(error.localizedDescription)
    }

    cleanupInputs()
  }

  func deleteBook(at offsets: IndexSet) {
    for index in offsets {
      let book = books[index]
      moc.delete(book)
    }

    do {
      try moc.save()
    } catch {
      print(error.localizedDescription)
    }
  }

  private func cleanupInputs() {
    bookTitleInput = ""
    bookAuthorInput = ""
  }
}

struct ContentView_2105_Previews: PreviewProvider {
  static let persistenceController = PersistenceController.shared

  static var previews: some View {
    ContentView_2105()
      .environment(\.managedObjectContext, persistenceController.container.viewContext)
  }
}

struct ContentView_2105: View {
    
    var body: some View {
        ContentView_2105()
          .environment(\.managedObjectContext, PersistenceController.shared.container.viewContext)
    }
}
