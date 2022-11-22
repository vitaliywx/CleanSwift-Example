//
//  ArticleDetailsViewController.swift
//  CleanSwift
//
//  Created by Vitalii Homoniuk on 22.11.2022.
//

import UIKit

protocol ArticleDetailsViewLogic: AnyObject  {

}

class ArticleDetailsViewController: UIViewController {
    
    private(set) var router: (ArticleDetailRouterLogic & ArticleDetailDataPassingProtocol)?
    private var interactor: (ArticleDetailBuisnessLogic & ArticleDetailStoreProtocol)?
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var bodyText: UITextView!
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        interactor?.fetchDetails()
        titleLabel.text = interactor?.title
        bodyText.textContainer.lineFragmentPadding = 0
    }
    
    private func setup() {
        let viewController = self
        let interactor = ArticleDetailInteractor()
        let router = ArticleDetailRouter()
        let presenter = ArticlesPresenter()
        router.dataStore = interactor
        viewController.interactor = interactor
        viewController.router = router
    }
    
}

extension ArticleDetailsViewController: ArticleDetailsViewLogic {

}
