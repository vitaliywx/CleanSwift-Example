//
//  ArticlesViewController.swift
//  CleanSwift
//
//  Created by Vitalii Homoniuk on 22.11.2022.
//

import UIKit

protocol ArticlesViewLogic: AnyObject  {
    func display(data: [ArticleCellModel])
}

class ArticlesViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    private(set) var router: ArticlesRouterLogic?
    
    private var interactor: ArticlesBuisnessLogic?
    private var dataToDisplay = [ArticleCellModel]()
    
//    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
//        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
//        setup()
//    }
//
//    required init?(coder: NSCoder) {
//        super.init(coder: coder)
//        setup()
//    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
        configureTableView()
        interactor?.fetchArticles()
    }
    
    private func setup() {
        let viewController = self
        let presenter = ArticlesPresenter()
        let interactor = ArticlesInteractor()
        let router = ArticlesRouter()
        interactor.presenter = presenter
        presenter.viewController = viewController
        viewController.interactor = interactor
        viewController.router = router
        viewController.title = "Recent"
        router.viewController = viewController
    }
    
    private func configureTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.tableFooterView = UIView(frame: .zero)
        tableView.register(UINib(nibName: "ArticleCell", bundle: nil), forCellReuseIdentifier: ArticleCell.cellID)
    }
}

extension ArticlesViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataToDisplay.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ArticleCell.cellID, for: indexPath) as? ArticleCell else { return UITableViewCell() }
        cell.setup(data: dataToDisplay[indexPath.row])
        cell.delegate = self
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

extension ArticlesViewController: ArticleCellDelegate {
    func didArticleTap(articleID: Int) {
        router?.showDetaild(articleID: articleID)
    }
}

extension ArticlesViewController: ArticlesViewLogic {
    func display(data: [ArticleCellModel]) {
        dataToDisplay.removeAll()
        dataToDisplay.append(contentsOf: data)
        tableView.reloadData()
    }
}

