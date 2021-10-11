//
//  ViewController.swift
//  TableViewDetail
//
//  Created by Ricardo Montesinos on 12/11/19.
//  Copyright © 2019 Bedu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  
  private let data = DataSet()
  let tableView = UITableView()
    
  override func viewDidLoad() {
    super.viewDidLoad()
    tableView.frame = CGRect(x: 0, y: 0, width: 320, height: 480)
    self.view.addSubview(tableView)
    tableView.delegate = self
    tableView.dataSource = self
    tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cellId")
    data.generateData()
  }
}
extension ViewController: UITableViewDelegate, UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    data.pokemons.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let cell = tableView.dequeueReusableCell(withIdentifier: "cellId") else { return UITableViewCell() }
    cell.textLabel?.text = data.pokemons[indexPath.row].name
    cell.imageView?.image = data.pokemons[indexPath.row].photo
    return cell
  }
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    let pokemon = data.pokemons[indexPath.row]
    let vc = storyboard?.instantiateViewController(identifier: "detailViewController") as! DetailViewController
    vc.pokemon = pokemon
    self.present(vc, animated: true, completion: nil)
  }
}

