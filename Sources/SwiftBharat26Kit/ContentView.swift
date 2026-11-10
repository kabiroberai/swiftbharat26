import SwiftUI

public struct ContentView: View {
    public init() {}

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
