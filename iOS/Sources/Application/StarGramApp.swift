import SwiftUI

@main
struct StarGramApp: App {
    var body: some Scene {
        WindowGroup {
            AppDependency.resolve().launchScreenView
        }
    }
}
