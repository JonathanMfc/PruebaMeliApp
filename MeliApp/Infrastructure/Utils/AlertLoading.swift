//
//  AlertLoading.swift
//  MeliApp
//
//  Created by Jonathan Andres Castillo Baron on 25/11/21.
//

import UIKit

class BaseViewController:UIViewController {
    var loadingView : UIView?

    func showAlert(title:String, message:String, completion: ((UIAlertAction) -> Void)? = nil) {
        navigate(type: .present, module: GeneralRoute.alert(title, message, completion))
    }
    
    func showLoading() {
        let onView = self.view
        let spinnerView = UIView.init(frame: onView!.bounds)
        spinnerView.backgroundColor = UIColor.init(red: 0, green: 0, blue: 0, alpha: 0.8)
        let ai = UIActivityIndicatorView.init(style: .large)
        ai.startAnimating()
        ai.center = spinnerView.center
        
        DispatchQueue.main.async {
            spinnerView.addSubview(ai)
            onView!.addSubview(spinnerView)
        }
        
        loadingView = spinnerView
    }
    
    func removeLoading() {
        DispatchQueue.main.async {
            self.loadingView?.removeFromSuperview()
            self.loadingView = nil
        }
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }

}
