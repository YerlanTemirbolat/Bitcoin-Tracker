//
//  CryptoTableViewCell.swift
//  Bitcoin Tracker
//
//  Created by Admin on 5/13/21.
//

import UIKit

class CryptoTableViewCellViewModel {
    let name: String    //  ==    // name
    let symbol: String  //  ==    // id_icon
    let price: String   //  ==    // price_usd need to convert with Formatter
    let iconUrl: URL?
    var iconData: Data?
    
    init(
        name: String,
        symbol: String,
        price: String,
        iconUrl: URL?
    ) {
        self.name = name
        self.symbol = symbol
        self.price = price
        self.iconUrl = iconUrl
    }
}

class CryptoTableViewCell: UITableViewCell {

   static let identifier = "CryptoTableViewCell"
    
    // Subviews
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 24, weight: .medium)
        return label
    }()
    
    private let symbolLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 20, weight: .regular)
        return label
    }()
    
    private let priceLabel: UILabel = {
        let label = UILabel()
        label.textColor = .systemGreen
        label.textAlignment = .right
        label.font = .systemFont(ofSize: 22, weight: .semibold)
        return label
    }()
    
    private let iconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    // Init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(nameLabel)
        contentView.addSubview(symbolLabel)
        contentView.addSubview(priceLabel)
        contentView.addSubview(iconImageView)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // Layout
    override func layoutSubviews() {
        super.layoutSubviews()
        
        nameLabel.sizeToFit()
        symbolLabel.sizeToFit()
        priceLabel.sizeToFit()
        
        nameLabel.frame = CGRect(x: 30 + contentView.frame.size.height / 1.1,
                                 y: 0,
                                 width: contentView.frame.size.width/2,
                                 height: contentView.frame.size.height/2)
        
        symbolLabel.frame = CGRect(x: 30 + contentView.frame.size.height / 1.1,
                                   y: contentView.frame.size.height/2,
                                   width: contentView.frame.size.width/2,
                                   height: contentView.frame.size.height/2)
        
        priceLabel.frame = CGRect(x: contentView.frame.size.width/2,
                                  y: 0,
                                  width: (contentView.frame.size.width/2) - 15,
                                  height: contentView.frame.size.height)
        
        iconImageView.frame = CGRect(x: 20,
                                  y: (contentView.frame.size.height - contentView.frame.size.height) / 2,
                                  width: contentView.frame.size.height / 1.1,
                                  height: contentView.frame.size.height / 1.1)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        nameLabel.text = nil
        symbolLabel.text = nil
        priceLabel.text = nil
        iconImageView.image = nil
    }
    
    // Configure
    func configure(with viewModel: CryptoTableViewCellViewModel) {
        nameLabel.text = viewModel.name
        symbolLabel.text = viewModel.symbol
        priceLabel.text = viewModel.price
        
        if let data = viewModel.iconData {
            iconImageView.image = UIImage(data: data)
        } else {
            if let url = viewModel.iconUrl {
                let task = URLSession.shared.dataTask(with: url) { [weak self] (data, _, _) in
                    if let data = data {
                        viewModel.iconData = data
                        DispatchQueue.main.async {
                            self?.iconImageView.image = UIImage(data: data)
                        }
                    }
                }
                task.resume()
            }
        }
    }
}
