//
//  ArticleDetailsInteractor.swift
//  CleanSwift
//
//  Created by Vitalii Homoniuk on 22.11.2022.
//

import Foundation

protocol ArticleDetailBuisnessLogic {
    func fetchDetails()
}

protocol ArticleDetailStoreProtocol: AnyObject {
    var articleID: Int { get set }
    var title: String { get set }
    
}

class ArticleDetailInteractor: ArticleDetailStoreProtocol {
    
    weak var viewController: ArticleDetailsViewController?
    var articleID: Int = -1
    var title: String = "Hola, amigo"
    
}

extension ArticleDetailInteractor: ArticleDetailBuisnessLogic {
    func fetchDetails() {
        print("articleID \(articleID)")
    }
    
}
