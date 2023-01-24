//
//  ANFExploreCardTableViewController.swift
//  ANF Code Test
//

import UIKit

class ANFExploreCardTableViewController: UITableViewController {

    private var exploreArr: [ANFExploreModel]?
    
    override func viewDidLoad() {
        let vm = ANFExploreViewModel(getExploreUseCase: GetExplore(exploreRepository: ANFExploreRepository()))
        vm.getExploreData(completion: { models in
            self.exploreArr = models
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        })
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        exploreArr?.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "ExploreContentCell", for: indexPath)
        if let titleLabel = cell.viewWithTag(1) as? UILabel,
           let titleText = exploreArr?[indexPath.row].title {
            titleLabel.text = titleText
        }
        
        if let imageView = cell.viewWithTag(2) as? UIImageView,
           let data = exploreArr?[indexPath.row].backgroundImageData,
           let image = UIImage(data: data) {
            imageView.image = image
        }
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? ANFExploreDetailViewController, let indexPath = tableView.indexPathForSelectedRow {
            destination.exploreModel = exploreArr?[indexPath.row]
        }
    }
}
