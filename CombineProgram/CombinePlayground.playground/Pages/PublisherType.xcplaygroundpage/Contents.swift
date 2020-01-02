//: [Previous](@previous)

import Combine

check("FlatMap Operator") {
    [[1, 2, 3], [4, 5, 6]]
        .publisher
        .flatMap { $0.publisher }
}

let p1 = Publisher.FlatMap(
    upstream: [[1, 2, 3], [4, 5, 6]].publisher,
    maxOublishers: .unlimited
){
    $0.publisher
}



//: [Next](@next)
