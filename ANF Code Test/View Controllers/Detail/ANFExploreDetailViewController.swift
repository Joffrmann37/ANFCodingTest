//
//  ANFExploreDetailViewController.swift
//  ANF Code Test
//
//  Created by Joffrey Mann on 1/24/23.
//

import UIKit

class ANFExploreDetailViewController: UIViewController {
    var exploreModel: ANFExploreModel?
    @IBOutlet var headerImageView: UIImageView!
    @IBOutlet var topDescriptionLabel: UILabel!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var promoLabel: UILabel!
    @IBOutlet var bottomDescriptionLabel: UILabel!
    @IBOutlet var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        loadContent()
        tableView.dataSource = self
    }
    
    private func loadContent() {
        if let data = exploreModel?.backgroundImageData {
            headerImageView.image = UIImage(data: data)
        }
        self.title = exploreModel?.title
        topDescriptionLabel.text = exploreModel?.topDescription
        titleLabel.text = exploreModel?.title
        promoLabel.text = exploreModel?.promoMessage
        bottomDescriptionLabel.text = exploreModel?.bottomDescription
    }
}

extension ANFExploreDetailViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return exploreModel?.content?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "ContentCell", for: indexPath) as! ExploreContentCell
        cell.configure(content: exploreModel?.content?[indexPath.row], delegate: self)
        return cell
    }
}

extension ANFExploreDetailViewController: ExploreContentCellDelegate {
    func openContentUrl(urlString: String) {
        guard let url = URL(string: urlString) else {
          return //be safe
        }

        if #available(iOS 10.0, *) {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        } else {
            UIApplication.shared.openURL(url)
        }

    }
}
