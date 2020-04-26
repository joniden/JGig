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
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    setTabBarIcon(index: 0, image: UIImage(systemName: "music.house"))
    setTabBarIcon(index: 1, image: UIImage(systemName: "music.mic"))
  }
  
  private func addVc(_ vc: UIViewController) {
    self.addChild(UINavigationController(rootViewController: vc))
  }
  
  private func setTabBarIcon(index: Int, image: UIImage?) {
    if let item = self.tabBar.items?[index] {
      item.image = image
    }
  }
}
