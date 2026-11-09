import SwiftUI

struct FactView: View {
    enum Fact: Hashable {
        case loading
        case loaded(String)
    }

    @State var number = 0
    @State var fact: Fact?

    var body: some View {
        VStack {
            Stepper("Number: \(number * 2)", value: $number)
            Button("Get fact") {
                fact = .loading
                Task {
                    let value: String
                    do {
                        value = try await api
                            .getFact(path: .init(number: number))
                            .ok.body.plainText.text()
                    } catch {
                        print("Error: \(error)")
                        fact = nil
                        return
                    }
                    fact = .loaded(value)
                }
            }
            .disabled(fact == .loading)
            // .buttonStyle(.glassProminent)

            switch fact {
            case nil: EmptyView()
            case .loading: ProgressView()
            case .loaded(let text):
                Text(text)
            }
        }
        .onChange(of: number) {
            fact = nil   
        }
        .padding()
        .animation(.default, value: [number, fact] as [AnyHashable])
    }
}

#Preview {
    FactView()
}
