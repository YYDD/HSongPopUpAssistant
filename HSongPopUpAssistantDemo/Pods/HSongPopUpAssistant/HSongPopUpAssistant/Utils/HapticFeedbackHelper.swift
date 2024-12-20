//
//  HapticFeedbackHelper.swift
//  DataStationBoard
//
//  Created by Wanglei on 2024/1/6.
//

import CoreHaptics

class HapticFeedbackHelper {

    // 静态实例，使用单例模式
    static let shared = HapticFeedbackHelper()

    // Core Haptics 引擎
    private var hapticEngine: CHHapticEngine?

    // 避免外部直接创建实例
    private init() {
        setupHapticEngine()
    }

    // 设置 Core Haptics 引擎
    private func setupHapticEngine() {
        do {
            hapticEngine = try CHHapticEngine()
            try hapticEngine?.start()
        } catch {
            print("Error initializing haptic engine: \(error)")
        }
    }

    // 触发自定义的触感反馈
    func triggerCustomHaptic() {
        guard let hapticEngine = hapticEngine else {
            print("Haptic engine is not available.")
            return
        }

        var events = [CHHapticEvent]()

        // 创建自定义的震动事件
        let intensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: 1.0)
        let sharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: 1.0)
        let event = CHHapticEvent(eventType: .hapticContinuous, parameters: [intensity, sharpness], relativeTime: 0, duration: 1.0)

        events.append(event)

        // 播放自定义的震动
        do {
            let pattern = try CHHapticPattern(events: events, parameters: [])
            let player = try hapticEngine.makePlayer(with: pattern)
            try player.start(atTime: 0)
        } catch {
            print("Error playing custom haptic: \(error)")
        }
    }
    
    // 模拟叮咚震动效果
    func triggerDingDongHaptic() {
        guard let hapticEngine = hapticEngine else {
            print("Haptic engine is not available.")
            return
        }
        
        var events = [CHHapticEvent]()
        
        // 创建震动事件，可以根据需要调整参数
        let intensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: 0.8)
        let sharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: 0.8)
        let event = CHHapticEvent(eventType: .hapticTransient, parameters: [intensity, sharpness], relativeTime: 0)
        
        // 将震动事件添加到事件数组
        events.append(event)
        
        // 模拟两次短暂的震动
        events.append(contentsOf: [event, event])
        
        // 播放震动
        do {
            let pattern = try CHHapticPattern(events: events, parameters: [])
            let player = try hapticEngine.makePlayer(with: pattern)
            try player.start(atTime: 0)
        } catch {
            print("Error playing haptic: \(error)")
        }
    }
    
    // 模拟清脆的完成提醒
    func triggerCompletionHaptic() {
        guard let hapticEngine = hapticEngine else {
            print("Haptic engine is not available.")
            return
        }
        
        var events = [CHHapticEvent]()
        
        // 创建一个短暂的高尖锐度震动事件，模拟清脆的“叮”声
        let intensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: 1.0) // 强度最高
        let sharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: 1.0) // 尖锐度最高
        let event = CHHapticEvent(eventType: .hapticTransient, parameters: [intensity, sharpness], relativeTime: 0)
        
        // 将震动事件添加到事件数组
        events.append(event)
        
        // 播放震动
        do {
            let pattern = try CHHapticPattern(events: events, parameters: [])
            let player = try hapticEngine.makePlayer(with: pattern)
            try player.start(atTime: 0)
        } catch {
            print("Error playing haptic: \(error)")
        }
    }
}
