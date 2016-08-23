//
//  Created by Performante on 07/03/16.
//  Copyright © 2016 Performante. All rights reserved.
//

import UIKit
import PerformanteSDK

class ViewController: UIViewController {

    let performanteSDK: PFSDK

    init(performanteSDK: PFSDK) {
        self.performanteSDK = performanteSDK
        super.init(nibName: nil, bundle: nil)
        configureEventButtonAction()
    }

    required init?(coder aDecoder: NSCoder) { fatalError("init(coder:) has not been implemented") }

    override func loadView() {
        view = UIView(frame: CGRect.zero)
        view.backgroundColor = UIColor(red:0.26, green:0.65, blue:0.31, alpha:1)
        view.addSubview(logoImageView)
        view.addSubview(eventButton)
        setupLayout()
    }

    // MARK: Subviews

    let logoImageView: UIImageView = {
        let view = UIImageView(image: UIImage(named: "logo"))
        view.contentMode = .ScaleAspectFit
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    let eventButton: UIButton = {
        let button = UIButton(frame: CGRect.zero)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Send event", forState: UIControlState.Normal)
        button.backgroundColor = UIColor.yellowColor()
        button.setTitleColor(UIColor.blueColor(), forState: UIControlState.Normal)
        return button
    }()

    // MARK: UI Actions

    func configureEventButtonAction() {
        eventButton.addTarget(self, action: #selector(eventButtonAction(_:)), forControlEvents: .TouchUpInside)
    }

    func eventButtonAction(sender: UIButton) {
        performanteSDK.sendAppEvent("Tap_button_event")
    }

    // MARK: Setup layout

    func setupLayout() {
        let horizontalLogoConstraint = NSLayoutConstraint.constraintsWithVisualFormat(
            "H:|-(100)-[view]-(100)-|",
            options: NSLayoutFormatOptions(rawValue: 0),
            metrics: nil,
            views:["view": logoImageView]
        )

        let horizontalButtonConstraint = NSLayoutConstraint.constraintsWithVisualFormat(
            "H:|[button]|",
            options: NSLayoutFormatOptions(rawValue: 0),
            metrics: nil,
            views:["button": eventButton]
        )

        let verticalConstraint = NSLayoutConstraint.constraintsWithVisualFormat(
            "V:|[view]-[button(50)]|",
            options: NSLayoutFormatOptions(rawValue: 0),
            metrics: nil,
            views:[
                "view": logoImageView,
                "button": eventButton
            ]
        )

        logoImageView.superview?.addConstraints(horizontalLogoConstraint)
        eventButton.superview?.addConstraints(horizontalButtonConstraint)
        logoImageView.superview?.addConstraints(verticalConstraint)
    }

}
