//
//  ArticlesPresenter.swift
//  CleanSwift
//
//  Created by Vitalii Homoniuk on 22.11.2022.
//

import Foundation

protocol ArticlesPresenterLogic {
    func present(data: [ArticleServerModel])
}


class ArticlesPresenter {
    weak var viewController: ArticlesViewLogic?
}


extension ArticlesPresenter: ArticlesPresenterLogic {
    func present(data: [ArticleServerModel]) {
        let viewModel = data.map { model -> ArticleCellModel in
            let cellModel = ArticleCellModel(
                articleID: Int(model.articleID) ?? 0,
                titleText: model.name,
                bodyText: model.text)
            return cellModel
        }
        viewController?.display(data: viewModel)
    }
}
