import SwiftBharat26Kit
import SnapshottingTestsCore
import SwiftUI

@main struct SwiftBharat26App: App {
    var body: some Scene {
        WindowGroup {
            if ProcessInfo.processInfo.environment["SNAPSHOTS_EXPORT_DIR"] == nil {
                ContentView()
            } else {
                SnapshotTestsView()
            }
        }
    }
}
