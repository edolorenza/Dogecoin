//
//  Cell.swift
//  Dogecoin
//
//  Created by Edo Lorenza on 09/05/21.
//

import UIKit

struct DogecoinCellViewModel {
    let title: String
    let value: String
}

class DogecoinCell: UITableViewCell {
    
    //MARK: - Properties
    static let identifier = "DogecoinCell"
    
    private let label: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 15)
        label.text = "label"
        return label
    }()
    
    private let valueLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15)
        label.text = "value label"
        label.textAlignment = .right
        return label
    }()
    

    //MARK: - Lifecycle
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView() {
    
        addSubview(label)
        label.sizeToFit()
        label.anchor(top: topAnchor, left: leftAnchor, paddingTop: 6, paddingLeft: 16)
        
        addSubview(valueLabel)
        valueLabel.sizeToFit()
        valueLabel.anchor(top: topAnchor, right: rightAnchor, paddingTop: 6, paddingRight: 16)
        
    }
    
    //MARK: - Helpers
    func configure(with viewModel: DogecoinCellViewModel){
        label.text = viewModel.title
        valueLabel.text = viewModel.value
    }
}
