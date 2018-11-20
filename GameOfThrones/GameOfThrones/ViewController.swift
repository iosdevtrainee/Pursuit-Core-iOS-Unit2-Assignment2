//
//  ViewController.swift
//  GameOfThrones
//
//  Created by J on 11/16/18.
//  Copyright © 2018 Pursuit. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  @IBOutlet weak private var tableView: UITableView!
  @IBOutlet weak var searchBar: UISearchBar!
  private var gotEpisodes = [[GOTEpisode]]() {
    didSet {
      tableView.reloadData()
    }
  }
  private func setupProtocols() {
    // Do any additional setup after loading the view, typically from a nib.
    
    self.tableView.delegate = self
    self.tableView.dataSource = self
    self.searchBar.delegate = self
  }
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    guard let detailVC = segue.destination as? DetailViewController, let cell = sender as? GOTCell else { return }
    guard let indexPath = tableView.indexPathForSelectedRow else { return }
    let episode = gotEpisodes[indexPath.section][indexPath.row]
    detailVC.gotEpisodeName = episode.name
    detailVC.gotImageName = episode.mediumImageID
    detailVC.gotAirDate = episode.airdate
    detailVC.gotSummary = episode.summary
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupProtocols()
    fetchEpisodes()
  }

  private func setupRefresh(){
    let refresh = UIRefreshControl()
    tableView.refreshControl = refresh
    refresh.addTarget(self, action: #selector(fetchEpisodes), for: .valueChanged)
  }
  @objc private func fetchEpisodes(){
    gotEpisodes = GOTEpisode.getEpisodes(array: GOTEpisode.allEpisodes)
  }
}

extension ViewController : UITableViewDelegate {
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 250
  }
}

extension ViewController : UITableViewDataSource {
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let identifier = indexPath.section % 2 == 0 ? "GOTCellRight" : "GOTCellLeft"
    let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as! GOTCell
    let episode = gotEpisodes[indexPath.section][indexPath.row]
    cell.gotNameLabel?.text = episode.name
    cell.gotAirDateLabel?.text = episode.airdate
    cell.summary = episode.summary
    cell.gotImage?.image = UIImage(named: episode.mediumImageID)
    return cell
  }
  
  func numberOfSections(in tableView: UITableView) -> Int {
    return gotEpisodes.count
  }
  func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
    return "Season \((gotEpisodes[section].first?.season)!)"
  }
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return gotEpisodes[section].count
  } 
}

extension ViewController : UISearchBarDelegate {
  func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
    guard let searchText = searchBar.text?.lowercased() else { return }
    gotEpisodes = [GOTEpisode.allEpisodes.filter{$0.name.contains(searchText)}]
  }
}
