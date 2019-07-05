//
//  ViewController.swift
//  DiffableDataSource
//
//  Created by Shivank Agarwal on 19/06/19.
//  Copyright © 2019 Shivank Agarwal. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    @available(iOS 13.0, *)
    lazy var dataSource = diffableDataSource()
    
    var sectionData: [SectionModel] = []
    var itemData: [ItemModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        registerNibs()
        setDataSource()
        loadData()
    }
    
    private func registerNibs(){
        tableView.register(UINib(nibName: "\(CustomTableViewCell.self)", bundle: Bundle.main), forCellReuseIdentifier: kCustomTableViewCellReuseId)
    }
    
    private func setDataSource(){
        if #available(iOS 13.0, *) {
            tableView.dataSource = dataSource
        } else {
            // Fallback on earlier versions
            tableView.delegate = self
            tableView.dataSource = self
        }
    }
    
    @available(iOS 13.0, *)
    private func diffableDataSource() -> UITableViewDiffableDataSource<SectionModel, ItemModel>{
        return UITableViewDiffableDataSource(tableView: tableView, cellProvider: { tableView, indexPath, aItem in
            let cell: CustomTableViewCell = tableView.dequeueReusableCell(withIdentifier: kCustomTableViewCellReuseId, for: indexPath) as! CustomTableViewCell
            cell.titleLabel.text = aItem.item
            return cell
        })
    }
    
    private func loadData(){
        sectionData.append(SectionModel(item: "Section 1"))
        itemData.append(ItemModel(item: "Item 1"))
        itemData.append(ItemModel(item: "Item 2"))
        update(aSections: sectionData, aItems: itemData)
        itemData.append(ItemModel(item: "Item 3"))
        itemData.append(ItemModel(item: "Item 4"))
        itemData.append(ItemModel(item: "Item 5"))
        itemData.append(ItemModel(item: "Item 6"))
        itemData.append(ItemModel(item: "Item 7"))
        update(aSections: sectionData, aItems: itemData)
    }
    
    private func update(aSections: [SectionModel], aItems: [ItemModel]){
        if #available(iOS 13.0, *) {
            let snapshot = NSDiffableDataSourceSnapshot<SectionModel, ItemModel>()
            snapshot.appendSections(aSections)
            snapshot.appendItems(aItems)
            dataSource.apply(snapshot)
        } else {
            // Fallback on earlier versions
        }
    }
}
