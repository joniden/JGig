//
//  TabBarController.swift
//  JGig
//
//  Created by Joacim Nidén on 2020-04-19.
//  Copyright © 2020 Joacim Nidén. All rights reserved.
//

import UIKit

class TabBarController: UITabBarController {
  
  override func viewDidLoad() {
    super.viewDidLoad()
    let home = HomeViewController()
    home.title = "Last gig"
    addVc(home)
    
    let gigs = GigsViewController()
    gigs.title = "Gigs"
    
    addVc(gigs)
  }
  
  private func addVc(_ vc: UIViewController) {
    self.addChild(UINavigationController(rootViewController: vc))
  }
}
