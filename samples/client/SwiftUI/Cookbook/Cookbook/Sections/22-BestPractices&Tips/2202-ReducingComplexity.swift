//
//  2202-ReducingComplexity.swift
//  Cookbook
//
//  Created by guojian on 2023/8/30.
//

import SwiftUI

struct ContentView_2202_01: View {
  @State private var name = ""
  @State private var description = ""
  @State private var inCart = false

  var body: some View {
    VStack(alignment: .leading, spacing: 8) {
      Text("Product Name:")
        .font(.headline)
        .foregroundColor(.primary)
      TextField("Enter product name", text: $name)
        .font(.subheadline)
        .foregroundColor(.secondary)

      Text("Product Description:")
        .font(.headline)
        .foregroundColor(.primary)
      TextField("Enter product description", text: $description)
        .font(.subheadline)
        .foregroundColor(.secondary)

      Button(action: {
        inCart.toggle()
      }) {
        Text(inCart ? "Remove from Cart" : "Add to Cart")
      }
    }
    .padding()
  }
}

// MARK: - Refactored

class ProductViewModel: ObservableObject {
  @Published var name: String = ""
  @Published var description: String = ""
  @Published var inCart: Bool = false

  func toggleCartStatus() {
    inCart.toggle()
  }
}

struct ProductTextFieldView: View {
  @Binding var text: String
  let placeholder: String

  var body: some View {
    TextField(placeholder, text: $text)
      .font(.subheadline)
      .foregroundColor(.secondary)
  }
}

struct ProductButtonView: View {
  @Binding var inCart: Bool
  let action: () -> Void

  var body: some View {
    Button(action: action) {
      Text(inCart ? "Remove from Cart" : "Add to Cart")
    }
  }
}

struct ProductView: View {
  @ObservedObject var product: ProductViewModel

  var body: some View {
    VStack(alignment: .leading, spacing: 8) {
      Text("Product Name:")
        .font(.headline)
        .foregroundColor(.primary)
      ProductTextFieldView(text: $product.name, placeholder: "Enter product name")

      Text("Product Description:")
        .font(.headline)
        .foregroundColor(.primary)
      ProductTextFieldView(text: $product.description, placeholder: "Enter product description")

      ProductButtonView(inCart: $product.inCart, action: product.toggleCartStatus)
    }
    .padding()
  }
}

struct ContentView_2202: View {

  @StateObject var product = ProductViewModel()

  var body: some View {
    ProductView(product: product)
  }
}

