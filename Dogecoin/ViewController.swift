//
//  ViewController.swift
//  Dogecoin
//
//  Created by Edo Lorenza on 09/05/21.
//

import UIKit

class ViewController: UITableViewController {

    //MARK: - Properties
    private let reuseIdentifier = "DogecoinCell"
    
    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
    }
    
    //MARK: - API
    
    
    //MARK: - Helpers
    func configureTableView() {
        tableView.register(DogecoinCell.self, forCellReuseIdentifier: reuseIdentifier)
        tableView.rowHeight = 64
    }
    


}


//MARK: - UITableViewDataSource
extension ViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as! DogecoinCell
        return cell
    }
}

