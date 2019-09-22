//
//  ContentView.swift
//  testSwiftUI
//
//  Created by Pierre jonny cau on 19/09/2019.
//  Copyright © 2019 Pierre Jonny Cau. All rights reserved.
//

import SwiftUI
import QGrid
import Realm
import RealmSwift
import Combine

var columns: Int {
    
    switch UIDevice.current.userInterfaceIdiom {
    case .phone:
        // It's an iPhone
        return  3
    case .pad:
        // It's an iPad
        return 5
    default:
        return  3
    }
}

var columnsInLandscape: Int {
    
    switch UIDevice.current.userInterfaceIdiom {
    case .phone:
        // It's an iPhone
        return  5
    case .pad:
        // It's an iPad
        return 7
    default:
        return  5
    }
    
}

@available(iOS 13.0.0, *)
struct PeopleView : View {
    @ObservedObject var people = BindableResults(results: try! Realm().objects(Person.self))
    
    private var stateContent: AnyView {
        _ = Storage()
        
        switch people.results.isEmpty {
        case true:
             return AnyView(
                           Text("loading")
                       )
        default:
            return AnyView(
                QGrid(people.results, columns: columns, columnsInLandscape: columnsInLandscape) { GridCell(person: $0) }.edgesIgnoringSafeArea(.bottom)
                
            )
        }
        
    }
    
    var body: some View {
        stateContent
    }
}

@available(iOS 13.0.0, *)
struct GridCell: View {
    var person: Person
    
    var body: some View {
        
        VStack() {
            Image(person.imageName)
                .resizable()
                .scaledToFit()
                .clipShape(Circle())
                .shadow(color: .primary, radius: 10)
                .padding([.top, .leading, .trailing], 7)
            Text(person.firstName).font(.headline).foregroundColor(Color.white).lineLimit(1)
            Text(person.lastName).font(.headline).foregroundColor(Color.white).lineLimit(1)
        }
        .background(Color.red)
        .cornerRadius(30)
    }
}

@available(iOS 13.0.0, *)
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        PeopleView()
    }
}
