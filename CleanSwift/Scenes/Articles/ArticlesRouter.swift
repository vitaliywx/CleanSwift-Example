//
//  ArticlesRouter.swift
//  CleanSwift
//
//  Created by Vitalii Homoniuk on 22.11.2022.
//

import UIKit

protocol ArticlesRouterLogic: AnyObject {
    func showDetaild(articleID: Int)
}

class ArticlesRouter {
    weak var viewController: UIViewController?
}

extension ArticlesRouter: ArticlesRouterLogic {
    func showDetaild(articleID: Int) {
        let storyboard = UIStoryboard.init(name: "ArticleDetailsViewController", bundle: nil)
        guard let vc = storyboard.instantiateViewController(withIdentifier: "ArticleDetailsViewController") as? ArticleDetailsViewController else { return }
        
        vc.router?.dataStore?.articleID = articleID
        
        viewController?.navigationController?.pushViewController(vc, animated: true)
    }
}
