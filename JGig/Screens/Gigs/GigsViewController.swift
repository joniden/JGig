//
//  GigsViewController.swift
//  JGig
//
//  Created by Joacim Nidén on 2020-04-22.
//  Copyright © 2020 Joacim Nidén. All rights reserved.
//

import UIKit

class GigsViewController: UIViewController {
  
  var gigs: [GigModel] = [] {
    didSet {
      tableView.reloadData()
    }
  }
  
  var presenter: GigsPresenter?
  var tableView = UITableView()

  override func viewDidLoad() {
    super.viewDidLoad()
    setup()
    presenter = GigsPresenter(self)
  }
  
  private func setup() {
    tableView.register(GigTableViewCell.self, forCellReuseIdentifier: GigTableViewCell.identifier)
    self.view.addSubview(tableView)
    tableView.delegate = self
    tableView.dataSource = self
    tableView.sizeToParent()
    tableView.rowHeight = 112
    
  }
  
  func populate(_ gigs: [GigModel]) {
    self.gigs = gigs
  }
    
}

extension GigsViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: GigTableViewCell.identifier, for: indexPath) as! GigTableViewCell
    cell.populate(gigs[indexPath.row])
    return cell
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return gigs.count
  }
}

extension GigsViewController: UITableViewDelegate {
  
}
