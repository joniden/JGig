//
//  BandsViewController.swift
//  JGig
//
//  Created by Joacim Nidén on 2020-04-26.
//  Copyright © 2020 Joacim Nidén. All rights reserved.
//

import UIKit

class BandsViewController: UIViewController {
  
  // MARK: - Private vars

  private let searchController  = UISearchController(searchResultsController: nil)
  private var presenter: BandsPresenter?
  private var tableView = UITableView()
  private var unfilteredBandsSection: [BandSectionModel] = []
  private var filteredBandsSection: [BandSectionModel] = []
  
  private var isFiltering = false
  
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
    setupSearchController()
  }
  
  // MARK: - Private methods

  private func setup() {
    tableView.register(BandTableViewCell.self, forCellReuseIdentifier: BandTableViewCell.identifier)
    self.view.addSubview(tableView)
    tableView.delegate = self
    tableView.dataSource = self
    tableView.sizeToParent()
    tableView.rowHeight = 61
  }
  
  private func setupSearchController() {
    self.definesPresentationContext = true
    searchController.searchBar.placeholder = "Search..."
    searchController.isActive = true
    searchController.searchBar.delegate = self
    searchController.delegate = self
    searchController.obscuresBackgroundDuringPresentation = false
    
    self.navigationItem.searchController = searchController
    self.navigationItem.hidesSearchBarWhenScrolling = false
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

extension BandsViewController: UISearchBarDelegate {
  
  func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
    
  }
  
  func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
    isFiltering = searchText.count > 0
    
    if isFiltering {
      filteredBandsSection = bands.search(searchText)
    }
    
    tableView.reloadData()
  }
  
  func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
    isFiltering = false
  }
  
}

extension BandsViewController: UISearchControllerDelegate {
  
}
