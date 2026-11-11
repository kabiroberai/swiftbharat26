import SwiftUI
import Dependencies
import DependenciesMacros

protocol GreetingGenerator: Sendable {
    func generateGreeting(for name: String) -> String
}

struct GreetingGeneratorV1: GreetingGenerator {
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
