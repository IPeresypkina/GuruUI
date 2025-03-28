//
//  viewsMasteryApp.swift
//  viewsMastery
//
//  Created by Ирина on 09.01.2025.
//

import SwiftUI

@main
struct viewsMasteryApp: App {
    
    let coreDataManager = CoreDataManager.shared
    
    var body: some Scene {
        WindowGroup {
            MainScreenView()
                .onAppear {
//                    coreDataManager.deleteAllCodeExample()
                    coreDataManager.preloadCodeExamplesIfNeeded()
                }
        }
    }
}
