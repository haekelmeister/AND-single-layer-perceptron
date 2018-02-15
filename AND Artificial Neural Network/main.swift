//
//  AND Single Layer Perceptron
//

import Foundation

/**
 The activation function (or transfer function). It returns 0 or 1 in case the input
 is higher than the given threshold.
 */
func neuronFires(threshold: Double, neuronInput: Double) -> Int {
    if( neuronInput >= threshold ) {
        return 1
    }

    return 0
}

/**
 This function demonstrates a single layer perceptron with logical AND.
 The connection weights will be adjusted by the DELTA rule:

 Δw(ik) = 𝜀 * 𝛿(i) * a(k)

 where:
 - 𝜀 : the learning rate, mostly a constant
 - 𝛿(i) : the error rate, desired output - calculated output
 - a(k) : activation level of the corresponding input neuron

 ```
          +--------+
 Input >  | Neuron +---- RANDOM
          +--------+       |
                           v
                       +--------+
                       | Neuron | > Output
                       +--------+
                           ^
           +--------+      |
 Input >   | Neuron +--- RANDOM
           +--------+
 ```
*/
func andNetworkWithLearningRules() {
    let inputVectors: [[Int]]      = [[0, 0], [0, 1], [1, 0], [1, 1]]
    let outputVector: [Int]        = [    0,      0,      0,      1]
    var connectionWeights:[Double] = [drand48(), drand48()]
//    var connectionWeights:[Double] = [-0.5, 0.5]
    let THRESHOLD_OUTPUT_NEURON     = 1.5
    let THRESHOLD_INPUT_NEURON      = 1.0
    let EPSILON                     = 0.01

    print("weights=\(connectionWeights)")

    var run = true
    var loopCounter = 0
    while run {
        loopCounter += 1
        run = false
        for (inputVector, output) in zip(inputVectors, outputVector) {
            var outputNeuronStimulationLevel = 0.0
            for (input, weight) in zip(inputVector, connectionWeights) {
                outputNeuronStimulationLevel += Double(neuronFires(threshold: THRESHOLD_INPUT_NEURON, neuronInput: Double(input)))  * weight
            }
            let neuronFired = neuronFires(threshold: THRESHOLD_OUTPUT_NEURON, neuronInput: Double(outputNeuronStimulationLevel))

            print("\(inputVector) >> \(neuronFired)")

            if neuronFired != output {
               // DELTA Rule: https://www.youtube.com/watch?v=4E4GhVREXBg
                for index in 0..<inputVector.count {
                    let deltaWeight = EPSILON * Double(output - neuronFired) * Double(neuronFires(threshold: THRESHOLD_INPUT_NEURON, neuronInput: Double(inputVector[index])))
                    connectionWeights[index] += deltaWeight
                }
                run = true
            }
        }
        print("weights=\(connectionWeights)")
    }
    
    print("Loops=\(loopCounter)")
}



/**
 This function demonstrates a single layer perceptron with logical AND.
 No learning is applied, just the network calculation is made.
 
 ```
          +--------+
  Input > | Neuron +-- 1 -+
          +--------+      |
                          v
                     +--------+
                     | Neuron | > Output
                     +--------+
                          ^
          +--------+      |
  Input > | Neuron +-- 1 -+
          +--------+
 ```
 */
func andNeuralNetwork() {
    let inputVectors: [[Int]]       = [[0, 0], [0, 1], [1, 0], [1, 1]]
    let connectionWeights: [Double] = [1, 1]
    let THRESHOLD_OUTPUT_NEURON     = 1.5
    let THRESHOLD_INPUT_NEURON      = 1.0
    
    for inputVector in inputVectors {
        var outputNeuronNetworkInput = 0.0
        for (input, weight) in zip(inputVector, connectionWeights) {
            outputNeuronNetworkInput += Double(neuronFires(threshold: THRESHOLD_INPUT_NEURON, neuronInput: Double(input)))  * weight
        }
        
        let neuronFired = neuronFires(threshold: THRESHOLD_OUTPUT_NEURON, neuronInput: outputNeuronNetworkInput)
        print("\(inputVector) >> \(neuronFired)")
    }
}

print("AND Single Layer Perceptron - Artificial Neural Network")

//andNeuralNetwork()
andNetworkWithLearningRules()
