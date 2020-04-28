//
//  BandsViewController.swift
//  JGig
//
//  Created by Joacim Nidén on 2020-04-26.
//  Copyright © 2020 Joacim Nidén. All rights reserved.
//

import UIKit

class BandsViewController: BaseViewController {
  
  // MARK: - Private vars

  private var presenter: BandsPresenter?
  private var unfilteredBandsSection: [BandSectionModel] = []
  private var filteredBandsSection: [BandSectionModel] = []
  
  private var bands: [BandModel] = [] {
    didSet {
      unfilteredBandsSection = bands.createAlphabeticalSection()
      tableView.reloadData()
    }
  }
  
  private var bandsSection: [BandSectionModel] {
    return isFiltering ? filteredBandsSection : unfilteredBandsSection
  }
  
  // MARK: - Life cycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setup()
    self.presenter = BandsPresenter(self)
  }
  
  // MARK: - Private methods

  private func setup() {
    
    setupTableView(cell: BandTableViewCell.self, rowHeight: 61)
    
    tableView.delegate = self
    tableView.dataSource = self
    
    searchBarFilter = { text in
      self.filteredBandsSection = self.bands.search(text)
    }
  }
  
  // MARK: - Public methods
  
  func populate(_ bands: [BandModel]) {
    self.bands = bands
  }
  
}

// MARK: - Extensions

extension BandsViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: BandTableViewCell.identifier, for: indexPath) as! BandTableViewCell
    cell.populate(bandsSection[indexPath.section].rows[indexPath.row])
    return cell
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return bandsSection[section].rows.count
  }
  
  func sectionIndexTitles(for tableView: UITableView) -> [String]? {
    return bandsSection.map { $0.letter }
  }
  
  func numberOfSections(in tableView: UITableView) -> Int {
    return bandsSection.count
  }
  
  func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
    return bandsSection[section].letter
  }
}

extension BandsViewController: UITableViewDelegate {
  
}
