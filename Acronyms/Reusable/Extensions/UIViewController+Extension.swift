//
//  UIViewController+Extension.swift
//  Acronyms
//
//  Created by Jose Luis Tovar Jimenez on 27/03/21.
//

import UIKit
import ObjectiveC

var hideNavigationBarObjectKey: UInt8 = 1

extension UIViewController {
    @IBInspectable var hideNavigationBar: Bool {
        get {
            let value = objc_getAssociatedObject(self, &hideNavigationBarObjectKey) as? String ?? "false"
            return value == "true"
        }
        set {
            objc_setAssociatedObject(self, &hideNavigationBarObjectKey, newValue ? "true" : "false", objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
    
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    func newInstanceOfView(nextPage: String, parametershowView: String? = nil) -> UIViewController? {
        if let vcFromCatalog = ViewControllerCatalog(name: nextPage),
           let vc = vcFromCatalog.createInstance() {            
            return vc
        }
        return nil
    }
}
