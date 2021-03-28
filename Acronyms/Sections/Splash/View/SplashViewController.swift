//
//  SplashViewController.swift
//  Acronyms
//
//  Created by Jose Luis Tovar Jimenez on 27/03/21.
//

import UIKit


class SplashViewController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet weak var progressView: CircularView!
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        progressView.startIndeterminate()
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.15) {
            self.goToSearchView()
        }
    }
    

    func goToSearchView() {
        guard let loginVC = ViewControllerCatalog.LoginNavigation.createInstance() else { return }
        loginVC.modalPresentationStyle = .fullScreen
        present(loginVC, animated: true, completion: nil)
    }

}
