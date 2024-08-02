//
//  ZaladaIOSApp.swift
//  ZaladaIOS
//
//  Created by Chorn Thoen on 8/2/24.
//

import SwiftUI

@main
struct ZaladaIOSApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
