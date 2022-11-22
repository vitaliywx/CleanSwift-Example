//
//  ArticleCell.swift
//  CleanSwift
//
//  Created by Vitalii Homoniuk on 22.11.2022.
//

import UIKit

protocol ArticleCellDelegate: AnyObject {
    func didArticleTap(articleID: Int)
}

class ArticleCell: UITableViewCell {
    
    static let cellID = "ArticleCell"
    
    weak var delegate: ArticleCellDelegate?

    private var articleID: Int?
    
    @IBOutlet weak var txtTitle: UILabel!
    @IBOutlet weak var txtBody: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    @IBAction func didNextTap(_ sender: Any) {
        guard let articleID = articleID else { return }
        delegate?.didArticleTap(articleID: articleID)
    }
    
    func setup(data: ArticleCellModel) {
        articleID = data.articleID
        txtTitle.text = data.titleText
        txtBody.text = data.bodyText
    }
}
