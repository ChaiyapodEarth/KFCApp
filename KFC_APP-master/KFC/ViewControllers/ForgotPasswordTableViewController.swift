//
//  ForgotPasswordTableViewController.swift
//  KFC
//
//  Created by Earth on 5/5/2563 BE.
//  Copyright © 2563 Kittinun Chobtham. All rights reserved.
//

import UIKit

class ForgotPasswordTableViewController: UITableViewController {

  
    @IBOutlet weak var emailTextField: UITextField!
    
    var forgotPasswordAPIManager: ForgotPasswordAPIManager?
    
    override func viewDidLoad(){
        super.viewDidLoad()
        
        setupData()
    }
    
    private func setupData(){
        setupForgotPasswordService()
    }
    
    private func setupForgotPasswordService(){
        forgotPasswordAPIManager = ForgotPasswordAPIManagerImplementation()
        forgotPasswordAPIManager?.setDelegate(self)
    }
    
    @IBAction func forgotPasswordButton() {
        forgotPasswordAPIManager?.forgot(optionalEmail: emailTextField.text)
    }
    
    @IBAction func cancelButton(_ sender: Any) {
        dismiss(animated: true,
                       completion: nil)
        
    }
    
}

extension ForgotPasswordTableViewController:ForgotPasswordAPIManagerDelegate{
    func didForgotPasswordCompletion() {
        let alertController = UIAlertController(title: "Success", message: "กรุณาตรวจสอบ Email ของท่าน", preferredStyle: .alert)
        let confirmAction = UIAlertAction(title:"Confirm", style: .default)
        {(_) in
            self.dismiss(animated: true, completion: nil)
        }
        alertController.addAction(confirmAction)
        
        present(alertController, animated: true,completion: nil)
    }
    
    func didForgorPasswordFailure(error: Error) {
        let alertController = UIAlertController(title: "Warning", message: ErrorHelper.errorMessage(genernalError: error as! GeneralError), preferredStyle: .alert)
        
        let confirmAction = UIAlertAction(title: "Confirm", style: .cancel, handler: nil)
        
        alertController.addAction(confirmAction)
        
        present(alertController,animated: true, completion: nil)
        
    }

}
