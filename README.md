# SwiftUIinOldProject
Implements SwiftUI inside old Project less iOS13 or with Storyboard. 


This project is created with xCode11 seed 2, without SwiftUI with deployment target 10.0. So it's work without swiftUI until io13 and also the dependency like QGrid.
On a device with iOS13 it shows a View with SwiftUI with a dependency.

At first run it's necessary to update the deployment target of QGrid, pass from iSO13 to iOS10.
You have open the package.swift and change platform: to .iOS(.v13) -> .iOS(.v10).
After this you have rebuild QGrid framework.
