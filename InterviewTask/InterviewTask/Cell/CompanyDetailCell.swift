//
//  CompanyDetailCell.swift
//  InterviewTask
//
//  Created by Amit Gohel on 05/09/22.
//

import UIKit

class CompanyDetailCell: UITableViewCell {

    @IBOutlet weak var lbCompanyName: UILabel!
    @IBOutlet weak var lbFounderName: UILabel!
    @IBOutlet weak var lbYear: UILabel!
    @IBOutlet weak var lbEmployees: UILabel!
    @IBOutlet weak var lbLunchSite: UILabel!
    @IBOutlet weak var lbValuation: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
