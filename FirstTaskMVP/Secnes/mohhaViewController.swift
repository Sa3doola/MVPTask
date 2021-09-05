//
//  mohhaViewController.swift
//  FirstTaskMVP
//
//  Created by Saad Sherif on 9/5/21.
//

import UIKit

final class mohhaViewController: UIViewController {
    
    var configurator = mohhaConfiguratorImplementation()
    
    var presenter: mohhaPresenter?
    
    // MARK: - UIViewController Events
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configurator.configure(mohhaViewController: self)
        presenter?.viewDidLoad()
    }
    
}



extension mohhaViewController: mohhaView {}
