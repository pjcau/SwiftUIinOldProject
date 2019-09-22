//
//  Storage.swift
//  QGrid
//
//  Created by Karol Kulesza on 7/06/19.
//  Copyright © 2019 Q Mobile { http://Q-Mobile.IT }
//

import SwiftUI
import Realm
import RealmSwift
import Foundation
import Combine

enum LoadableState<T> {
    case loading
    case fetched(Result<T, FetchError>)
}

enum FetchError: Error {
    case error(String)
    
    var localizedDescription: String {
        switch self {
        case .error(let message):
            return message
        }
    }
}

class Person : Object, Decodable, Identifiable {
    @objc dynamic var id: Int = 0
    @objc dynamic var firstName: String = ""
    @objc dynamic var lastName: String = ""
    @objc dynamic var imageName: String = ""
}

@available(iOS 13.0.0, *)
struct Storage {
    
    init() {
        Storage.insertOrUpdate(news: Storage.people)
    }
    
    static var people: [Person] = load("people.json")
    
    static func load<T: Decodable>(_ file: String) -> T {
        guard let url = Bundle.main.url(forResource: file, withExtension: nil),
            let data = try? Data(contentsOf: url),
            let typedData = try? JSONDecoder().decode(T.self, from: data) else {
                fatalError("Error while loading data from file: \(file)")
        }
        return typedData;
    }
    
    static func insertOrUpdate(news: [Person]) {
        let realm = try! Realm()
        
        do {
             try realm.write({
                realm.add(news)
            })
        } catch {
            print("Exception")
        }
    }
     
}
