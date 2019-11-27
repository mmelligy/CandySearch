//
//  ViewController.swift
//  CandySearch
//
//  Created by Mahmoud El-Melligy on 11/25/19.
//  Copyright © 2019 Mahmoud El-Melligy. All rights reserved.
//

import UIKit

class CandyViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    var candies: [Candy] = []
    var filterCandies : [Candy] = []
    var searchBarLisner : String = ""
    var categorySelected = "All"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        candies = [
            Candy(name: "Chocolate Bar", category: "Chocolate"),
            Candy(name: "Chocolate Chip", category: "Chocolate"),
            Candy(name: "Dark Chocolate", category: "Chocolate"),
            Candy(name: "Lillipop", category: "Hard"),
            Candy(name: "Candy Can", category: "Hard"),
            Candy(name: "Jaw Baker", category: "Hard"),
            Candy(name: "Caramel", category: "Other"),
            Candy(name: "Sour Chew", category: "Other"),
            Candy(name: "Gummi Bear", category: "Other")
        ]
        filterCandies = candies
        
    }
    
    @IBAction func segmentButtonPressed(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex{
        case 0:
            categorySelected = "All"
        case 1:
            categorySelected = "Chocolate"
        case 2:
            categorySelected = "Hard"
        case 3:
            categorySelected = "Other"
        default:
            break
        }
        filterManger()
    }
}

extension CandyViewController : UISearchBarDelegate{
    //MARK:- SearchBar Deleget Methods
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        guard !searchText.isEmpty else{
            searchBarLisner = ""
            filterManger()
            return
        }
        searchBarLisner = searchText
        filterManger()
    }
}

//MARK:- Helping Methods methods
extension CandyViewController{
    //filter control function
    func filterManger() {
             if searchBarLisner.isEmpty{
                segmentFilter()
             }else{
                segmentFilter()
                searchBarFilter(filterCandies)
            }
        tableView.reloadData()
    }
    
    //MARK:- segment filter function
    func segmentFilter() {
        if categorySelected == "All" {
            filterCandies = candies
        }else{
            filterCandies = candies.filter({ Candy -> Bool in
                if Candy.category.contains(categorySelected) {
                    return true
                }else{
                    return false
                }
            })
        }
    }
    
    //MARK:- search bar filter function
    func searchBarFilter(_ segmentStates : [Candy]){
        var searchBarfilter = segmentStates
        guard !searchBarLisner.isEmpty else{
            return
        }
        searchBarfilter = filterCandies.filter({ Candy -> Bool in
            Candy.name.contains(searchBarLisner)
        })
        filterCandies = searchBarfilter
    }
}

//MARK:- table view methods
extension CandyViewController : UITableViewDelegate , UITableViewDataSource {
    //MARK: - tableview Datasource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filterCandies.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CandyTableViewCell") as! CandyTableViewCell
        cell.candyNameLabel.text = filterCandies[indexPath.row].name
        cell.candyCategoryLabel.text = filterCandies[indexPath.row].category
        return cell
    }
}
