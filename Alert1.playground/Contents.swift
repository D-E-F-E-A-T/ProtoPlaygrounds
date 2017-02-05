//: Playground - noun: a place where people can play

import UIKit
import PlaygroundSupport
import XCPlayground

var headerColor = UIColor.blue

class Receiver {
	let headerView: UIView
	let headerLabel: UILabel
	var number = 1
	init(header: UIView, aHeaderLabel: UILabel) {
		headerView = header
		headerLabel = aHeaderLabel
	}
	@objc func buttonClicked() {
		print("click")
		switch number {
		case 0:
			headerView.backgroundColor = .red
			headerLabel.text = "Critical Alert!"
		case 1:
			headerView.backgroundColor = .orange
			headerLabel.text = "Medium Alert!"
		case 2:
			headerView.backgroundColor = UIColor(red: 0.218, green: 0.690, blue: 1.000, alpha: 1.000)
			headerLabel.text = "Normal Alert!"
		default:
			headerView.backgroundColor = UIColor(red: 0.218, green: 0.690, blue: 1.000, alpha: 1.000)
		}
		if (number < 2) {
			number = number + 1
		} else {
			number = 0
		}
	}
}

let view = UIView(frame: CGRect(x: 5, y: 0, width: 275, height: 150))
view.backgroundColor = .white
view.layer.cornerRadius = 5.0
view.clipsToBounds = true
PlaygroundPage.current.liveView = view

let headerView = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: 40))
//headerView.backgroundColor = UIColor(red: 0.218, green: 0.690, blue: 1.000, alpha: 1.000)
headerView.backgroundColor = headerColor
view.addSubview(headerView)
//
let titleLabel = UILabel(frame: CGRect(x: 5, y: 5, width: view.frame.size.width-10, height: 30))
titleLabel.text = "Critical Alert"
titleLabel.textAlignment = .center
titleLabel.font = UIFont.systemFont(ofSize: 18)
titleLabel.textColor = .white
view.addSubview(titleLabel)
//
let bodyLabel = UILabel(frame: CGRect(x: 5, y: 40, width: view.frame.size.width-10, height: 75))
bodyLabel.baselineAdjustment = .alignCenters

bodyLabel.text = "Some action needs to be taken to proceed."
bodyLabel.textAlignment = .center
bodyLabel.numberOfLines = 3
bodyLabel.font = UIFont.systemFont(ofSize: 14)
view.addSubview(bodyLabel)


let dismissButton = UIButton(frame: CGRect(x: -1, y: view.frame.size.height - 35, width: view.frame.size.width/2 + 2, height: 36))
dismissButton.setTitle("Cancel", for: .normal)
dismissButton.setTitleColor(UIColor.black, for: .normal)
dismissButton.tintColor = .blue
dismissButton.backgroundColor = UIColor.groupTableViewBackground
dismissButton.layer.borderColor = UIColor.black.cgColor
dismissButton.layer.borderWidth = 1.0
view.addSubview(dismissButton)


let okButton = UIButton(frame: CGRect(x: view.frame.size.width/2, y: view.frame.size.height - 35, width: view.frame.size.width/2 + 2, height: 36))
okButton.setTitle("OK", for: .normal)
okButton.setTitleColor(UIColor.black, for: .normal)
okButton.tintColor = .blue
okButton.backgroundColor = UIColor.groupTableViewBackground
okButton.layer.borderColor = UIColor.black.cgColor
okButton.layer.borderWidth = 1.0
view.addSubview(okButton)
let receiver = Receiver(header: headerView, aHeaderLabel: titleLabel)
okButton.addTarget(receiver, action: #selector(Receiver.buttonClicked), for: .touchUpInside)
