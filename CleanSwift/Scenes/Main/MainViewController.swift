//
//  ViewController.swift
//  CleanSwift
//
//  Created by Vitalii Homoniuk on 22.11.2022.
//

import UIKit

class MainViewController: UIViewController {
    
    private var router: MainRouterLogic?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }

    @IBAction func showArticlesTap(_ sender: Any) {
        router?.showArticles()
    }
    
    private func setupView() {
        let viewController = self
        let router = MainRouter()
        viewController.router = router
        viewController.title = "Main"
        router.viewController = viewController
    }
}

