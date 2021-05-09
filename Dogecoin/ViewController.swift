//
//  ViewController.swift
//  Dogecoin
//
//  Created by Edo Lorenza on 09/05/21.
//

import UIKit

class ViewController: UIViewController {

    //MARK: - Properties
    private let reuseIdentifier = "DogecoinCell"
    
    private let tableView: UITableView = {
        
        let table = UITableView()
        table.register(DogecoinCell.self, forCellReuseIdentifier: "DogecoinCell")
        return table
    }()

    
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
        fetchData()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
    }
    
    //MARK: - API
    private func fetchData(){
        APICaller.shared.getDogeCoinData { result in
            switch result {
            case .success(let data):
                print("Success: \(data)")
            case .failure(let error):
                print(error)
            }
        }
    }
    
    //MARK: - Helpers
    private func configureTableView() {
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        createTableHeader()
        
    }
    private func createTableHeader() {
        let header = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: view.frame.size.width))
        header.clipsToBounds = true
        
        let imageView = UIImageView(image: UIImage(named: "dogecoin"))
        imageView.contentMode = .scaleAspectFit
        let size: CGFloat = view.frame.size.width/3
        imageView.frame = CGRect(x: (view.frame.width-size)/2, y: 10, width: size, height: size)
        header.addSubview(imageView)
        tableView.tableHeaderView = header
    }
    
}


//MARK: - TableViewDelegate
extension ViewController: UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return 2
   }
    
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as! DogecoinCell
       return cell
   }
}

//MARK: - TableViewDataSource
extension ViewController: UITableViewDataSource{
    
}
