//
//  CameraViewController.swift
//  TimeLine
//
//  Created by Joshua Kuehn on 11/25/16.
//  Copyright © 2016 Joshua Kuehn. All rights reserved.
//

import UIKit
import Photos
import PhotosUI

class CameraViewController: UIViewController {
  
  @IBOutlet weak var assetCollectionView: UICollectionView!
  
  @IBOutlet weak var cameraButton: UIBarButtonItem!
  
  var fetchResult: PHFetchResult<PHAsset>!
  var assetCollection: PHAssetCollection!
  
  fileprivate let imageManager = PHCachingImageManager()
  fileprivate var thumbnailSize: CGSize!
  fileprivate var previousPreheatRect = CGRect.zero
  
  private lazy var picker: UIImagePickerController = {
    var picker = UIImagePickerController()
    picker.allowsEditing = false
    picker.modalPresentationStyle = .fullScreen
    return picker
  }()

  override func viewDidLoad() {
      super.viewDidLoad()
    
    automaticallyAdjustsScrollViewInsets = false
    
    assetCollectionView.delegate = self
    assetCollectionView.dataSource = self
    
    PHPhotoLibrary.shared().register(self)
    
    if fetchResult == nil {
      let allPhotosOptions = PHFetchOptions()
      allPhotosOptions.sortDescriptors = [NSSortDescriptor(key: "creationDate", ascending: true)]
      fetchResult = PHAsset.fetchAssets(with: allPhotosOptions)
    }
    
    let width = assetCollectionView.frame.width / 4
    let layout = assetCollectionView.collectionViewLayout as! UICollectionViewFlowLayout
    layout.itemSize = CGSize(width: width, height: width)
    thumbnailSize = CGSize(width: width, height: width)

    self.picker.delegate = self
    self.cameraButton.isEnabled = UIImagePickerController.isSourceTypeAvailable(.camera) ? true : false
    self.picker.sourceType = UIImagePickerController.isSourceTypeAvailable(.camera) ? .camera : .photoLibrary
    
      // Do any additional setup after loading the view.
    
    
  }
  
  deinit {
    PHPhotoLibrary.shared().unregisterChangeObserver(self)
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    
    // Determine the size of the thumbnails to request from the PHCachingImageManager
    let scale = UIScreen.main.scale
    let cellSize = (assetCollectionView.collectionViewLayout as! UICollectionViewFlowLayout).itemSize
    thumbnailSize = CGSize(width: cellSize.width * scale, height: cellSize.height * scale)
  }
  
  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
  }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
      
      
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
  
  
  @IBAction func cameraButtonTapped(_ sender: Any) {
    self.present(picker, animated: true, completion: nil)
  }

}

extension CameraViewController: UICollectionViewDelegate {
  
}

extension CameraViewController: UICollectionViewDataSource {

  
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return fetchResult.count
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let asset = fetchResult.object(at: indexPath.item)
    
    guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as? GridViewCell else { fatalError("unexpected cell in collection view") }
    
    cell.representedAssetIdentifier = asset.localIdentifier
    
    imageManager.requestImage(for: asset, targetSize: thumbnailSize, contentMode: .aspectFill, options: nil, resultHandler: {
      image, _ in
      if cell.representedAssetIdentifier == asset.localIdentifier {
        cell.thumbnailImage = image ?? UIImage()
      }
    })
    
    return cell
  }
}

extension CameraViewController: UIImagePickerControllerDelegate {
  func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
    dismiss(animated: true, completion: nil)
  }
  
  func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
//    var newImage: UIImage
//    
//    if let possibleImage = info["UIImagePickerControllerEditedImage"] as? UIImage {
//      newImage = possibleImage
//    } else if let possibleImage = info["UIImagePickerControllerOriginalImage"] as? UIImage {
//      newImage = possibleImage
//    } else {
//      return
//    }
//    
//    let imageName = UUID().uuidString
//    let imagePath = getDocumentsDirectory().appendingPathComponent(imageName)
//    
//    if let jpegData = UIImageJPEGRepresentation(newImage, 80) {
//      try? jpegData.write(to: imagePath)
//    }

    
    dismiss(animated: true, completion: nil)
  }
  
  func getDocumentsDirectory() -> URL {
    let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
    let documentsDirectory = paths[0]
    return documentsDirectory
  }
}

extension CameraViewController: UINavigationControllerDelegate {
  
}

extension CameraViewController: PHPhotoLibraryChangeObserver {
  func photoLibraryDidChange(_ changeInstance: PHChange) {
    
    guard let changes = changeInstance.changeDetails(for: fetchResult)
      else { return }
    
    // Change notifications may be made on a background queue. Re-dispatch to the
    // main queue before acting on the change as we'll be updating the UI.
    DispatchQueue.main.sync {
      // Hang on to the new fetch result.
      fetchResult = changes.fetchResultAfterChanges
      if changes.hasIncrementalChanges {
        // If we have incremental diffs, animate them in the collection view.
        guard let collectionView = self.assetCollectionView else { fatalError() }
        collectionView.performBatchUpdates({
          // For indexes to make sense, updates must be in this order:
          // delete, insert, reload, move
          if let removed = changes.removedIndexes, removed.count > 0 {
            collectionView.deleteItems(at: removed.map({ IndexPath(item: $0, section: 0) }))
          }
          if let inserted = changes.insertedIndexes, inserted.count > 0 {
            collectionView.insertItems(at: inserted.map({ IndexPath(item: $0, section: 0) }))
          }
          if let changed = changes.changedIndexes, changed.count > 0 {
            collectionView.reloadItems(at: changed.map({ IndexPath(item: $0, section: 0) }))
          }
          changes.enumerateMoves { fromIndex, toIndex in
            collectionView.moveItem(at: IndexPath(item: fromIndex, section: 0),
                                    to: IndexPath(item: toIndex, section: 0))
          }
        })
      } else {
        // Reload the collection view if incremental diffs are not available.
        assetCollectionView.reloadData()
      }
      //resetCachedAssets()
    }
  }
}
