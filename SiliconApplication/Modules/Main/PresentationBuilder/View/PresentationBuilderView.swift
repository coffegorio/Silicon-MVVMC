//
//  PresentationBuilderView.swift
//  SiliconApplication
//
//  Created by Егорио on 20.02.2025.
//

import UIKit
import SnapKit

class PresentationBuilderView: UIViewController {
    
    var viewModel: PresentationBuilderViewModel!
    var label: UILabel = {
        let label = UILabel()
        label.text = "Тут можно будет создать презентацию своей идеи или продукта :)"
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.textAlignment = .center
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        title = "Презентации"
        view.addSubview(label)
        label.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.leading.trailing.equalToSuperview().inset(40)
        }
    }
}

