# iOS-corner
似乎没有那家公司比Apple更爱圆角了,事实上,圆角也会让图形/产品看起来更加无侵略性,能够带来更好的用户体验.  
iOS开发中各种圆角也随处可见,最简单给控件添加圆角的方式就是给视图的layer设置corner属性了:  
```
self.blueView.layer.cornerRadius = 5.f;
self.blueView.layer.masksToBounds = YES; 
```
这种方式会带来两个问题:  
* 1. 当图片数量比较多的时候,这种添加圆角方式特别消耗性能,比如在`UITableViewCell`添加过多圆角的话,甚至会带来视觉可见的卡顿.  
* 2. 无法配置圆角数量(只能添加view的四个角全为圆角),无法配置某个圆角大小.   

第一个问题实际上是由于数量太多的情况下,系统会频繁的调用GPU的离屏渲染(Offscreen Rendering)机制,导致内存损耗严重.更多关于离屏渲染的详解,可以看[这里](http://objccn.io/issue-3-1/),本文不多赘述.

第二个问题,我们可以使用`UIBezierPath `来完美解决.以下是示例代码:
```
    UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:self.blueView.bounds byRoundingCorners:UIRectCornerTopLeft | UIRectCornerBottomLeft cornerRadii:CGSizeMake(20, 0)];
    
    CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
   
    maskLayer.frame = self.blueView.bounds;
    
    maskLayer.path = maskPath.CGPath;
    
    self.blueView.layer.mask = maskLayer;
    
    self.blueView.layer.cornerRadius = 5.f;
    self.blueView.layer.masksToBounds = YES;
```
想要配置某个角为圆角的话,只需要指定对应的`UIRectCorner`即可
![image](https://github.com/crossPQW/iOS-corner/blob/master/corner/screenshot/WeChat_1439887744.jpeg)  

以下是显示效果:
![](https://github.com/crossPQW/iOS-corner/blob/master/corner/screenshot/6RLW6N8F8%5DJJ)IRS0%25N%25MP0.jpg)
