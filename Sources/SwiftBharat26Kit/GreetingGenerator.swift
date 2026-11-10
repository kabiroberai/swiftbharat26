import SwiftUI

protocol GreetingGenerator {
    func generateGreeting(for name: String) -> String
}

struct GreetingGeneratorV1: GreetingGenerator {
    func generateGreeting(for name: String) -> String {
        "Hello, \(name)!"
    }
}

extension GreetingGenerator where Self == GreetingGeneratorV1 {
    static var v1: Self { Self() }
}

extension EnvironmentValues {
    @Entry var greetingGenerator: any GreetingGenerator
        = .v1
}
