//
//  ArticleCell.swift
//  CleanSwift
//
//  Created by Vitalii Homoniuk on 22.11.2022.
//

import UIKit

protocol ArticleCellDelegate: AnyObject {
    func didArticleTap(articleID: Int, title: String, text: String)
}


class ArticleCell: UITableViewCell {
    
    //MARK: - Properties
    
    static let cellID = "ArticleCell"
    
    weak var delegate: ArticleCellDelegate?

    private var articleID: Int?
    
    @IBOutlet weak var txtTitle: UILabel!
    @IBOutlet weak var txtBody: UILabel!

    //MARK: - Methods
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    @IBAction func didNextTap(_ sender: Any) {
        guard let articleID = articleID else { return }
        guard let title = txtTitle.text else { return }
        guard let text = txtBody.text else { return }
        delegate?.didArticleTap(articleID: articleID, title: title, text: text)
    }
    
    func setup(data: ArticleCellModel) {
        articleID = data.articleID
        txtTitle.text = data.titleText
        txtBody.text = data.bodyText
    }
}
