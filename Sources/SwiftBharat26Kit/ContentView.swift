import SwiftUI
import Dependencies

public struct ContentView: View {
    public init() {
        if FeatureFlags.value(for: "GREETINGS_V2") {
            prepareDependencies { $0.greetingGenerator = GreetingGeneratorV2() }
        }
    }

    public var body: some View {
        RootView()
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
