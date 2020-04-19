//
//  HomeViewModel.swift
//  Memeful
//
//  Created by Bhavesh on 18/04/20.
//  Copyright © 2020 Bhavesh. All rights reserved.
//

import Foundation
import Alamofire
import MBProgressHUD

protocol HomeViewModelDelegate {
    func didFetchMemes()
    func showError(error:String)
}

class HomeViewModel
{
    var memes:[Meme] = []
    var delegate:HomeViewModelDelegate?
    var currentYOffset: [CGFloat]?

//    https://api.imgur.com/3/gallery/hot/viral/day/0?showViral=true&mature=false&album_previews=true
    func getMostViewed(page:Int)
    {
        var urlString = "https://api.imgur.com/3/gallery"
        urlString.append("/hot")
        urlString.append("/viral")
        urlString.append("/day")
        urlString.append("/" + "\(page)")
        
        var params:[String:Any] = [:]
        params.updateValue(true, forKey: "showViral")
        params.updateValue(false, forKey: "mature")
        params.updateValue(true, forKey: "album_previews")
        
        var headers:[String:String] = [:]
        headers.updateValue("Client-ID c36fee2a0d2878b", forKey: "Authorization")

        AF.request(urlString, method: .get, parameters: params, encoding: URLEncoding.default, headers: HTTPHeaders(headers)).responseDecodable { (response: DataResponse<ResponseStructure,AFError>) in
            switch response.result
            {
            case .success(let memeResponse):
                self.memes = self.memes + (memeResponse.data ?? [])
                print(self.memes.count)

                self.delegate?.didFetchMemes()
            case .failure(let error):
                print(error.localizedDescription)
                self.delegate?.showError(error: error.localizedDescription)
                break
            }
        }
        
    }
    
    
}

extension HomeViewModel: ImgurLayoutDelegate {
  func collectionView(
    _ collectionView: UICollectionView,
    heightForPhotoAtIndexPath indexPath:IndexPath) -> CGFloat {

    let height = memes[indexPath.item].cover_height
    return CGFloat(height ?? 0)
 
  }
}
