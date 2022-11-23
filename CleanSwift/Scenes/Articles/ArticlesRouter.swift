//
//  ArticlesRouter.swift
//  CleanSwift
//
//  Created by Vitalii Homoniuk on 22.11.2022.
//

import UIKit

protocol ArticlesRouterLogic: AnyObject {
    func showDetaild(articleID: Int, title: String, text: String)
}


class ArticlesRouter {
    weak var viewController: UIViewController?
}


extension ArticlesRouter: ArticlesRouterLogic {
    func showDetaild(articleID: Int, title: String, text: String) {
        let storyboard = UIStoryboard.init(name: ArticleDetailsViewController.id, bundle: nil)
        guard let vc = storyboard.instantiateViewController(withIdentifier: ArticleDetailsViewController.id) as? ArticleDetailsViewController else { return }
        
        vc.router?.dataStore?.articleID = articleID
        vc.router?.dataStore?.title = title
        vc.router?.dataStore?.text = text
        
        viewController?.navigationController?.pushViewController(vc, animated: true)
    }
}
