//
//  ArticleDetailPresente.swift
//  CleanSwift
//
//  Created by Vitalii Homoniuk on 22.11.2022.
//

import Foundation

protocol ArticleDetailPresenterLogic {
    
}

class ArticleDetailPresenter {
    weak var viewController: ArticleDetailsViewLogic?
}

extension ArticleDetailPresenter: ArticleDetailPresenterLogic {

}
