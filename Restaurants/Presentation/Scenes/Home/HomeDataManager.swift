//
//  HomeDataManager.swift
//  Restaurants
//
//  Created by Jordan Capa on 7/25/19.
//  Copyright © 2019 Jordan Capa. All rights reserved.
//

import Foundation
import SVProgressHUD
import Alamofire
import AlamofireObjectMapper
import ObjectMapper

class HomeDataManager: HomeDataManagerProtocol {
    

    internal var interactor: HomeInteractorProtocol!
    
    func getToken() {
        //Codable
        print("getToken")
        
        let headers = [
            "content-type": "application/x-www-form-urlencoded"
        ]
        SVProgressHUD.show()
        Connection.sharedInstance.request(Routes.getToken.getURL(), method: .get, parameters: nil, encoding: JSONEncoding.default, headers:headers).responseDecodable { (response: DataResponse<SessionResponse>) in
            SVProgressHUD.dismiss()
            debugPrint(self.convertToJson(aData: response.data!))
            
            if response.result.isSuccess {
                guard let token = response.result.value?.token else{
                    return
                }
                self.interactor.successToken(token: token)
            }
            else{
                self.interactor.showError(code: Errors.anyone)
            }
        }
    }
    
    func getRestaurants() {
        //ObjectMapper
        
        let headers = [
            "Content-Type": "application/json",
            "Authorization": AuthManager.sharedInstance.getToken()
        ]
        SVProgressHUD.show()
        Connection.sharedInstance.request(Routes.getRestaurants.getURL(), method: .get, parameters: nil, encoding: JSONEncoding.default, headers:headers).responseObject { (response: DataResponse<RestaurantsResponse>) in
            SVProgressHUD.dismiss()
            debugPrint(self.convertToJson(aData: response.data!))
            
            switch response.result {
                
            case .success(_):
                
                guard let restaurants = response.result.value?.data else{
                    guard let codeError = response.result.value?.code else{
                        self.interactor.showError(code: Errors.anyone)
                        return
                    }
                    self.interactor.showError(code: codeError)
                    return
                }
                self.interactor.showRestaurants(restaurant: restaurants)
                print("success")
                
            case .failure( _):
                self.interactor.showError(code: Errors.anyone)
                print("failure")
            }
            
        }
        
    }
    
    
    public func convertToJson(aData:Data) -> Any{
        
        do{
            let jsonResponse = try JSONSerialization.jsonObject(with:
                aData, options: [])
            return jsonResponse
        } catch let parsingError {
            return parsingError
        }
    }
}
