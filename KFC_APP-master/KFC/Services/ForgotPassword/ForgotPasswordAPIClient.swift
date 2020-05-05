//
//  ForgotPasswordAPIClient.swift
//  KFC
//
//  Created by Earth on 5/5/2563 BE.
//  Copyright © 2563 Kittinun Chobtham. All rights reserved.
//

import Foundation

protocol ForgotPasswordAPIClient {
    func forgotPassword(optionalEmail:String?,
                        completion:@escaping (_ status:Bool,_ error: Error?) -> ())
}


final class ForgotPasswordAPIClientImplementation:ForgotPasswordAPIClient{
    func forgotPassword(optionalEmail: String?, completion: @escaping (Bool, Error?) -> ()) {
        
      
        
        guard let email = optionalEmail , email.count != 0 else {
            completion(false,GeneralError.EmailNotFound)
            return
        }
        
        let emailFiltered = users.filter { $0.email == email}
        
        guard let haveEmail = emailFiltered.first else {
            completion(false,  GeneralError.EmailNotFound)
            return
        }
        completion(true, nil)

        
    }
}
