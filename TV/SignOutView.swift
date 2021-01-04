//
//  SignOutView.swift
//  TV
//
//  Created by Sofi on 04.01.2021.
//

import SwiftUI

struct SignOutView: View {
    @Binding var Swift22:Int
    @State var gymViewModel = GymViewModel()
    @Binding var nam:String
    var body: some View {
        Button(action: {
            if nam != ""{
            gymViewModel.signOut(username: "\(nam)")
            nam = ""
                Swift22 = 1
            } else {
                Swift22 = 1
            }
        }, label: {
            Text("Back")
                .font(.custom("d", size: 100))
                .foregroundColor(Color("bu"))
        })
       
    }
}

//struct SignOutView_Previews: PreviewProvider {
//    static var previews: some View {
//        SignOutView()
//    }
//}
