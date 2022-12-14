//
//  SingInInteractor.swift
//  Gover
//
//  Created by engin gülek on 28.08.2022.
//

import Foundation
import Alamofire

class SingInInteractor : PresenterToInteractorSingInProtocol {
    var singInPresenter: InteractorToPresenterSingInProtocol?
    
    func singIn(params:Parameters) {
        print("Interactor")
        AF.request("http://localhost:3000/singIn", method: .post,
                   parameters: params,encoding: JSONEncoding.default).response{ response in
            if let data = response.data {
                do{
                    let result = try JSONDecoder().decode(String.self, from: data)
                    
               
                    self.singInPresenter?.toPresenter(message: result)
                }catch{
                    print(error.localizedDescription)
                }
            }
            
        }
        
    }
    
    
}



