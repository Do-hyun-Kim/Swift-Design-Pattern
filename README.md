# Swift-Design-Pattern

<H3>Design-Pattern<H3>

|디자인 패턴|설명|
|:--------------:|:--------------:|
|**Coordinator - Pattern**|2022.05.03|
  
 <br>
  
Coordinator Pattern
  -
  - <h5>Coordinator란 하나 이상의 ViewController에게 지시를 내리는 객체 이다.</h5>
  - <h5>지시는 화면을 전환을 의미하며, Coordinator 패턴에서는 현재 ViewController에서 다음 ViewController로 이동할때 직접 Push/Present등의 화면 전환을 하는 대신 모든 화면 내비게이션을 Coordinator가 관리한다.</h5>
  - <h5>ViewController에서 Navigation의 책임을 다른 클래스로 분리 할 수 있으며, ViewController들이 서로 분리 될 수 있고 쉽게 재사용 될 수 있다.</h5>
  <br>
  
  
Coordinator Patter 특징
  -
  - Coordinator별로 하나 또는 그 이상의 ViewController롤 소유합니다.
  - 각 Coordinator는 일반적으로 "**start()**" 메서드를 사용하여 ViewController를 전환합니다.
  - 각 ViewController는 Coordinator에 대한 delegate reference가 있습니다.
  - 각 Coordinator는 **child** Coordinators 배열을 가지고 있습니다.
  - 각 childCoordinators는 **parent** Coordinator에 대한 delegate reference가 있습니다.
  
    
  
```swift
  protocol Coordinator: AnyObject {
    var presenter: UINavigationController { get set }
    var childCoordinator: [Coordinator] { get set }
    func start()
}

class AppCoordinator: Coordinator {
    var window: UIWindow
    var presenter: UINavigationController
    var childCoordinator: [Coordinator]
    
    init(window: UIWindow) {
        self.window = window
        self.presenter = UINavigationController()
        self.childCoordinator = []
    }
    
    func start() {
        window.rootViewController = presenter
        window.makeKeyAndVisible()
    }
}



class HomeCoordinator: Coordinator {
    
    var presenter: UINavigationController
    var childCoordinator: [Coordinator]
    
    init(presenter: UINavigationController) {
        self.presenter = presenter
        self.childCoordinator = []
    }
    
    func start() {
        let homeVC = ViewController.init()
        presenter.pushViewController(homeVC, animated: true)
    }
}

```
