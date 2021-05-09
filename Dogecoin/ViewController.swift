//
//  ViewController.swift
//  Dogecoin
//
//  Created by Edo Lorenza on 09/05/21.
//

import UIKit

class ViewController: UIViewController {

    //MARK: - Properties
    private var data: DogeCoinData?
    private let reuseIdentifier = "DogecoinCell"
    private let tableView: UITableView = {
        
        let table = UITableView(frame: .zero, style: .grouped)
        table.register(DogecoinCell.self, forCellReuseIdentifier: DogecoinCell.identifier)
        return table
    }()

    private var viewModel = [DogecoinCellViewModel]()
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchData()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
    }
    
    //MARK: - API
    private func fetchData(){
        APICaller.shared.getDogeCoinData { [weak self] result in
            switch result {
            case .success(let data):
                self?.data = data
                DispatchQueue.main.async {
                    self?.setUpViewModels()
                }
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
    
   
    private func setUpViewModels() {
        guard let model = data else { return }
        guard let date = formatter.dateFormatter.date(from: model.date_added) else { return }
        print(date)
        let edo = formatter.prettyDateFormatter.string(from: date)
        print(edo)
        
        viewModel = [
            DogecoinCellViewModel(
                title: "Name",
                value: model.name
            ),
            DogecoinCellViewModel(
                title: "Symbol",
                value: model.symbol
            ),
            DogecoinCellViewModel(
                title: "Identifier",
                value: String(model.id)
            ),
            DogecoinCellViewModel(
                title: "Date Added",
                value: String(model.total_supply)
            ),
            DogecoinCellViewModel(
                title: "Total Suply",
                value: formatter.prettyDateFormatter.string(from: date) ?? "N?A"
            ),
        ]
        configureTableView()
    }
    
    private func createTableHeader() {
        let header = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: view.frame.size.width))
        header.clipsToBounds = true
        //Header Image
        let imageView = UIImageView(image: UIImage(named: "dogecoin"))
        imageView.contentMode = .scaleAspectFit
        let size: CGFloat = view.frame.size.width/3
        imageView.frame = CGRect(x: (view.frame.width-size)/2, y: 10, width: size, height: size)
        header.addSubview(imageView)
        tableView.tableHeaderView = header
        
        //Header price
        guard let price = data?.quote["USD"]?.price else { return }
        let number = NSNumber(value: price)
        let priceCurrency = formatter.currencyFormater.string(from: number)
        let label = UILabel()
        label.text = priceCurrency
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 22, weight: .medium)
        label.frame = CGRect(x: 10, y: 20+size, width: view.frame.width-20, height: 120)
        header.addSubview(label)
    }
    
   
    
}


//MARK: - TableViewDelegate
extension ViewController: UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(viewModel.count)
        return viewModel.count
   }
    
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       guard let cell = tableView.dequeueReusableCell(
                withIdentifier: DogecoinCell.identifier, for: indexPath
       ) as? DogecoinCell else {
        fatalError()
       }
      cell.configure(with: viewModel[indexPath.row])
       return cell
   }
}

//MARK: - TableViewDataSource
extension ViewController: UITableViewDataSource{
    
}
