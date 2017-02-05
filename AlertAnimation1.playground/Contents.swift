//: Playground - noun: a place where people can play

import UIKit
import PlaygroundSupport

let view = UIView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))

class Alert : UIView {
	
	enum AlertType : Int {
		case critical
		case medium
		case general
	}
	
	var alertType: AlertType = .general
	var titleText: String
	var bodyText: String
	var okButtonTitle: String
	var cancelButtonTitle: String
	
	var parent: UIView
	
	init(parent: UIView,
	     alertType: AlertType,
	     titleText: String,
	     bodyText: String,
	     okButtonTitle: String,
	     cancelButtonTitle: String) {
		self.parent = parent
		let viewCenterY = parent.frame.size.height / 2
		let viewCenterX = parent.frame.size.width / 2
		self.alertType = alertType
		self.titleText = titleText
		self.bodyText = bodyText
		self.okButtonTitle = okButtonTitle
		self.cancelButtonTitle = cancelButtonTitle
		let width = parent.frame.size.width-30
		super.init(frame: CGRect(x: -width, y: viewCenterY-75, width: width, height: 150))
		self.render()
	}
	
	func render() {
		var headerColor : UIColor
		switch alertType {
		case .critical:
			headerColor = .red
		case .medium:
			headerColor = .orange
		case .general:
			headerColor = .blue
		default:
			headerColor = .blue
		}
		
		self.backgroundColor = .white
		self.layer.borderWidth = 1.0
		self.layer.cornerRadius = 5.0
		self.clipsToBounds = true
		
		let header = UIView(frame: CGRect(x: 0, y: 0, width: self.frame.size.width, height: 40.0))
		header.backgroundColor = headerColor
		self.addSubview(header)
		
		let titleLabel = UILabel(frame: CGRect(x: 5, y: 5, width: self.frame.size.width-10, height: 30))
		titleLabel.text = titleText
		titleLabel.textAlignment = .center
		titleLabel.font = UIFont.systemFont(ofSize: 18)
		titleLabel.textColor = .white
		header.addSubview(titleLabel)
		
		let bodyLabel = UILabel(frame: CGRect(x: 5, y: 40, width: self.frame.size.width-10, height: 75))
		bodyLabel.baselineAdjustment = .alignCenters
		
		bodyLabel.text = bodyText
		bodyLabel.textAlignment = .center
		bodyLabel.numberOfLines = 3
		bodyLabel.font = UIFont.systemFont(ofSize: 14)
		self.addSubview(bodyLabel)
		
		
		let dismissButton = UIButton(frame: CGRect(x: -1, y: self.frame.size.height - 35, width: self.frame.size.width/2 + 2, height: 36))
		dismissButton.setTitle(cancelButtonTitle, for: .normal)
		dismissButton.setTitleColor(UIColor.black, for: .normal)
		dismissButton.tintColor = .blue
		dismissButton.backgroundColor = UIColor.groupTableViewBackground
		dismissButton.layer.borderColor = UIColor.black.cgColor
		dismissButton.layer.borderWidth = 1.0
		self.addSubview(dismissButton)
		
		
		let okButton = UIButton(frame: CGRect(x: self.frame.size.width/2, y: self.frame.size.height - 35, width: self.frame.size.width/2 + 2, height: 36))
		okButton.setTitle("OK", for: .normal)
		okButton.setTitleColor(UIColor.black, for: .normal)
		okButton.tintColor = .blue
		okButton.backgroundColor = UIColor.groupTableViewBackground
		okButton.layer.borderColor = UIColor.black.cgColor
		okButton.layer.borderWidth = 1.0
		self.addSubview(okButton)
		
		
		parent.addSubview(self)
		
		UIView.animate(withDuration: 0.5, animations: {
			let viewCenterY = self.parent.frame.size.height / 2
			self.frame = CGRect(x: 15, y: viewCenterY-75, width: self.parent.frame.size.width-30, height: 150)
		})

	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
}

let PhoneMock = UIView(frame: CGRect(x: 0, y: 0, width: 375, height: 600))
PhoneMock.backgroundColor = .gray
PlaygroundPage.current.liveView = PhoneMock
let AlertView = Alert(parent: PhoneMock, alertType: .general, titleText: "Critical Alert", bodyText: "This is an example of a critical alert", okButtonTitle: "OK", cancelButtonTitle: "Back")

