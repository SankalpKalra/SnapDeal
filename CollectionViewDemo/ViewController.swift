//
//  ViewController.swift
//  CollectionViewDemo
//
//  Created by Appinventiv on 27/02/18.
//  Copyright © 2018 Appinventiv. All rights reserved.
//

import UIKit

class ViewController: UIViewController{
    
    let layout = UICollectionViewFlowLayout()
    @IBOutlet weak var changeLayout: UIButton!
    var toggle=true
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    @IBAction func ChangeLayout(_ sender: UIButton) {
        
        self.toggle = !toggle
        self.collectionView.reloadData()
        
    }
    
    var products=["Apple IPhone","Butter Bite","ChocoPie","Dairy Milk Silk","Good Day","Dairy Milk Hero","LAY'S STAX®","Lays Classic","Lays Limon","Dairy Milk Oreo","PepsiMax"]
    var Desc=["A product description is the copy that describes the features and benefits of a product to a customer.","A product description is the copy that describes the features and benefits of a product to a customer.","A product description is the copy that describes the features and benefits of a product to a customer.","A product description is the copy that describes the features and benefits of a product to a customer.","A product description is the copy that describes the features and benefits of a product to a customer.","A product description is the copy that describes the features and benefits of a product to a customer.","A product description is the copy that describes the features and benefits of a product to a customer.","A product description is the copy that describes the features and benefits of a product to a customer.","A product description is the copy that describes the features and benefits of a product to a customer.","A product description is the copy that describes the features and benefits of a product to a customer.","A product description is the copy that describes the features and benefits of a product to a customer."]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.collectionView.delegate=self
        self.collectionView.dataSource=self
        
        
        
        //        if toggle{
        //        let imageSize=UIScreen.main.bounds.width/2-2
        //        let layout=UICollectionViewFlowLayout()
        //        layout.sectionInset=UIEdgeInsetsMake(5, 0, 5, 0)
        //        layout.itemSize=CGSize(width:imageSize, height: imageSize)
        //        layout.minimumInteritemSpacing=1 // space between columns
        //        layout.minimumLineSpacing=15 // space between rows
        //        collectionView.collectionViewLayout=layout
        //        }
        //        else {
        //                let imageSize=UIScreen.main.bounds.width
        //                //let imageSize1=UIScreen.main.bounds.height/3
        //                let layout1=UICollectionViewFlowLayout()
        //                //layout1.sectionInset=UIEdgeInsetsMake(0, 0, 0, 200)
        //                layout1.itemSize=CGSize(width:imageSize, height: imageSize)
        //                layout1.minimumInteritemSpacing=10 // space between rows
        //                collectionView.collectionViewLayout=layout1
        //        }
        //
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

extension ViewController:UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout{
    
    
//    func collectionView(_ collectionView: UICollectionView, transitionLayoutForOldLayout fromLayout: UICollectionViewLayout, newLayout toLayout: UICollectionViewLayout) -> UICollectionViewTransitionLayout {
//        
//    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return products.count
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width=view.frame.width
        let height=view.frame.height
        if toggle{
            return CGSize(width: width/2-10, height:width/2-10)
            
        }
        else{
            return CGSize(width: width, height:height/5)
           // useLayoutToLayoutNavigationTransitions = true
        }
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        
        if toggle{
            changeLayout.setImage(#imageLiteral(resourceName: "List"), for: .normal)
            let cell=collectionView.dequeueReusableCell(withReuseIdentifier: "GridCell", for: indexPath) as! ProductCollectionViewCell
            cell.productImage.image=UIImage(named:products[indexPath.row] + ".png")
            cell.productName.text=products[indexPath.row]
            cell.productDesc.text=Desc[indexPath.row]
            cell.layer.shadowColor=UIColor.black.cgColor
            cell.layer.shadowOpacity=0.5
            
            
            
            return cell
        }
        else {
            changeLayout.setImage(#imageLiteral(resourceName: "Grid2"), for: .normal)
            let cell=collectionView.dequeueReusableCell(withReuseIdentifier: "ListCell", for: indexPath) as! ProductListCollectionViewCell
            cell.productImage.image=UIImage(named:products[indexPath.row] + ".png")
            cell.productName.text=products[indexPath.row]
            cell.productDesc.text=Desc[indexPath.row]
            cell.layer.shadowColor=UIColor.black.cgColor
            cell.layer.shadowOpacity=0.5
            return cell
        }
    }
    
    
}
