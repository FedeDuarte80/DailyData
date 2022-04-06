import SwiftUI

// Section 1
struct DayDetails: ViewModifier {
    func body(content: Content) -> some View {
        content
            .textFieldStyle(.roundedBorder)
            .frame(width: 65)
            .multilineTextAlignment(.center)
            .submitLabel(.next)
            .textInputAutocapitalization(.characters)
    } }
// Section 2
struct FlightsDetails: ViewModifier {
    func body(content: Content) -> some View {
        content
            .textFieldStyle(.roundedBorder)
            .frame(width: 65)
            .multilineTextAlignment(.center)
            .submitLabel(.next)
            .keyboardType(UIKeyboardType.phonePad)
    } }
// Section 3
struct CrewDetails: ViewModifier {
    func body(content: Content) -> some View {
        content
            .textFieldStyle(.roundedBorder)
            .multilineTextAlignment(.leading)
            .submitLabel(.next)
            .textInputAutocapitalization(.characters)
    } }
struct CrewDetailsDone: ViewModifier {
    func body(content: Content) -> some View {
        content
            .textFieldStyle(.roundedBorder)
            .multilineTextAlignment(.leading)
            .submitLabel(.done)
            .textInputAutocapitalization(.characters)
    }
}
struct Labels: ViewModifier {
    func body(content: Content) -> some View {
        content
            .foregroundColor(Color("label"))
    }
}

// MARK: - TEXTFIELDLIMITMODIFIER

// .limitInputLength(value: $textfield, lenght: limit)

struct TextFieldLimitModifer: ViewModifier {
    @Binding var value: String
    var length: Int
    
    func body(content: Content) -> some View {
        content
            .onReceive(value.publisher.collect()) {
                value = String($0.prefix(length))
            }
    }
}
extension View {
    func limitInputLength(value: Binding<String>, length: Int) -> some View {
        self.modifier(TextFieldLimitModifer(value: value, length: length))
    }
}
