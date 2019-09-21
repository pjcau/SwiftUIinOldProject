//
//  SwiftUIView.swift
//  TestImplementSwiftUI
//
//  Created by Pierre jonny cau on 21/09/2019.
//  Copyright © 2019 Pierre Jonny Cau. All rights reserved.
//

import SwiftUI

@available(iOS 13.0.0, *)
struct SwiftUIView: View {
    @available(iOS 13.0.0, *)
    
    @Environment(\.presentationMode) var presentation

    var body: some View {
       Group {
          Text("Modal view")
          Button(action: { self.presentation.wrappedValue.dismiss() }) { Text("Dismiss") }

        }
    }
}

@available(iOS 13.0.0, *)
struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIView()
    }
}
