//
//  RealmBindable.swift
//  TestImplementSwiftUI
//
//  Created by Pierre jonny cau on 22/09/2019.
//  Copyright © 2019 Pierre Jonny Cau. All rights reserved.
//

import Foundation
import Combine
import SwiftUI
import RealmSwift
import Realm

@available(iOS 13.0.0, *)
class BindableResults<Element>: ObservableObject where Element: RealmSwift.RealmCollectionValue {

    let didChange = PassthroughSubject<Void, Never>()

    let results: Results<Element>
    private var token: NotificationToken!

    init(results: Results<Element>) {
        self.results = results
        lateInit()
    }

    func lateInit() {
        token = results.observe { _ in
            self.didChange.send(())
        }
    }

    deinit {
        token.invalidate()
    }
}
