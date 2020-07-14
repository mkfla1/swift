// Copyright (c) 2019 Razeware LLC
// See Copyright Notice page for details about the license.

import Foundation

class Distribution {
  func sample() -> Double {
    fatalError("Must override")
  }
  
  func sample(count: Int) -> [Double] {
    return (1...count).map { _ in sample() }
  }
}

class UniformDistribution: Distribution {
  var range: ClosedRange<Int>
  
  init(range: ClosedRange<Int>) {
    self.range = range
  }
  
  override func sample() -> Double {
    return Double(Int.random(in: range))
  }
}

let d20 = UniformDistribution(range: 1...20)
d20.sample(count: 10)

class GeometryBase {
  func area() -> Double {
    fatalError("derived class must implement this")
  }
}

//extension不会放在virtual table中，导致无法override
//不过可以利用@objc采用message dispatch
extension GeometryBase {
  @objc func perimeter() -> Double {
    fatalError("derived class must implement this")
  }
}

// 即使继承自NSObject还是默认用dynamic dispatch, 不过可以手动@objc
class DrawableBase: NSObject {
  @objc func draw() {
    fatalError("derive")
  }
}
