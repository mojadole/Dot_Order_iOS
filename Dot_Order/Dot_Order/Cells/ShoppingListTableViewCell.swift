//
//  RecentOrderTableViewCell.swift
//  Dot_Order
//
//  Created by 김영현 on 2023/04/03.
//

import UIKit

class ShoppingListTableViewCell: UITableViewCell {

    @IBOutlet weak var menuNameLabel: UILabel!
    @IBOutlet weak var countLabel: UILabel!
    @IBOutlet weak var minusButton: UIButton!
    @IBOutlet weak var plusButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        contentView.layer.cornerRadius = 20
        plusButton.addTarget(self, action: #selector(plusButtonPressed(_:)), for: .touchUpInside)
        minusButton.addTarget(self, action: #selector(minusButtonPressed(_:)), for: .touchUpInside)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 17, left: 20, bottom: 17, right: 20))
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @objc func plusButtonPressed(_ sender: UIButton) {
        print("plus button is pressed")
    }
    
    @objc func minusButtonPressed(_ sender: UIButton) {
        print("minus button is pressed")
    }
    
}
