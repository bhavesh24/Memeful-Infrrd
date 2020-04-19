//
//  ViewController.swift
//  InfrrdImgurTest
//
//  Created by Bhavesh on 18/04/20.
//  Copyright © 2020 Bhavesh. All rights reserved.
//

import Toast_Swift
import MBProgressHUD
import UIKit

class ViewController: UIViewController {

    @IBOutlet var headerViewSegmentedControl: UISegmentedControl!
    @IBOutlet var headerView: UIView!
    @IBOutlet var collectionView: UICollectionView!
    var viewModel = HomeViewModel()
    var page = 0
    var isLoading = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let layout = collectionView?.collectionViewLayout as? ImgurLayout {
          layout.delegate = viewModel
        }
        viewModel.delegate = self
        collectionView.delegate = self
        MBProgressHUD.showAdded(to: view, animated: true)
        viewModel.getMostViewed(page: page)
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "extraCell")
        headerViewSegmentedControl.addUnderlineForSelectedSegment()

        
        // Do any additional setup after loading the view.
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        headerView.setGradient()


    }
    @IBAction func segmentedControlDidChange(_ sender: Any) {
        headerViewSegmentedControl.changeUnderlinePosition()
    }
}

extension ViewController: UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
   func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {

       return viewModel.memes.count
  }
  
    internal func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ImgurMemeCell", for: indexPath as IndexPath) as! ImgurMemeCell
            cell.setMeme(meme: viewModel.memes[indexPath.row])
            return cell

  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        let itemSize = (collectionView.frame.width - (collectionView.contentInset.left + collectionView.contentInset.right + 10)) / 2
        return CGSize(width: itemSize, height: itemSize)

  }
}
extension ViewController: HomeViewModelDelegate
{
    func didFetchMemes()
    {
        DispatchQueue.main.async {
   
            self.collectionView.reloadData()
            MBProgressHUD.hide(for: self.view, animated: true)
            self.isLoading = false
        }
    }
    func showError(error: String) {
        MBProgressHUD.hide(for: view, animated: true)
        view.makeToast(error)
        isLoading = false
    }
}
extension ViewController:UIScrollViewDelegate
{
    func scrollViewDidScroll(_ scrollView: UIScrollView)
    {
        if scrollView.contentOffset.y > (viewModel.currentYOffset?.min())! && !isLoading
        {
            isLoading = true
            page += 1
            viewModel.getMostViewed(page: page)
        }
    }
    

}
