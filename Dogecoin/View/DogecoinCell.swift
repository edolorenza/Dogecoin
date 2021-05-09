//
//  Cell.swift
//  Dogecoin
//
//  Created by Edo Lorenza on 09/05/21.
//

import UIKit

class DogecoinCell: UITableViewCell {
    //MARK: - Properties
    
    
    private let imageProperty: UIImageView = {
       let iv = UIImageView()
        iv.contentMode = .scaleToFill
        iv.clipsToBounds = true
        iv.backgroundColor = .lightGray
        iv.image = UIImage(named: "dogecoin")
        return iv
    }()
    
    private let labelProperty: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.text = "Venom"
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
        addSubview(imageProperty)
        imageProperty.setDimensions(height: 48, width: 48)
        imageProperty.layer.cornerRadius = 48 / 2
        imageProperty.centerY(inView: self, leftAnchor: leftAnchor, paddingLeft: 12)
        
        addSubview(labelProperty)
        labelProperty.anchor(top: topAnchor, left: imageProperty.rightAnchor, paddingLeft: 6)
        

    }
    
    //MARK: - Helpers
  
}
