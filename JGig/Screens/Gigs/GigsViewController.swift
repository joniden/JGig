//
//  GigsViewController.swift
//  JGig
//
//  Created by Joacim Nidén on 2020-04-22.
//  Copyright © 2020 Joacim Nidén. All rights reserved.
//

import UIKit

class GigsViewController: BaseViewController {
  
  // MARK: - Private vars

  private var presenter: GigsPresenter?
  
  private var unfilteredGigs: [GigModel] = [] {
    didSet {
      tableView.reloadData()
    }
  }
  
  private var filteredGigs: [GigModel] = []
  private var gigs: [GigModel] {
    return isFiltering ? filteredGigs : unfilteredGigs
  }

  // MARK: - Life cycle

  override func viewDidLoad() {
    super.viewDidLoad()
    setup()
    presenter = GigsPresenter(self)
  }
  
  // MARK: - Private methods
  
  private func setup() {
    setupTableView(cell: GigTableViewCell.self, rowHeight: 112)
    tableView.delegate = self
    tableView.dataSource = self
    
    searchBarFilter = { text in
      self.filteredGigs = self.unfilteredGigs.search(text)
      
    }
  }
  
  // MARK: - Public methods
  
  func populate(_ gigs: [GigModel]) {
    self.unfilteredGigs = gigs
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
