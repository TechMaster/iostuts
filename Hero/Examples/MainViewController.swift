import UIKit
import CollectionKit

class MainViewController: UIViewController {
  
  typealias SourceData = (UIViewController.Type, String)
  
  let collectionView = CollectionView()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .white
    
    view.addSubview(collectionView)
    
    setupcollection()
  }
  
  func setupcollection() {
    let dataSource = ArrayDataSource<SourceData>(data: [
      (BuiltInTransitionExampleViewController1.self, "Built In Animations"),
      (MatchExampleViewController1.self, "Match Animation"),
      (MatchInCollectionExampleViewController1.self, "Match Cell in Collection"),
      (AppStoreViewController1.self, "App Store Transition"),
      ])
    
    let viewSource = ClosureViewSource { (label: UILabel, data: SourceData, index) in
      label.text = "\(index + 1). \(data.1)"
      label.textAlignment = .center
      label.layer.borderColor = UIColor.gray.cgColor
      label.layer.borderWidth = 0.5
      label.layer.cornerRadius = 8
    }
    
    let sizeSource = { (i: Int, data: SourceData, size: CGSize) -> CGSize in
      return CGSize(width: size.width, height: 64)
    }
    
    let examplesProvider = BasicProvider<SourceData, UILabel>(
      dataSource: dataSource,
      viewSource: viewSource,
      sizeSource: sizeSource,
      layout: FlowLayout(lineSpacing: 10))
    { (context) in
      let vc = context.data.0.init()
      self.present(vc, animated: true, completion: nil)
    }
    // TODO: Migrate the example to CollectionKit 2.2.0
    
    let imageView = UIImageView(image: #imageLiteral(resourceName: "ic_insert_photo_48pt"))
    imageView.contentMode = .scaleAspectFit
    
    let imageProvider = SimpleViewProvider(views: [imageView], sizeStrategy: (.fill, .fit))
    
    let legacyButton = UIButton(type: .system)
    legacyButton.setTitle("Legacy Examples", for: .normal)
    legacyButton.addTarget(self, action: #selector(showLegacy), for: .touchUpInside)
    let legacyExamplesProvider = SimpleViewProvider(views: [legacyButton], sizeStrategy: (.fill, .fit))
    
    collectionView.provider = ComposedProvider(
      layout: FlowLayout(lineSpacing: 10).inset(by: UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)),
      sections: [imageProvider, examplesProvider, legacyExamplesProvider]
    )
  }
  
  @objc func showLegacy() {
    hero.replaceViewController(with: viewController(forStoryboardName: "Main"))
  }
  
  override func viewDidLayoutSubviews() {
    super.viewDidLayoutSubviews()
    collectionView.frame = view.bounds
  }
}
