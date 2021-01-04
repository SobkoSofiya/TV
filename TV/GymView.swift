//
//  GymView.swift
//  TV
//
//  Created by Sofi on 04.01.2021.
//

import SwiftUI

struct GymView: View {
    @Binding var Swift22:Int
    @State var nam:String = ""
    @State var pass:String = ""
    @State var gymViewModel = GymViewModel()
    @State var error:Bool = false
    @State var mess:String = ""

            
            
    var body: some View{
        ZStack{
       Rectangle()
        .foregroundColor(Color("bu"))
        .edgesIgnoringSafeArea(.all)
            Image("st")
                .resizable()
                .frame(width: 467, height: 467, alignment: .center)
                .padding(.bottom,750)
            VStack(spacing:120){
            VStack(spacing:50){
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
            }
                Button(action: {
                    gymViewModel.signIn(username: "\(nam)", password: "\(pass)")
                    if gymViewModel.perehod == 1{
                    mess = "You are logged in to\(nam) account"
                        error.toggle()
                      
                    } else if gymViewModel.perehod == 2{
                        mess = "User is active"
                        error.toggle()
                      
                    } else if gymViewModel.perehod == 3{
                        mess = "Error username or password"
                       
                    }
                    
                }, label: {
                    ZStack{
                       

                    Rectangle()
                     .frame(width: 1127, height: 99, alignment: .center)
                     .cornerRadius(50)
                        Text("Sign In")
                            .foregroundColor(Color("bu"))
                            .font(.custom("ND Astroneer", size: 50))
                    }
                }).alert(isPresented: $error, content: {
                    Alert(title: Text("Error"), message: Text("\(mess)"), dismissButton: .default(Text("Ok"), action: {
                        if mess == "You are logged in to\(nam) account" || mess == "User is active"{
                            Swift22 = 3
                        } else if mess == "Error username or password"{
                            Swift22 = 1
                        }
                    }))
                })
                
                
                
            }
            VStack{
            Button(action: {
                Swift22 = 2
            }, label: {
                Text("Sign Up")
            }).padding(.top, 800)
                
                Button(action: {
                    Swift22 = 3
                }, label: {
                    Text("Skip")
                        .font(.custom("d", size: 15))
                })
            }
        }
    }
}

//struct GymView_Previews: PreviewProvider {
//    static var previews: some View {
//        GymView()
//    }
//}
