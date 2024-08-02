//
//  OTPModifer.swift
//  ZaladaIOS
//
//  Created by Chorn Thoen on 8/2/24.
//

import Combine
import SwiftUI

struct OtpModifer: ViewModifier {
    @Binding var pin: String
    
    var textLimt = 1
    
    func limitText(_ upper: Int) {
        if pin.count > upper {
            pin = String(pin.prefix(upper))
        }
    }
    

    func body(content: Content) -> some View {
        content
            .multilineTextAlignment(.center)
            .keyboardType(.numberPad)
            .onReceive(Just(pin)) { _ in limitText(textLimt) }
            .frame(width: 45, height: 45)
            .background(Color(.systemGray6))
            .background(
                RoundedRectangle(cornerRadius: 8)
                    .strokeBorder(Color(.systemGray6), lineWidth: 1)
            )
            .cornerRadius(8)
    }
}
