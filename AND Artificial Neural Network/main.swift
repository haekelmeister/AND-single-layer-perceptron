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

    }
    
    return 0;
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

andNeuralNetwork()
