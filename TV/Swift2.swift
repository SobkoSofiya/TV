//
//  Swift2.swift
//  TV
//
//  Created by Sofi on 04.01.2021.
//

import Foundation
import SwiftUI
struct Swift2: View {
    @State var Swift22 = 1
    @State var nam:String = ""
        var body: some View{
            
            if Swift22 == 1 {
                GymView(Swift22: $Swift22)
            } else if Swift22 == 2{
                Sign_Up(Swift22: $Swift22, nam: $nam)
            } else if Swift22 == 3{
                SignOutView(Swift22: $Swift22, nam: $nam)
            }
    }
}
