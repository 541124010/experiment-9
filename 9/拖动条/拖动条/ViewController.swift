//
//  ViewController.swift
//  拖动条
//
//  Created by student on 2018/11/7.
//  Copyright © 2018年 xh. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UIScrollViewDelegate {

    @IBOutlet weak var scrollview2: UIScrollView!
    @IBOutlet weak var pageControll: UIPageControl!
    @IBOutlet weak var scrollview: UIScrollView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
      
        //设置代理
        scrollview.delegate=self
        
        
        //添加imageview到scrollview里面
        for i in 1...7{
            let imageView=UIImageView(image: UIImage(named: "\(i)"))
			//填充满全部？
            imageView.contentMode = .scaleAspectFit
            imageView.frame=CGRect(x:CGFloat(i-1)*scrollview.bounds.width,y:0,width:
                scrollview.bounds.width,height:scrollview.bounds.height-30)
            scrollview.addSubview(imageView)
        }
        
        //总的容量长度 !!!!总共七张的长度
        scrollview.contentSize=CGSize(width: scrollview.bounds.width*7, height: scrollview.bounds.height)
        //支持一页一页的滚动
        scrollview.isPagingEnabled=true//一页一页的方式滚动
		
        //隐藏水平滚动条
        scrollview.showsHorizontalScrollIndicator=false;
        
        pageControll.numberOfPages=7//总页数为7
        pageControll.currentPage=0 //当前页为0
        
		
		
        scrollview2.maximumZoomScale=5
        
        scrollview2.minimumZoomScale=0.2
        
        
        let imageView=UIImageView(image: UIImage(named: "6"))
        scrollview2.addSubview(imageView)
        scrollview2.contentSize=imageView.bounds.size
   
        
        
    }
    
    //点击pagecrotol触发事件 拖出来的事件
    @IBAction func pageControllClicked(_ sender: UIPageControl) {
        let currentPage=sender.currentPage
        let rect=CGRect(x:CGFloat(currentPage)*scrollview.bounds.width,y:0,width:scrollview.bounds.width,height:scrollview.bounds.height)
        //重新定位到相应的位置 相应的cgrect
        scrollview.scrollRectToVisible(rect, animated: true)
    }
    
    
    //代理设置的 当照片发生滚动时
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        //contentoffset偏移量
        let currenPage=scrollview.contentOffset.x/scrollview.bounds.width
        pageControll.currentPage=Int(currenPage)  //从0到6
    }
    
  
    
    
    //用于缩放
	 func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return scrollview2.subviews.first
    }
    
   


}

