//
//  HomeViewController.swift
//  Fintap
//
//  Created by diana on 10.11.2025.
//

import UIKit

class HomeViewController: UIViewController {
    @IBOutlet weak var homeView: UIImageView!
    @IBOutlet weak var incomeView: UIImageView!
    @IBOutlet weak var expenceView: UIImageView!
    @IBOutlet weak var reportView: UIImageView!
    @IBOutlet weak var exportView: UIImageView!
    
    private let progressLayer = CAShapeLayer()
    private let trackLayer = CAShapeLayer()
    private let percentageLabel = UILabel()
  
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        setupTapGestures()
        
    }
    private func setupTapGestures() {
           let imageViews = [homeView, incomeView, expenceView, reportView, exportView]
           
           for (index, imageView) in imageViews.enumerated() {
               imageView?.isUserInteractionEnabled = true
               imageView?.tag = index
               let tap = UITapGestureRecognizer(target: self, action: #selector(imageTapped(_:)))
               imageView?.addGestureRecognizer(tap)
           }
       }
       
       @objc private func imageTapped(_ sender: UITapGestureRecognizer) {
           guard let tappedImage = sender.view as? UIImageView else { return }
           
        
           UIView.animate(withDuration: 0.2, animations: {
               tappedImage.tintColor = .purple
               tappedImage.image = tappedImage.image?.withRenderingMode(.alwaysTemplate)
           })
           
           
           DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
               self.goToNextPage(for: tappedImage)
           }
       }
       
       private func goToNextPage(for imageView: UIImageView) {
           let storyboard = UIStoryboard(name: "Main", bundle: nil)
           var nextVC: UIViewController?
           
           switch imageView {
           case homeView:
               nextVC = storyboard.instantiateViewController(withIdentifier: "HomeDetailViewController")
           case incomeView:
               nextVC = storyboard.instantiateViewController(withIdentifier: "IncomeViewController")
           case expenceView:
               nextVC = storyboard.instantiateViewController(withIdentifier: "ExpenceViewController")
           case reportView:
               nextVC = storyboard.instantiateViewController(withIdentifier: "ReportViewController")
           case exportView:
               nextVC = storyboard.instantiateViewController(withIdentifier: "ExportViewController")
           default:
               break
           }
           
           if let vc = nextVC {
               navigationController?.pushViewController(vc, animated: true)
           }
       }
}
