//
//  LaunchesCell.swift
//  InterviewTask
//
//  Created by Amit Gohel on 05/09/22.
//

import UIKit

class LaunchesCell: UITableViewCell {

    @IBOutlet weak var lbMissionName: UILabel!
    @IBOutlet weak var lbDateTime: UILabel!
    @IBOutlet weak var lbRocket: UILabel!
    @IBOutlet weak var lbDays: UILabel!
    @IBOutlet weak var imgPatch: UIImageView!
    @IBOutlet weak var imgLaunch: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

       
    }
    
}
