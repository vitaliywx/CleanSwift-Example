//
//  MainRouter.swift
//  CleanSwift
//
//  Created by Vitalii Homoniuk on 22.11.2022.
//

import UIKit

protocol MainRouterLogic: AnyObject {
    func showArticles()
}

class MainRouter {
    weak var viewController: MainViewController?
}

extension MainRouter: MainRouterLogic {
    func showArticles() {
        let storyboard = UIStoryboard.init(name: "ArticlesViewController", bundle: nil)
        let vc = storyboard.instantiateViewController(
            withIdentifier: "ArticlesViewController") as? ArticlesViewController ?? UIViewController()
        viewController?.navigationController?.pushViewController(vc, animated: true)
    }
}
