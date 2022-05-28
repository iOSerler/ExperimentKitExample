//
//  ViewController.swift
//  ExperimentKitTest
//
//  Created by Kamil on 27.05.2022.
//

import UIKit
import ExperimentKit

class ViewController: UIViewController {

    private lazy var name: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Local value"
        label.font = .systemFont(ofSize: 48)
        label.textColor = .black
        return label
    }()
    
    private lazy var age: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Local value"
        label.font = .systemFont(ofSize: 48)
        label.textColor = .black
        return label
    }()
    
    private lazy var city: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Local value"
        label.font = .systemFont(ofSize: 48)
        label.textColor = .black
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let configuration = FirebaseConfigurationProvider()
        ExperimentManager.shared.configure(configurationProvider: configuration)
        
        view.addSubview(name)
        view.addSubview(age)
        view.addSubview(city)
        view.backgroundColor = .white
        setupConstraints()
        
        self.addExperiment(forKey: "json_key", as: myJson.self) { object, value in
            DispatchQueue.main.async {
                self.name.text = "Name is: \(value.name)"
                self.age.text = "Age is: \(value.age)"
                self.city.text = "City is: \(value.city)"
            }
        }
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            name.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            name.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            age.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            age.topAnchor.constraint(equalTo: name.bottomAnchor, constant: 20),
            city.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            city.topAnchor.constraint(equalTo: age.bottomAnchor, constant: 20)
        ])
    }
}

struct myJson: Decodable {
    var name: String
    var age: Int
    var city: String
}
