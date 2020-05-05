//
//  ForgotPasswordAPIManager.swift
//  KFC
//
//  Created by Earth on 5/5/2563 BE.
//  Copyright © 2563 Kittinun Chobtham. All rights reserved.
//

import Foundation

protocol ForgotPasswordAPIManager {
    func forgot(optionalEmail:String?)
    
    func setDelegate(_ delegate:ForgotPasswordAPIManagerDelegate?)
}

protocol ForgotPasswordAPIManagerDelegate {
    func didForgotPasswordCompletion()
    func didForgorPasswordFailure(error:Error)
}

final class ForgotPasswordAPIManagerImplementation:ForgotPasswordAPIManager{
    
  
    var delegate:ForgotPasswordAPIManagerDelegate?
    
    let apiClient:ForgotPasswordAPIClient
    
    init(apiClient:ForgotPasswordAPIClient = ForgotPasswordAPIClientImplementation()) {
        self.apiClient = apiClient
    }
    
    func setDelegate(_ delegate: ForgotPasswordAPIManagerDelegate?) {
          self.delegate = delegate
      }
      
    
    func forgot(optionalEmail: String?) {
        apiClient.forgotPassword(optionalEmail: optionalEmail){
            (status , optionalEror) in
            if let error = optionalEror{
                self.delegate?.didForgorPasswordFailure(error: error)
                return
            }
            if status{
                self.delegate?.didForgotPasswordCompletion()
                return
            }
        }
    }
}
