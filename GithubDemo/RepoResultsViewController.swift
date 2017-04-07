//
//  ViewController.swift
//  GithubDemo
//
//  Created by Nhan Nguyen on 5/12/15.
//  Copyright (c) 2015 codepath. All rights reserved.
//

import UIKit
import MBProgressHUD

// Main ViewController
class RepoResultsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var repoCellView: RepoViewCell!
    @IBOutlet weak var repoTableView: UITableView!
    var searchBar: UISearchBar!
    var searchSettings = GithubRepoSearchSettings()

    var repos: [GithubRepo]!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Initialize the UISearchBar
        searchBar = UISearchBar()
        searchBar.delegate = self
        
        repoTableView.dataSource = self
        repoTableView.delegate = self

        // Add SearchBar to the NavigationBar
        searchBar.sizeToFit()
        navigationItem.titleView = searchBar

        // Perform the first search when the view controller first loads
        doSearch()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let repos = repos {
            return repos.count
        }else{
            return 0
        }
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RepoViewCell", for: indexPath) as! RepoViewCell
        let repo = repos[indexPath.row]
        cell.repoNameLabel.text = repo.name
        cell.ownerLabel.text = repo.ownerHandle
        cell.descriptionLabel.text = repo.repoDescription
        let imageUrl = URL(string: repo.ownerAvatarURL!)
        cell.avatarImageView.setImageWith(imageUrl!)
        cell.forksCountLabel.text = String(describing: repo.forks!)
        cell.starsCountLabel.text = String(describing: repo.stars!)
        return cell
    }

    // Perform the search.
    fileprivate func doSearch() {

        MBProgressHUD.showAdded(to: self.view, animated: true)

        // Perform request to GitHub API to get the list of repositories
        GithubRepo.fetchRepos(searchSettings, successCallback: { (newRepos) -> Void in
            
            self.repos = newRepos
            
            MBProgressHUD.hide(for: self.view, animated: true)
            self.repoTableView.reloadData()
            }, error: { (error) -> Void in
                print(error)
        })
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        var indexPath: IndexPath!
        let navigationController = segue.destination as! UINavigationController
        
        let svc = navigationController.topViewController as! SettingsViewController

        
        svc.settings = searchSettings
    }
}

// SearchBar methods
extension RepoResultsViewController: UISearchBarDelegate {

    func searchBarShouldBeginEditing(_ searchBar: UISearchBar) -> Bool {
        searchBar.setShowsCancelButton(true, animated: true)
        return true
    }

    func searchBarShouldEndEditing(_ searchBar: UISearchBar) -> Bool {
        searchBar.setShowsCancelButton(false, animated: true)
        return true
    }

    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.text = ""
        searchBar.resignFirstResponder()
    }

    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchSettings.searchString = searchBar.text
        searchBar.resignFirstResponder()
        doSearch()
    }
}
