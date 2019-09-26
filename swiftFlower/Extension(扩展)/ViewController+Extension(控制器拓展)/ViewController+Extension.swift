//
//  ViewController+Extension.swift
//  Operate-Swift
//
//  Created by sugar. on 2018/12/27.
//  Copyright © 2018 sugar. All rights reserved.
//

import UIKit
import ObjectiveC
import TZImagePickerController


//  协议
protocol UIViewControllerDelegate: NSObjectProtocol {
    func viewControllerDidSelectPic(viewController: UIViewController, photos:[UIImage]?)
}

private var key: Void?

extension UIViewController: TZImagePickerControllerDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    var vcDelegate: UIViewControllerDelegate? {
        
        get {
            return objc_getAssociatedObject(self, &key) as? UIViewControllerDelegate
        }
        set {
            objc_setAssociatedObject(self, &key, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
    
    /// 选择照片
    func showSelectPhotoClick(number: Int) {
        
        let alertController = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        
        let photoAction = UIAlertAction(title: "拍照", style: .default) { (ation) in
            
            if YFTool.isCameraOpen() {
                
                let imagePickerVC = UIImagePickerController()
                imagePickerVC.delegate = self
                imagePickerVC.sourceType = .camera
                imagePickerVC.allowsEditing = false
                self.present(imagePickerVC, animated: true, completion: nil)
                
            } else {
                
                // FIXME: 提示打开权限或没有相机
                
                print("未打开权限或没有相机")
            }
        }
        
        let albumAction = UIAlertAction(title: "从相册中选择", style: .default) { (ation) in
            
            if YFTool.isAlbumOpen() {
                
                if number == 1 {
                    
                    let imagePickerVC = UIImagePickerController()
                    imagePickerVC.delegate = self
                    imagePickerVC.sourceType = .photoLibrary
                    imagePickerVC.allowsEditing = false
                    self.present(imagePickerVC, animated: true, completion: nil)
                
                    return
                }
                
                let imagePickerVC = TZImagePickerController(maxImagesCount: number, delegate: self)
                imagePickerVC!.allowPickingVideo = false
                imagePickerVC!.allowTakeVideo = false
                imagePickerVC!.allowTakePicture = false
            
                self.navigationController?.present(imagePickerVC!, animated: true, completion: nil)
                
            } else {
                
                // FIXME: 提示打开权限
                
                print("未打开权限")
            }
        }
        let cancelAction = UIAlertAction(title: "取消", style: .cancel, handler: nil)
        
        alertController.addAction(cancelAction)
        alertController.addAction(photoAction)
        alertController.addAction(albumAction)
        self.navigationController?.present(alertController, animated: true, completion: nil)
    }
    
    
    //  MARK: TZImagePickerControllerDelegate
    public func imagePickerController(_ picker: TZImagePickerController!, didFinishPickingPhotos photos: [UIImage]!, sourceAssets assets: [Any]!, isSelectOriginalPhoto: Bool) {
        
        if vcDelegate != nil {
            
            vcDelegate?.viewControllerDidSelectPic(viewController: self, photos: photos)
        }
    }
    
    
    //  MARK: UIImagePickerControllerDelegate
    public func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
    
        if vcDelegate != nil {

            let image = info[UIImagePickerController.InfoKey.originalImage] as! UIImage
            vcDelegate?.viewControllerDidSelectPic(viewController: self, photos: [image])
            picker.dismiss(animated: true, completion: nil)
        }
    }
}





