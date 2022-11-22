//
//  ArticlesInteractor.swift
//  CleanSwift
//
//  Created by Vitalii Homoniuk on 22.11.2022.
//

import Foundation

protocol ArticlesBuisnessLogic {
    func fetchArticles()
}


class ArticlesInteractor {
    var presenter: ArticlesPresenterLogic?
}


extension ArticlesInteractor: ArticlesBuisnessLogic {
    
    func fetchArticles() {
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) { }
        var backendResponse = [ArticleBackendModel]()
        var model = ArticleBackendModel(
            articleID: "1",
            name: "Lorem ipsum",
            text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum",
            rate: 5,
            symbolCount: 978)

        addNewModel(newElement: &model)
        addNewModel(newElement: &model)
        addNewModel(newElement: &model)
        addNewModel(newElement: &model)
        addNewModel(newElement: &model)
        addNewModel(newElement: &model)
        addNewModel(newElement: &model)
        addNewModel(newElement: &model)
        
        self.presenter?.present(data: backendResponse)
        
        func addNewModel(newElement: inout ArticleBackendModel) {
            backendResponse.append(newElement)
            newElement.articleID = "00\(backendResponse.count + 1)"
        }
    }
}
