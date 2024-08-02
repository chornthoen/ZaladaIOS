//
//  ForgetPassword.swift
//  ZaladaIOS
//
//  Created by Chorn Thoen on 8/2/24.
//

import SwiftUI

struct ForgetPasswordView: View {
    @State private var email = ""
    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    Image("OTP")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 150, height: 150)
                        .padding(.top, 30)
                    
                    Text("Forget password?")
                        .font(.title)
                        .padding(.top, 10)
                    
                    Text("Please enter your email address.")
                        .font(.subheadline)
                    
                    VStack(spacing: 20) {
                        TextField("Email", text: $email)
                            .padding(12)
                            .background(Color(.systemGray6))
                            .cornerRadius(8)
                            .keyboardType(.emailAddress)
                        
                        NavigationLink(destination: OTPView()) {
                            Text("Send OTP")
                                .foregroundColor(.white)
                                .frame(maxWidth: .infinity)
                                .frame(height: 50)
                                .background(Color.blue)
                                .cornerRadius(8)
                        }
                    }
                    .padding(.horizontal, 20)
                }
            }
            .onTapGesture {
                hideKeyboard()
            }
        }
    }
    
    private func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}

#Preview {
    ForgetPasswordView()
}
