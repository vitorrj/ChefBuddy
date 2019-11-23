//
//  logViewController.swift
//  ChefBuddy
//
//  Created by Marco Amorosi on 22/11/2019.
//  Copyright © 2019 Foodies. All rights reserved.
//

import UIKit
import LocalAuthentication

class logViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func login(_ sender: UIButton) {
        self.Authenticate { (success) in
             print(success)
           // let initialViewController = self.storyboard!.instantiateViewControllerWithIdentifier("LoginSignupVC") as! ViewController
           // self.navigationController!.presentViewController(initialViewController, animated: true)
        }
    }
    
    func Authenticate(completion: @escaping ((Bool) -> ())){

        //Create a context
        let authenticationContext = LAContext()
        var error:NSError?

        //Check if device have Biometric sensor
        let isValidSensor : Bool = authenticationContext.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error)

        if isValidSensor {
            //Device have BiometricSensor
            //It Supports TouchID

            authenticationContext.evaluatePolicy(
                .deviceOwnerAuthenticationWithBiometrics,
                localizedReason: "Touch / Face ID authentication",
                reply: { [unowned self] (success, error) -> Void in

                    if(success) {
                        // Touch / Face ID recognized success here
                        completion(true)
                    } else {
                        //If not recognized then
                        if let error = error {
                            let strMessage = self.errorMessage(errorCode: error._code)
                            if strMessage != ""{
                                self.showAlertWithTitle(title: "Error", message: strMessage)
                            }
                        }
                        completion(false)
                    }
            })
        } else {

            let strMessage = self.errorMessage(errorCode: (error?._code)!)
            if strMessage != ""{
                self.showAlertWithTitle(title: "Error", message: strMessage)
            }
        }

    }
    
    //MARK: Show Alert
    func showAlertWithTitle( title:String, message:String ) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)

        let actionOk = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(actionOk)
        self.present(alert, animated: true, completion: nil)
    }

    //MARK: TouchID error
    func errorMessage(errorCode:Int) -> String{

        var strMessage = ""

        switch errorCode {

        case LAError.Code.authenticationFailed.rawValue:
            strMessage = "Authentication Failed"

        case LAError.Code.userCancel.rawValue:
            strMessage = "User Cancel"

        case LAError.Code.systemCancel.rawValue:
            strMessage = "System Cancel"

        case LAError.Code.passcodeNotSet.rawValue:
            strMessage = "Please goto the Settings & Turn On Passcode"

        case LAError.Code.touchIDNotAvailable.rawValue:
            strMessage = "TouchI or FaceID DNot Available"

        case LAError.Code.touchIDNotEnrolled.rawValue:
            strMessage = "TouchID or FaceID Not Enrolled"

        case LAError.Code.touchIDLockout.rawValue:
            strMessage = "TouchID or FaceID Lockout Please goto the Settings & Turn On Passcode"

        case LAError.Code.appCancel.rawValue:
            strMessage = "App Cancel"

        case LAError.Code.invalidContext.rawValue:
            strMessage = "Invalid Context"

        default:
            strMessage = ""

        }
        return strMessage
    }


}
