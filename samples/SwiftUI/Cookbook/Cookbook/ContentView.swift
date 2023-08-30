//
//  ContentView.swift
//  Cookbook
//
//  Created by guojian on 2023/8/30.
//

import SwiftUI

struct ContentView: View {
    
    let viewModel = CookbookViewModel()
    
    var body: some View {
        NavigationStack {
            List(viewModel.sections) { section in
                Section {
                    ForEach(section.chapters) { chapter in
                        NavigationLink {
                            AnyView(chapter.targetView)
                        } label: {
                            HStack {
                                Text(chapter.id)
                                    .font(.headline)
                                    .fontWeight(.bold)
                                    .multilineTextAlignment(.center)
                                Text(chapter.title)
                                    .font(.body)
                            }
                        }
                    }
                } header: {
                    HStack {
                        Text(section.id)
                            .fontWeight(.bold)
                        Text(section.title)
                    }
                }
            }
            .navigationTitle("SwiftUI Cookbook")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
