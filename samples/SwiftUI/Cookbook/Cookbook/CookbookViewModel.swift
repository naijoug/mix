//
//  CookbookViewModel.swift
//  Cookbook
//
//  Created by guojian on 2023/8/30.
//

import Foundation
import SwiftUI

struct ContentView_404: View {
    var body: some View {
        Text("404")
            .padding()
    }
}

struct Chapter: Identifiable {
    let id: String
    let targetView: any View
    let title: String
}

struct ChapterSection: Identifiable {
    let id: String
    let title: String
    let chapters: [Chapter]
}

class CookbookViewModel {
    let sections: [ChapterSection] = [
        .init(id: "01", title: "Getting Started with SwiftUI", chapters: [
            .init(id: "0101", targetView: ContentView_0101(), title: "Create & Preview a SwiftUI View"),
            .init(id: "0102", targetView: ContentView_0102(), title: "Understand SwiftUI Views & View Hierarchies"),
            .init(id: "0103", targetView: ContentView_0103(), title: "Use Xcode Previews with SwiftUI")
        ]),
        .init(id: "02", title: "Views & Modifiers in SwiftUI", chapters: []),
        .init(id: "03", title: "Managing User Interface State in SwiftUI", chapters: []),
        .init(id: "04", title: "Text & Fonts in SwiftUI", chapters: []),
        .init(id: "05", title: "Images & Icons in SwiftUI", chapters: []),
        .init(id: "06", title: "Buttons in SwiftUI", chapters: []),
        .init(id: "07", title: "List & Navigation in SwiftUI", chapters: []),
        .init(id: "08", title: "Forms & Controls in SwiftUI", chapters: []),
        .init(id: "09", title: "Tab Views & Split Views in SwiftUI", chapters: [
            .init(id: "0901", targetView: ContentView_0901(), title: "Create a Tab View in SwiftUI"),
            .init(id: "0902", targetView: ContentView_0902(), title: "Customize Tab View Appearance in SwiftUI"),
            .init(id: "0903", targetView: ContentView_0903(), title: "Add Custom Icons to Tab View Items in SwiftUI"),
            .init(id: "0904", targetView: ContentView_0904(), title: "Create a Split View in SwiftUI"),
            .init(id: "0905", targetView: ContentView_0905(), title: "Customize Split View Appearance in SwiftUI"),
            .init(id: "0906", targetView: ContentView_0906(), title: "Add Detail View to Split View in SwiftUI"),
            .init(id: "0907", targetView: ContentView_0907(), title: "Present Modal View from Tab View in SwiftUI"),
            .init(id: "0908", targetView: ContentView_0908(), title: "Switch Tabs Programmatically in SwiftUI"),
            .init(id: "0909", targetView: ContentView_0909(), title: "Hide a Tab View in SwiftUI"),
            .init(id: "0910", targetView: ContentView_0910(), title: "Add a Tab View to Navigation View in SwiftUI")
        ]),
        .init(id: "10", title: "Progress Indicators in SwiftUI", chapters: [
            .init(id: "1001", targetView: ContentView_1001(), title: "Animate a Progress Bar in SwiftUI"),
            .init(id: "1002", targetView: ContentView_1002(), title: "Create a Spinning Activity Indicator in SwiftUI"),
            .init(id: "1003", targetView: ContentView_1003(), title: "Customize the Style of Progress Indicators in SwiftUI"),
            .init(id: "1004", targetView: ContentView_1004(), title: "Create a Circular Progress Bar in SwiftUI"),
            .init(id: "1005", targetView: ContentView_1005(), title: "Implement a Determinate Progress Bar in SwiftUI"),
            .init(id: "1006", targetView: ContentView_1006(), title: "Indicate Indeterminate Progress with SwiftUI"),
            .init(id: "1007", targetView: ContentView_1007(), title: "Add a Progress View to a Navigation Bar in SwiftUI"),
            .init(id: "1008", targetView: ContentView_1008(), title: "Make a Custom Segmented Progress Bar in SwiftUI"),
            .init(id: "1009", targetView: ContentView_1009(), title: "Create a Custom Progress View in SwiftUI")
        ]),
        .init(id: "11", title: "Frames & Layouts in SwiftUI", chapters: []),
        .init(id: "12", title: "Animations & Transitions in SwiftUI", chapters: []),
        .init(id: "13", title: "Gestures & Interactions in SwiftUI", chapters: []),
        .init(id: "14", title: "Text Input in SwiftUI", chapters: []),
        .init(id: "15", title: "Creating Modal Views in SwiftUI", chapters: []),
        .init(id: "16", title: "Adding Audio & Video in SwiftUI", chapters: []),
        .init(id: "17", title: "Building for Multiple Platforms with SwiftUI", chapters: []),
        .init(id: "18", title: "Accessibility in SwiftUI", chapters: []),
        .init(id: "19", title: "Localization & Internationlization in SwiftUI", chapters: []),
        .init(id: "20", title: "Deploying & Debugging SwiftUI Apps", chapters: [
            .init(id: "2001", targetView: ContentView_2001(), title: "Building & Running SwiftUI Apps in Xcode"),
            .init(id: "2002", targetView: ContentView_2002(), title: "Configuring the Deployment Target for SwiftUI Apps"),
            .init(id: "2003", targetView: ContentView_2003(), title: "Configuring App Icons & Launch Screens in SwiftUI"),
            .init(id: "2004", targetView: ContentView_2004(), title: "Managing App Permissions"),
            .init(id: "2005", targetView: ContentView_2005(), title: "Debugging SwiftUI Code with Xcode’s Debugger"),
            .init(id: "2006", targetView: ContentView_2006(), title: "Using the Console to Debug SwiftUI Apps"),
            .init(id: "2007", targetView: ContentView_2007(), title: "Getting Started with SwiftUI Previews"),
            .init(id: "2008", targetView: ContentView_2008(), title: "Customizing SwiftUI Previews"),
            .init(id: "2009", targetView: ContentView_2009(), title: "Finding Memory Leaks Using Instruments"),
            .init(id: "2010", targetView: ContentView_2010(), title: "Understanding & Reducing Startup Time With Instruments")
        ]),
        .init(id: "21", title: "Advanced Topics in SwiftUI", chapters: [
            .init(id: "2101", targetView: ContentView_2101(), title: "Design a Seamless Onboarding Experience in SwiftUI"),
            .init(id: "2102", targetView: ContentView_2102(), title: "Create & Customize Charts in SwiftUI With Swift Charts"),
            .init(id: "2103", targetView: ContentView_2103(), title: "Create Complex UI With SwiftUI Shape & Path"),
            .init(id: "2104", targetView: ContentView_2104(), title: "Integrate SwiftUI With UIKit"),
            .init(id: "2105", targetView: ContentView_2105(), title: "Integrate Core Data With SwiftUI"),
            .init(id: "2106", targetView: ContentView_2106(), title: "Async/Await in SwiftUI"),
            .init(id: "2107", targetView: ContentView_2107(), title: "Using Combine With SwiftUI"),
            .init(id: "2108", targetView: ContentView_2108(), title: "Unit Testing Strategies in SwiftUI"),
            .init(id: "2109", targetView: ContentView_2109(), title: "Testing SwiftUI Views With ViewInspector"),
            .init(id: "2110", targetView: ContentView_2110(), title: "Implement MVVM Architecture in SwiftUI")
        ]),
        .init(id: "22", title: "Best Practices & Tips", chapters: [
            .init(id: "2201", targetView: ContentView_2201(), title: "Improving SwiftUI"),
            .init(id: "2202", targetView: ContentView_2202(), title: "Reducing Complexity in SwiftUI Views"),
            .init(id: "2203", targetView: ContentView_2203(), title: "Separating View Logic with View Models"),
            .init(id: "2204", targetView: ContentView_2204(), title: "Using Environment Variables in SwiftUI"),
            .init(id: "2205", targetView: ContentView_2205(), title: "Optimizing Animations in SwiftUI"),
            .init(id: "2206", targetView: ContentView_2206(), title: "Maintaining State in SwiftUI"),
            .init(id: "2207", targetView: ContentView_2207(), title: "Debugging SwiftUI Views"),
            .init(id: "2208", targetView: ContentView_2208(), title: "Creating Reusable SwiftUI Components"),
            .init(id: "2209", targetView: ContentView_2209(), title: "Using View Composition in SwiftUI")
        ])
    ]
}
