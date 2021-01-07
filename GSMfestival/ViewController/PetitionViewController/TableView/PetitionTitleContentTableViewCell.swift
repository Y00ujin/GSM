//
//  PetitionTitleContentTableViewCell.swift
//  GSMfestival
//
//  Created by 김유진 on 2020/12/23.
//

import UIKit

protocol SendButtonDelegate {
    func agreementButtonAction(sender: UIButton, cell: UITableViewCell)
    func oppositionButtonAction(sender: UIButton, cell: UITableViewCell)
}

class PetitionTitleContentTableViewCell: UITableViewCell {

    @IBOutlet weak var tableViewCellTitleLabel: UILabel!
    @IBOutlet weak var tableViewCellContentLabel: UILabel!
    
    @IBOutlet weak var agreementNumberLabel: UILabel!
    @IBOutlet weak var oppositionNumberLabel: UILabel!
    @IBOutlet weak var agreementButton: UIButton!
    @IBOutlet weak var oppositionButton: UIButton!
    

    
    var delegate: SendButtonDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    // 찬성버튼
    @IBAction func agreementButton(_ sender: UIButton) {
        delegate?.agreementButtonAction(sender: sender, cell: self)
    }
    
    // 반대버튼
    @IBAction func oppositionButton(_ sender: UIButton) {
        delegate?.oppositionButtonAction(sender: sender, cell: self)
    }
}
