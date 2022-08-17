//
//  AlertWrapper.swift
//  social_challenge
//
//  Created by Thiago Henrique on 17/08/22.
//

import Foundation
import UIKit

struct AlertWrapper {
    static let shared = AlertWrapper()
    
    func showAlert(success: Bool = false, message: String, controller: UIViewController) {
          // create the alert
        let alert = UIAlertController(title: "\(success == true ? "Sucesso!" : "Alerta!")", message: message, preferredStyle: UIAlertController.Style.alert)

          // add an action (button)
          alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))

          // show the alert
            controller.present(alert, animated: true, completion: nil)
      }
}
