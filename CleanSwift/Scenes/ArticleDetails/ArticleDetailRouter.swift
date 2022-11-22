//
//  ArticleDetailsRouter.swift
//  CleanSwift
//
//  Created by Vitalii Homoniuk on 22.11.2022.
//

import Foundation

protocol ArticleDetailRouterLogic {
//    func showDetaild(title: String, text: String)
}


protocol ArticleDetailDataPassingProtocol {
    var dataStore: ArticleDetailStoreProtocol? { get }
}


class ArticleDetailRouter: ArticleDetailDataPassingProtocol {
    var dataStore: ArticleDetailStoreProtocol?
}


extension ArticleDetailRouter: ArticleDetailRouterLogic {
    
}
