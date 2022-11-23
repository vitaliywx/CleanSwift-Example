//
//  ViewController.swift
//  CleanSwift
//
//  Created by Vitalii Homoniuk on 22.11.2022.
//

import UIKit

class MainViewController: UIViewController {
    
    //MARK: - Properties
    
    static let id = "MainViewController"
    
    private var router: MainRouterLogic?
    
    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }

    //MARK: - Actions
    
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

