//
//  CallHistoryTableRowView.swift
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

import Cocoa

final class CallHistoryTableRowView: NSTableRowView {
    override func draw(_ dirtyRect: NSRect) {
        super.draw(dirtyRect)
        drawSeparator(in: dirtyRect)
    }

    override func drawSelection(in dirtyRect: NSRect) {
        switch selectionHighlightStyle {
        case .regular:
            selectionColor.set()
            fillRectIfNotEmpty(NSIntersectionRect(bounds, dirtyRect))
        default:
            super.drawSelection(in: dirtyRect)
        }
    }

    override func drawSeparator(in dirtyRect: NSRect) {
        guard !isSelected && !isNextRowSelected else  { return }
        NSColor.gridColor.set()
        fillRectIfNotEmpty(NSIntersectionRect(makeSeparatorRect(bounds: bounds), dirtyRect))
    }

    private var selectionColor: NSColor {
        if isEmphasized {
            return NSColor.alternateSelectedControlColor
        } else {
            return NSColor.secondarySelectedControlColor
        }
    }
}

private func fillRectIfNotEmpty(_ rect: NSRect) {
    if !NSIsEmptyRect(rect) {
        rect.fill()
    }
}

private func makeSeparatorRect(bounds: NSRect) -> NSRect {
    return NSRect(x: NSMinX(bounds) + 27, y: NSMaxY(bounds) - 1, width: bounds.size.width - 27, height: 1)
}