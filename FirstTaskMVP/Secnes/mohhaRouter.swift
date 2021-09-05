//
//  mohhaRouter.swift
//  FirstTaskMVP
//
//  Created by Saad Sherif on 9/5/21.
//

import UIKit


protocol mohhaRouter {
  
}

class mohhaRouterImplementation: mohhaRouter {
    fileprivate weak var mohhaViewController: mohhaViewController?
    
    init(mohhaViewController: mohhaViewController) {
        self.mohhaViewController = mohhaViewController
    }
    
    
}
