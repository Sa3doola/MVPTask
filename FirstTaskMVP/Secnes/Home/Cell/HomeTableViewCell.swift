//
//  HomeTableViewCell.swift
//  FirstTaskMVP
//
//  Created by Saad Sherif on 9/2/21.
//

import UIKit
import SDWebImage

class HomeTableViewCell: UITableViewCell, HomeCellView {
    
    static let id = String(describing: HomeTableViewCell.self)
    
    private let authorImage: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        image.image = UIImage(named: "Wegz")
        return image
    }()
    
    private let authorNameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .label
     //   label.text = "Wegz"
        label.font = UIFont.boldSystemFont(ofSize: 22)
        return label
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .label
        //label.text = "hanwsal belsalama w anto blsalama"
        label.font = .systemFont(ofSize: 20, weight: .medium)
        label.numberOfLines = 0
        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        let imageSize = contentView.height - 10
        authorImage.anchor(top: contentView.topAnchor,
                           leading: contentView.leadingAnchor,
                           bottom: contentView.bottomAnchor,
                           trailing: authorNameLabel.leadingAnchor,
                           padding: .init(top: 5, left: 5, bottom: 5, right: 5),
                           size: .init(width: imageSize,
                                       height: imageSize))
        authorNameLabel.anchor(top: contentView.safeAreaLayoutGuide.topAnchor,
                               leading: authorImage.trailingAnchor,
                               bottom: titleLabel.topAnchor,
                               trailing: contentView.trailingAnchor,
                               padding: .init(top: 5, left: 5, bottom: 5, right: 0))
        titleLabel.anchor(top: authorNameLabel.bottomAnchor,
                          leading: authorImage.trailingAnchor,
                          bottom: contentView.bottomAnchor,
                          trailing: contentView.trailingAnchor,
                          padding: .init(top: 5, left: 5, bottom: 5, right: 5))
    }
    
    private func configureUI() {
        contentView.backgroundColor = .systemBackground
        contentView.addSubview(authorImage)
        contentView.addSubview(authorNameLabel)
        contentView.addSubview(titleLabel)
    }
    
    func cellConfigure(model: Article) {
        authorNameLabel.text = model.author
        titleLabel.text = model.title
        authorImage.sd_setImage(with: model.urlToImage, completed: nil)
    }
}

