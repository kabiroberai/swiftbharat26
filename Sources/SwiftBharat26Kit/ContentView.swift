import SwiftUI
import SnapshottingTestsCore

public struct ContentView: View {
    public init() {}

    public var body: some View {
        if ProcessInfo.processInfo.environment["SNAPSHOTS_EXPORT_DIR"] == nil {
            RootView()
        } else {
            SnapshotTestsView()
        }
    }
}

struct RootView: View {
    var body: some View {
        TabView {
            Tab("Facts", systemImage: "questionmark.circle.fill") {
                FactView()
            }

            Tab("Greetings", systemImage: "hand.wave.fill") {
                GreetingsView()
            }
        }
    }
}
