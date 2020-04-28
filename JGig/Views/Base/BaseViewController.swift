//
//  BaseViewController.swift
//  JGig
//
//  Created by Joacim Nidén on 2020-04-28.
//  Copyright © 2020 Joacim Nidén. All rights reserved.
//

import UIKit

typealias StringCallback = ((String) -> Void)

class BaseViewController: UIViewController {
  
  // MARK: - Vars
  
  var isFiltering = false
  var searchBarFilter: StringCallback?
  let searchController  = UISearchController(searchResultsController: nil)
  
  let tableView = UITableView()
  
  // MARK: - Life cycle

  override func viewDidLoad() {
    super.viewDidLoad()
    setupSearchController()
  }
  
  func setupTableView<T>(cell: T.Type, rowHeight: CGFloat) where T:BaseTableViewCell {
    
    tableView.register(T.self, forCellReuseIdentifier: T.identifier)
    self.view.addSubview(tableView)

    tableView.sizeToParent()
    tableView.rowHeight = rowHeight
    
  }
  
  func setupSearchController() {
    self.definesPresentationContext = true
    searchController.searchBar.placeholder = "Search..."
    searchController.isActive = true
    searchController.searchBar.delegate = self
    searchController.delegate = self
    searchController.obscuresBackgroundDuringPresentation = false
    
    self.navigationItem.searchController = searchController
    self.navigationItem.hidesSearchBarWhenScrolling = false
  }
  
}

extension BaseViewController: UISearchBarDelegate {
  
  func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
    
  }
  
  func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
    isFiltering = searchText.count > 0
    
    if isFiltering {
      searchBarFilter?(searchText)
    }
    
    tableView.reloadData()
  }
  
  func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
    isFiltering = false
  }
  
}

extension BaseViewController: UISearchControllerDelegate {
  
}
