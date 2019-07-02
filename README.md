

<h2>RPToastView</h2>

* iOS 9+

* Swift 4.2+

* pod V1.7.0+

* license MIT


<h2>Requirements</h2>

**RPToastView works on iOS 9+ and requires Swift 4.2 to build.**

<h2>Adding RPToastView to your project</h2>

**CocoaPods is the recommended way to add RPToastView to your project.**

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