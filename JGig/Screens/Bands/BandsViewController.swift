//
//  BandsViewController.swift
//  JGig
//
//  Created by Joacim Nidén on 2020-04-26.
//  Copyright © 2020 Joacim Nidén. All rights reserved.
//

import UIKit

class BandsViewController: UIViewController {
  
  var bands: [BandModel] = [] {
    didSet {
      bandsSection = bands.createAlphabeticalSection().sorted(by: { $0.letter.lowercased() < $1.letter.lowercased() })
      tableView.reloadData()
    }
  }
  
  private var bandsSection: [BandSectionModel] = []
  
  var presenter: BandsPresenter?
  var tableView = UITableView()

  override func viewDidLoad() {
    super.viewDidLoad()
    setup()
    self.presenter = BandsPresenter(self)
  }
  
  func populate(_ bands: [BandModel]) {
    self.bands = bands
  }
  
  private func setup() {
    tableView.register(BandTableViewCell.self, forCellReuseIdentifier: BandTableViewCell.identifier)
    self.view.addSubview(tableView)
    tableView.delegate = self
    tableView.dataSource = self
    tableView.sizeToParent()
    tableView.rowHeight = 61
  }
    
}

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
