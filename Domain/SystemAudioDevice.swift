//
//  SystemAudioDevice.swift
//  Telephone
//
//  Copyright © 2008-2016 Alexey Kuznetsov
//  Copyright © 2016-2018 64 Characters
//
//  Telephone is free software: you can redistribute it and/or modify
//  it under the terms of the GNU General Public License as published by
//  the Free Software Foundation, either version 3 of the License, or
//  (at your option) any later version.
//
//  Telephone is distributed in the hope that it will be useful,
//  but WITHOUT ANY WARRANTY; without even the implied warranty of
//  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
//  GNU General Public License for more details.
//

public protocol SystemAudioDevice {
    var identifier: Int { get }
    var uniqueIdentifier: String { get }
    var name: String { get }
    var inputs: Int { get }
    var outputs: Int { get }
    var isBuiltIn: Bool { get }
    var isNil: Bool { get }
}

public extension SystemAudioDevice {
    var hasInputs: Bool {
        return inputs > 0
    }

    var hasOutputs: Bool {
        return outputs > 0
    }

    var isBuiltInInput: Bool {
        return isBuiltIn && hasInputs
    }

    var isBuiltInOutput: Bool {
        return isBuiltIn && hasOutputs
    }
}
