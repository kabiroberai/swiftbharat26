import SwiftUI

struct GreetingsView: View {
    @State private var model = GreetingViewModel()
    @Environment(\.greetingGenerator) var greetings

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
                title: Text(greetings.generateGreeting(for: model.name)),
                dismissButton: .default(Text("Thanks")),
            ) 
        }
    }
}

@Observable final class GreetingViewModel {
    var name = ""
    var isAlertPresented = false
}
