//
//  ExploreContentCell.swift
//  ANF Code Test
//
//  Created by Joffrey Mann on 1/24/23.
//

import UIKit

protocol ExploreContentCellDelegate: AnyObject {
    func openContentUrl(urlString: String)
}

class ExploreContentCell: UITableViewCell {
    private var content: ANFExploreContent?
    private weak var delegate: ExploreContentCellDelegate?
    @IBOutlet var button: UIButton!
    
    func configure(content: ANFExploreContent?, delegate: ExploreContentCellDelegate?) {
        self.content = content
        self.delegate = delegate
        button.setTitle(content?.title, for: .normal)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    @IBAction func openUrl(sender: UIButton) {
        guard let url = content?.target else {
            return
        }
        delegate?.openContentUrl(urlString: url)
    }
}
