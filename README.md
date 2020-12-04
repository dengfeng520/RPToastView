

<h2>RPToastView</h2>

![](https://img.shields.io/badge/language-swift-orange.svg)
![](https://img.shields.io/cocoapods/l/RPBannerView-Swift.svg?style=flat)
![](https://img.shields.io/cocoapods/p/RPBannerView-Swift.svg?style=flat)
![](https://img.shields.io/cocoapods/v/RPBannerView-Swift.svg?style=flat)
![](https://img.shields.io/badge/carthage-v1.0-519dd9.svg)


<h2>Requirements</h2>

**RPToastView works on iOS 9+ and requires Swift 4.2 to build.**

<h2>Adding RPToastView to your project</h2>

**Carthage or CocoaPods is the recommended way to add RPToastView to your project.**

<h3> CocoaPods </h3>

**1、Add a pod entry for RPToastView to your project Podfile**

```
pod 'RPToastView'

```
or

```
pod 'RPToastView', :git => 'https://github.com/dengfeng520/RPToastView'
```

**2、Install the pod by running**

```
pod install
```

**3、 Include RPToastView wherever you need it with**

```
import RPToastView
```

<h3>Carthage</h3>


**1、Opne terminal**

```
cd ../projectName
touch Cartfile
```
**2、 Open Cartfile**

```
github "dengfeng520/RPToastView"
```
**3、Perform update**

```
carthage update --platform iOS
```
After the building is completed，include RPToastView wherever you need it class with.

```
import RPToastView
```

<h2>Usage</h2>

```
var display = Display()
display.mode = .loopAndTextMode
display.title = "this is loop loading..."
display.isCustomize = true
display.bgColor = UIColor(red: 245.0/255.0, green: 190.0/255.0, blue: 98.0/255.0, alpha: 1)
display.titleColor = .white
display.outerLayer = UIColor(red: 200/255, green: 200/255, blue: 200/255, alpha: 1)
display.innerLayer = .white
RPToastView.loading(display)
```


![demo1](https://github.com/dengfeng520/RPToastView/blob/master/demo1.png?raw=true)
![demo2](https://github.com/dengfeng520/RPToastView/blob/master/demo2.png?raw=true)
![demo3](https://github.com/dengfeng520/RPToastView/blob/master/ddemo3.png?raw=true)
![demo4](https://github.com/dengfeng520/RPToastView/blob/master/demo4.png?raw=true)
![demo5](https://github.com/dengfeng520/RPToastView/blob/master/demo5.png?raw=true)
![demo6](https://github.com/dengfeng520/RPToastView/blob/master/demo6.png?raw=true)
![demo7](https://github.com/dengfeng520/RPToastView/blob/master/demo7.png?raw=true)
![demo8](https://github.com/dengfeng520/RPToastView/blob/master/demo8.png?raw=true)
![demo9](https://github.com/dengfeng520/RPToastView/blob/master/demo9.png?raw=true)
![demo10](https://github.com/dengfeng520/RPToastView/blob/master/demo10.png?raw=true)
![demo10](https://github.com/dengfeng520/RPToastView/blob/master/demo11.png?raw=true)
![demo10](https://github.com/dengfeng520/RPToastView/blob/master/demo12.png?raw=true)
![demo10](https://github.com/dengfeng520/RPToastView/blob/master/demo13.png?raw=true)
![demo10](https://github.com/dengfeng520/RPToastView/blob/master/demo14.png?raw=true)