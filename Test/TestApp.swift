//
//  TestApp.swift
//  Test
//
//  Created by Anurag Kashyap on 6/17/24.
//

import SwiftUI
import SwiftData

@main
struct TestApp: App {
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }.modelContainer(for: DailyScore.self)
    }
}
