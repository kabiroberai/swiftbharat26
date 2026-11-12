import SwiftUI
import Dependencies
import DependenciesMacros

protocol GreetingGenerator: Sendable {
    var buttonTitle: String { get }

    func generateGreeting(for name: String) -> String
}

struct GreetingGeneratorV1: GreetingGenerator {
    var buttonTitle: String { "Greet" }

    func generateGreeting(for name: String) -> String {
        "Hello, \(name)!"
    }
}

extension DependencyValues {
    @DependencyEntry(
        liveValue: GreetingGeneratorV1()
    )
    var greetingGenerator: any GreetingGenerator
}
