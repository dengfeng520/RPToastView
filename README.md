

<h2>RPToastView</h2>

* iOS 11.0+

* Swift 5.0+

* pod V1.7.0+

* license MIT


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

> onlyTextMode

```
RPToastView.show(mode: .onlyTextMode, isView:self.view, text: "Loading....")
```

or

```
RPToastView.show(mode: .onlyTextMode, text: "Loading....")

```

> indeterminateMode


```
RPToastView.show(mode: .indeterminateMode, isView:self.view)
```

or

```
RPToastView.show(mode: .indeterminateMode)
```

> mixedMode

```
 RPToastView.show(mode: .mixedMode, isView:self.view, text: "Loading....")
```
or 

```
RPToastView.show(mode: .mixedMode, text: "Loading....")
```

> loopMode

```
RPToastView.show(mode: .loopMode, isView:self.view)
```
or

```
RPToastView.show(mode: .loopMode)
```
> loopAndTextMode

```
RPToastView.show(mode: .loopAndTextMode, isView:self.view, text: "Loading....")

```
or 

```
RPToastView.show(mode: .loopAndTextMode, text: "Loading....")

```

> hidden

```
RPToastView.hidden(animation: true)
```

![demo1](https://github.com/dengfeng520/RPToastView/blob/master/demo1.png?raw=true)
![demo2](https://github.com/dengfeng520/RPToastView/blob/master/demo2.png?raw=true)
![demo3](https://github.com/dengfeng520/RPToastView/blob/master/demo3.png?raw=true)
![demo4](https://github.com/dengfeng520/RPToastView/blob/master/demo4.png?raw=true)
![demo5](https://github.com/dengfeng520/RPToastView/blob/master/demo5.png?raw=true)
![demo6](https://github.com/dengfeng520/RPToastView/blob/master/demo6.png?raw=true)
![demo7](https://github.com/dengfeng520/RPToastView/blob/master/demo7.png?raw=true)
![demo8](https://github.com/dengfeng520/RPToastView/blob/master/demo8.png?raw=true)
![demo9](https://github.com/dengfeng520/RPToastView/blob/master/demo9.png?raw=true)
![demo10](https://github.com/dengfeng520/RPToastView/blob/master/demo10.png?raw=true)