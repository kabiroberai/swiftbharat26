import SwiftUI

struct CalculatorView: View {
    @State private var date = Date.now

    private var month: Int {
        Calendar.current.component(.month, from: date)
    }

    var body: some View {
        Form {
            DatePicker("Selected date", selection: $date, displayedComponents: [.date])
            LabeledContent("Month number", value: "\(month)")
        }
    }
}
