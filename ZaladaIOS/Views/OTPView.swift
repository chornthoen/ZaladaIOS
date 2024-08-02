import SwiftUI

struct OTPView: View {
    enum FocusPin {
        case pinOne, pinTwo, pinThree, pinFour
    }
    
    @FocusState private var pinFocusState: FocusPin?
    @State var pinOne: String = ""
    @State var pinTwo: String = ""
    @State var pinThree: String = ""
    @State var pinFour: String = ""
    
    var body: some View {
        ScrollView {
            VStack {
                Image("OTP")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 150, height: 150)
                    .padding(.top, 1)
                
                Text("Verify your Email Address")
                    .font(.title3)
                    .fontWeight(.semibold)
                
                Text("Enter 4 digit code we'll text you on Email")
                    .font(.caption)
                    .fontWeight(.thin)
                    .padding(.top)
                
                HStack(spacing: 15, content: {
                    TextField("", text: $pinOne)
                        .modifier(OtpModifer(pin: $pinOne))
                        .onChange(of: pinOne) { newVal in
                            if newVal.count == 1 {
                                pinFocusState = .pinTwo
                            } else {
                                if newVal.count == 0 {
                                    hideKeyboard()
                                }
                            }
                        }
                        .focused($pinFocusState, equals: .pinOne)
                    
                    TextField("", text: $pinTwo)
                        .modifier(OtpModifer(pin: $pinTwo))
                        .onChange(of: pinTwo) { newVal in
                            if newVal.count == 1 {
                                pinFocusState = .pinThree
                            } else {
                                if newVal.count == 0 {
                                    pinFocusState = .pinOne
                                }
                            }
                        }
                        .focused($pinFocusState, equals: .pinTwo)
                    
                    TextField("", text: $pinThree)
                        .modifier(OtpModifer(pin: $pinThree))
                        .onChange(of: pinThree) { newVal in
                            if newVal.count == 1 {
                                pinFocusState = .pinFour
                            } else {
                                if newVal.count == 0 {
                                    pinFocusState = .pinTwo
                                }
                            }
                        }
                        .focused($pinFocusState, equals: .pinThree)
                    
                    TextField("", text: $pinFour)
                        .modifier(OtpModifer(pin: $pinFour))
                        .onChange(of: pinFour) { newVal in
                            if newVal.count == 1 {
                                hideKeyboard()
                            } else if newVal.count == 0 {
                                pinFocusState = .pinThree
                            }
                        }
                        .focused($pinFocusState, equals: .pinFour)
                    
                })
                .padding(.vertical)
                
                Button(action: {
                    print("\(pinOne)\(pinTwo)\(pinThree)\(pinFour)");
                }, label: {
                    Spacer()
                    Text("Verify")
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .frame(height: 50)
                        .background(Color.blue)
                        .cornerRadius(8)
                    Spacer()
                })
                .background(Color.blue)
                .cornerRadius(8)
                .padding()
            }
            .navigationBarBackButtonHidden(true)
        }
        .onTapGesture {
            hideKeyboard()
        }
    }
    
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}

#Preview {
    OTPView()
}
