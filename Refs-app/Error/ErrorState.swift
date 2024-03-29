//
//  ErrorState.swift
//  Refs-app
//
//  Created by Екатерина Никифорова on 29.03.2024.
//

import Foundation

enum ErrorState
{
    case Error(message: String)
    case Success(message: String)
    case None // no error state
}
