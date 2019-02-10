//
//  CustomCellTableViewController.swift
//  my_study_app
//
//  Created by taka4yamamoto on 2019/02/09.
//  Copyright © 2019 yamataka. All rights reserved.
//

import UIKit

class CustomCellTableViewController: UITableViewController {

    let aqoursSymbols: [String] = ["🍊", "⛵", "🎹", "🌼", "🍭", "😈", "💮", "🐬", "✨"]
    let aqoursColors: [UIColor] = [UIColor.aqours.chika,
                                   UIColor.aqours.you,
                                   UIColor.aqours.riko,
                                   UIColor.aqours.hanamaru,
                                   UIColor.aqours.ruby,
                                   UIColor.aqours.yoshiko,
                                   UIColor.aqours.dia,
                                   UIColor.aqours.kanan,
                                   UIColor.aqours.mari]

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(CustomTableViewCell.self, forCellReuseIdentifier: CustomTableViewCell.identifier)
        tableView.separatorStyle = .none
        tableView.tableFooterView = UIView()
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return aqoursColors.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CustomTableViewCell.identifier) as! CustomTableViewCell
        cell.textLabel?.text = String(indexPath.row + 1) + ". " + aqoursSymbols[indexPath.row]
        cell.setColor(color: aqoursColors[indexPath.row])
        return cell
    }
}

class CustomTableViewCell: UITableViewCell {
    static let identifier = "CustomTableViewCell"

    private let separator: UIView = {
        let view = UIView()
        return view
    }()

    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        contentView.addSubview(separator)
        separator.translatesAutoresizingMaskIntoConstraints = false
        separator.heightAnchor.constraint(equalToConstant: 1).isActive = true
        separator.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        separator.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        separator.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setColor(color: UIColor) {
        separator.backgroundColor = color
    }
}
