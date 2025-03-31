//
//  Commander.swift
//  System_Defaults_EditorApp
//
//  Created by 1ris_W
//

import Foundation

enum ShellCommandError: Error {

    case executionFailed(String)
    case commandNotFound
    case timeout
}

struct ShellCommandResult {

    let output: String?
    let error: String?
    let exitCode: Int32

    var succeeded: Bool {
        return exitCode == 0
    }
}

func executeShellCommand(
    _ command: String,
    timeout: TimeInterval = 30.0
) -> Result<
    ShellCommandResult, ShellCommandError
> {

    let task = Process()
    task.launchPath = "/usr/bin/env"
    task.arguments = ["zsh", "-l", "-c", command]

    let outputPipe = Pipe()
    let errorPipe = Pipe()
    task.standardOutput = outputPipe
    task.standardError = errorPipe

    do {
        try task.run()

        let timeoutWorkItem = DispatchWorkItem {
            if task.isRunning {
                task.terminate()
            }
        }

        DispatchQueue.global().asyncAfter(deadline: .now() + timeout, execute: timeoutWorkItem)

        task.waitUntilExit()
        timeoutWorkItem.cancel()

        if task.terminationReason == .uncaughtSignal {
            return .failure(.timeout)
        }

        let outputData = outputPipe.fileHandleForReading.readDataToEndOfFile()
        let errorData = errorPipe.fileHandleForReading.readDataToEndOfFile()

        let output = String(data: outputData, encoding: .utf8)?.trimmingCharacters(
            in: .whitespacesAndNewlines)
        let error = String(data: errorData, encoding: .utf8)?.trimmingCharacters(
            in: .whitespacesAndNewlines)

        return .success(
            ShellCommandResult(
                output: output?.isEmpty ?? true ? nil : output,
                error: error?.isEmpty ?? true ? nil : error,
                exitCode: task.terminationStatus
            ))
    } catch {
        return .failure(.executionFailed(error.localizedDescription))
    }
}

// 异步版本，适合在UI应用中使用
func executeShellCommandAsync(
    _ command: String,
    timeout: TimeInterval = 30.0,
    completion: @escaping (Result<ShellCommandResult, ShellCommandError>) -> Void
) {
    DispatchQueue.global(qos: .userInitiated).async {
        let result = executeShellCommand(command, timeout: timeout)
        DispatchQueue.main.async {
            completion(result)
        }
    }
}
