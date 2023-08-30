//
//  0906-AddDetailViewToSplitView.swift
//  Cookbook
//
//  Created by guojian on 2023/8/30.
//

import SwiftUI

struct Book_0906: Identifiable, Hashable {
  let id = UUID()
  let title: String
  let author: String
}

struct ContentView_0906: View {
  let books = [
    Book_0906(title: "The Hobbit", author: "J.R.R. Tolkien"),
    Book_0906(title: "Pride and Prejudice", author: "Jane Austen"),
    Book_0906(title: "1984", author: "George Orwell")
  ]

  @State private var selectedBook: Book_0906? = nil

  var body: some View {
    NavigationSplitView(columnVisibility: .constant(.doubleColumn)) {
      List(books, selection: $selectedBook) { book in
        NavigationLink(book.title, value: book)
      }
      .navigationTitle("Books")
    } detail: {
      if let selectedBook = selectedBook {
        BookDetail(book: selectedBook)
      } else {
        Text("Select a book from the list to see its details.")
      }
    }
    .navigationSplitViewStyle(.balanced)
  }
}

struct BookDetail: View {
  let book: Book_0906

  var body: some View {
    VStack {
      Text(book.title)
        .font(.largeTitle)
      Text("by \(book.author)")
        .font(.title)
    }
    .navigationTitle(book.title)
  }
}
