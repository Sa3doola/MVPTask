//
//  ArticleViewController.swift
//  FirstTaskMVP
//
//  Created by Saad Sherif on 9/2/21.
//

import UIKit

final class ArticleViewController: UIViewController {
    
    var configurator = ArticleConfiguratorImplementation()
    
    var presenter: ArticlePresenter?
    
    var articel: Article?
    
    private let dismissButton: UIButton = {
        let butn = UIButton()
        butn.setImage(UIImage(named: "Dismiss"), for: .normal)
        butn.addTarget(self, action: #selector(dismissButton(_:)), for: .touchUpInside)
        return butn
    }()
    
    private let textView: UITextView = {
        let view = UITextView()
        view.font = .systemFont(ofSize: 18, weight: .medium)
        view.textColor = .black
        return view
    }()
    
    init(article: Article) {
        self.articel = article
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - UIViewController Events
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configurator.configure(ArticleViewController: self)
        presenter?.viewDidLoad()
        configureUI()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        dismissButton.anchor(top: view.safeAreaLayoutGuide.topAnchor,
                             leading: nil,
                             bottom: nil,
                             trailing: view.trailingAnchor,
                             padding: .init(top: 5, left: 0, bottom: 0, right: 5),
                             size: .init(width: 50, height: 50))
        textView.anchor(top: dismissButton.topAnchor,
                        leading: view.leadingAnchor,
                        bottom: view.safeAreaLayoutGuide.bottomAnchor,
                        trailing: view.trailingAnchor,
                        padding: .init(top: 50, left: 0, bottom: 0, right: 0))
    }
    
    private func configureUI() {
        view.backgroundColor = .white
        view.addSubview(dismissButton)
        view.addSubview(textView)
        guard let text = articel?.content else { return }
        textView.text = text
    }
    
    @objc private func dismissButton(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
}

extension ArticleViewController: ArticleView {
    func configureText() {
    }
}
