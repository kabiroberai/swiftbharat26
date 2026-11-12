import SwiftUI
import Dependencies

struct GreetingsView: View {
    @State private var model = GreetingViewModel()

    var body: some View {
        Form {
            TextField("Enter name…", text: $model.name)

            Button(model.greetButtonTitle) {
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

    @ObservationIgnored
    @Dependency(\.greetingGenerator) var gen

    var greetButtonTitle: String {
        gen.buttonTitle
    }

    var greeting: String {
        return gen.generateGreeting(for: name)
    }
}
