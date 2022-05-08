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
  
  
Coordinator Pattern 코드 구현 하면서 궁금점
  - **ChildrenCoordinator**를 통하여 하위 Coordinator를 저장 하는 경우가 있는데 기존 **start()** 메소드를 통해 Push 하는 경우와 ChildrenCoordinator를 사용하여 하위 Coordinaotr를 사용한 Push 방법의 차이는 어떤것인지?
    - Push 같은 경우 Flow가 이어지게 Navigation이 된다면 Push를 사용하여 화면 전환을 사용하며, 그렇지 않으면 self.navigation.viewControllers = [ViewController] 를 사용 하여 **RootViewController**를 설정한다.
    - **ChildrenCoordinator** 통해 Coordinator Tree가 생성되며, Parent Coordinator가 Children Coordinator를 알기에 화면 전환을 할 수 있습니다. 또한 이러한 저장을 통하여, 여러 Children Coordinator중 자식 Coordinator를 구분 할 수 있으며, 추후 삭제를 해야 합니다 -> Remove 안하면 순한 참조 문제 
  - ViewModel에 Coordinator를 선언 하는 것과 View(ViewController)에 Coordinator를 선언 하는 것의 차이와 어떤 것이 더 효율적인지?
  - TabbarController에 경우 Coordinator를 어떻게 분배 할것인지?
