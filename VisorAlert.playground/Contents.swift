//: Playground - noun: a place where people can play

import UIKit
import PlaygroundSupport

//: Visor Alert is a animated Alert HUD inspired by Tweetbot

class VisorAlertView : UIView {
	
	var parent: UIView
	var text: String
	var animationDuration = 1.0
	var textColor: UIColor = .white
	
	var alertColor: UIColor = .white
	
	init(parent: UIView, text: String) {
		self.parent = parent
		self.text = text
		let _frame = VisorAlertView.getStartFrame(_parent: parent)
		super.init(frame: _frame)
		self.parent.addSubview(self)
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	func setup() {
		let textLabel = UILabel(frame: CGRect(x: 5, y: 5, width: self.frame.size.width-10, height: self.frame.size.height-10))
		textLabel.font = UIFont.systemFont(ofSize: 14)
		textLabel.numberOfLines = 2
		textLabel.textColor = self.textColor
		textLabel.text = self.text
		textLabel.textColor = .black
		textLabel.textAlignment = .center
		self.addSubview(textLabel)
		
		self.backgroundColor = alertColor
		self.layer.cornerRadius = 5.0
		
	}
	
	func _show() {
		self.show(animated: true)
	}
	
	func _hide() {
		self.hide(animated: true)
	}
	
	func show(animated: Bool) {
		self.setup()
		if (animated) {
			UIView.animate(withDuration: animationDuration, animations: {
				self.frame = VisorAlertView.getEndFrame(_parent: self.parent)
			})
		} else {
			self.frame = VisorAlertView.getEndFrame(_parent: self.parent)
		}
	}
	
	func hide(animated: Bool) {
		if (animated) {
			UIView.animate(withDuration: animationDuration, animations: {
				self.frame = VisorAlertView.getStartFrame(_parent: self.parent)
			})
		} else {
			self.frame = VisorAlertView.getStartFrame(_parent: self.parent)
		}
	}
	
	private
	class func getStartFrame(_parent: UIView) -> CGRect {
		let width: CGFloat = _parent.frame.size.width - 30.0
		let height: CGFloat = 55.0
		let frame = CGRect(x: 15, y: -height, width: width, height: height)
		return frame
	}
	
	class func getEndFrame(_parent: UIView) -> CGRect {
		let width: CGFloat = _parent.frame.size.width - 30.0
		let height: CGFloat = 55.0
		let frame = CGRect(x: 15, y: -5, width: width, height: height)
		return frame
	}
}

let phoneMock = UIView(frame: CGRect(x: 0, y: 0, width: 375, height: 675))
phoneMock.backgroundColor = UIColor.gray
PlaygroundPage.current.liveView = phoneMock

let visor = VisorAlertView(parent: phoneMock, text: "Hello, this is a visor alert")

let showButton = UIButton(frame: CGRect(x: 0, y: phoneMock.frame.size.height/2, width: phoneMock.frame.size.width/2, height: 20))
showButton.setTitle("Show", for: .normal)
phoneMock.addSubview(showButton)
showButton.addTarget(visor, action: #selector(VisorAlertView._show), for: .touchUpInside)

let hideButton = UIButton(frame: CGRect(x: phoneMock.frame.size.width/2, y: phoneMock.frame.size.height/2, width: phoneMock.frame.size.width/2, height: 20))
hideButton.setTitle("Hide", for: .normal)
hideButton.addTarget(visor, action: #selector(VisorAlertView._hide), for: .touchUpInside)
phoneMock.addSubview(hideButton)
