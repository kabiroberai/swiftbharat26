import SwiftUI
import Dependencies

struct GreetingsView: View {
    @State private var model = GreetingViewModel()

    var body: some View {
        Form {
            TextField("Enter name…", text: $model.name)

            Button("Greet") {
                model.isAlertPresented = true
            }
            .disabled(model.name.isEmpty)
        }
        .alert(isPresented: $model.isAlertPresented) {
            Alert(
                title: Text(model.greeting),
                dismissButton: .default(Text("Thanks")),
            ) 
        }
    }
}

@Observable final class GreetingViewModel {
    var name = ""
    var isAlertPresented = false

    var greeting: String {
        @Dependency(\.greetingGenerator) var gen
        return gen.generateGreeting(for: name)
    }
}
