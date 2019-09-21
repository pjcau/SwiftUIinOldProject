//
//  ViewController.swift
//  TestImplementSwiftUI
//
//  Created by Pierre jonny cau on 21/09/2019.
//  Copyright © 2019 Pierre Jonny Cau. All rights reserved.
//

import UIKit
#if canImport(SwiftUI)
import SwiftUI

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.title = "OLD Project"
    }

    @IBAction func callSwiftUI(_ sender: Any) {
        if #available(iOS 13.0.0, *) {
            let swiftUIView = PeopleView()
            let viewCtrl = UIHostingController(rootView: swiftUIView)
            navigationController?.pushViewController(viewCtrl, animated: true)
        } else {
            // Fallback on earlier versions
            noSwitfUI()
        }
         
    }
    
    func noSwitfUI(){
        let alert = UIAlertController(title: "Alert", message: "iOS version is less to iOS13, so yup cannot use SwiftUI", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in
              switch action.style{
               default:
                self.dismiss(animated: true, completion: nil)
            }}))
        present(alert, animated: true, completion: nil)
    }
    
}
#endif

