import Combine

check("Empty") {
    Empty<Int, SampleError>()
}

check("Just") {
    Just("Hello SwiftUI")
}

check("Fail") {
    Fail(
        outputType: Int.self,
        failure: SampleError.sampleError)
}
