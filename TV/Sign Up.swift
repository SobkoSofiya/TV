//
//  Sign Up.swift
//  TV
//
//  Created by Sofi on 04.01.2021.
//

import SwiftUI

struct Sign_Up: View {
    @Binding var Swift22:Int
    @Binding var nam:String
    @State var pass:String = ""
    @State var email:String = ""
    @State var rePass:String = ""
    @State var gymViewModel = GymViewModel()
    @State var error:Bool = false
    @State var mess:String = ""
    var body: some View {
        
       
            ZStack{
           Rectangle()
            .foregroundColor(Color("bu"))
            .edgesIgnoringSafeArea(.all)
                Image("st")
                    .resizable()
                    .frame(width: 467, height: 467, alignment: .center)
                    .padding(.bottom,750)
                VStack(spacing:50){
                VStack(spacing:30){
                    ZStack{
                   Rectangle()
                    .frame(width: 1127, height: 85, alignment: .center)
                    .cornerRadius(50)
                        HStack(spacing:0){
                            Image("pf")
                                .resizable()
                                .frame(width: 30, height: 30, alignment: .center)
                                .padding(.leading,70)
                                .padding(.trailing,70)
                            Rectangle()
                                .frame(width: 1, height: 84.5, alignment: .center)
                                .foregroundColor(.gray)
                            TextField("Ivanov", text: $nam)
                                .foregroundColor(.gray)
                                .frame(width: 930, height: 85, alignment: .center)
                                .font(.custom("ND Astroneer", size: 40))
                        }
                    }
                    ZStack{
                   Rectangle()
                    .frame(width: 1127, height: 85, alignment: .center)
                    .cornerRadius(50)
                        HStack(spacing:0){
                            Image("o")
                                .resizable()
                                .frame(width: 30, height: 25, alignment: .center)
                                .padding(.leading,70)
                                .padding(.trailing,70)
                            Rectangle()
                                .frame(width: 1, height: 84.5, alignment: .center)
                                .foregroundColor(.gray)
                            TextField("Ivanov@mail.ru", text: $email)
                                .foregroundColor(.gray)
                                .frame(width: 930, height: 85, alignment: .center)
                                .font(.custom("ND Astroneer", size: 40))
                        }
                    }

                    ZStack{
                   Rectangle()
                    .frame(width: 1127, height: 85, alignment: .center)
                    .cornerRadius(50)
                        HStack(spacing:0){
                            Image("xtk")
                                .resizable()
                                .frame(width: 25.8, height: 30.3, alignment: .center)
                                .padding(.leading,75)
                                .padding(.trailing,75)
                            Rectangle()
                                .frame(width: 1, height: 84.5, alignment: .center)
                                .foregroundColor(.gray)
                            TextField("●●●●●●", text: $pass)
                                .font(.custom("ND Astroneer", size: 20))
                                .foregroundColor(.gray)
                                .frame(width: 930, height: 85, alignment: .center)
                        }
                    }

                    ZStack{
                   Rectangle()
                    .frame(width: 1127, height: 85, alignment: .center)
                    .cornerRadius(50)
                        HStack(spacing:0){
                            Image("xtk")
                                .resizable()
                                .frame(width: 25.8, height: 30.3, alignment: .center)
                                .padding(.leading,75)
                                .padding(.trailing,75)
                            Rectangle()
                                .frame(width: 1, height: 84.5, alignment: .center)
                                .foregroundColor(.gray)
                            TextField("●●●●●●", text: $rePass)
                                .font(.custom("ND Astroneer", size: 20))
                                .foregroundColor(.gray)
                                .frame(width: 930, height: 85, alignment: .center)
                        }
                    }
                }
                    Button(action: {
                        if nam != "" && email != "" && pass != "" && rePass != ""{
                            if email.contains("@"){
                                if pass == rePass{
                        gymViewModel.signUp(username: "\(nam)", password: "\(pass)", email: "\(email)")
                                    Swift22 = 1
                                } else {
                                    mess = "Passwords do not match"
                                    error.toggle()
                                }
                            } else {
                                mess = "Incorrect email"
                                error.toggle()
                            }
                        } else {
                            mess = "Enter all fields"
                            error.toggle()
                        }
                    }, label: {
                        ZStack{
                           

                        Rectangle()
                         .frame(width: 1127, height: 99, alignment: .center)
                         .cornerRadius(50)
                            Text("Sign Up")
                                .foregroundColor(Color("bu"))
                                .font(.custom("ND Astroneer", size: 50))
                        }
                    }).alert(isPresented: $error, content: {
                        Alert(title: Text("Error"), message: Text("\(mess)"), dismissButton: .default(Text("Ok")))
                    })
                    Button(action: {
                        Swift22 = 1
                    }, label: {
                        Text("Back")
                            .frame(width: 90, height: 20, alignment: .center)
                            .font(.custom("la", size: 20))
                    })
                }.padding(.top,300)
                
               
            }
        }
    }


//struct Sign_Up_Previews: PreviewProvider {
//    static var previews: some View {
//        Sign_Up()
//    }
//}
