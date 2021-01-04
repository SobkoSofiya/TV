//
//  GymViewModel.swift
//  TV
//
//  Created by Sofi on 04.01.2021.
//

import Foundation
import SwiftUI
import SwiftyJSON
import Alamofire


class GymViewModel:ObservableObject{
    @State var gymModel: [GymModel] = []
    @Published var perehod = 1
    
    func signUp(username:String, password:String, email:String) {
        
        let url = "https://gym.areas.su/signup?username=\(username)&email=\(email)&password=\(password)&weight=40&height=170"
        
        AF.request(url, method: .post).validate().responseJSON { [self] response in
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                print("JSON: \(json)")
                self.gymModel.append(GymModel(password: "\(password)", username: "\(username)", email: "\(email)"))
            case .failure(let error):
                print(error)
            }
        }
    }
    func signIn(username:String, password:String) {
        
        let url = "https://gym.areas.su/signin?username =\(username)&password=\(password)"
        
        AF.request(url, method: .post).validate().responseJSON { [self] response in
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                if json["notice"]["token"].stringValue != ""{
                    perehod = 1
                } else if json["notice"]["answer"].stringValue == "User is active"{
                    perehod = 2
                } else if json["notice"]["answer"].stringValue == "Error username or password"{
                    perehod = 3
                }
                print("JSON: \(json)")
                
            case .failure(let error):
                print(error)
            }
        }
    }
    func signOut(username:String) {
        
        let url = "https://gym.areas.su/signout?username=\(username)"
        
        AF.request(url, method: .post).validate().responseJSON { [self] response in
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                print("JSON: \(json)")
            case .failure(let error):
                print(error)
            }
        }
    }
}
