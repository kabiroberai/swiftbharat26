import Foundation

enum FeatureFlags {
    /// In a real app you'd use a feature flag SDK like LaunchDarkly
    static func value(for name: String) -> Bool {
        ProcessInfo.processInfo.environment[name] == "1"
    }
}
