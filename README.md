# QueueMacro

[![Test QueueMacro](https://github.com/darktt/QueueMacro/actions/workflows/main.yml/badge.svg)](https://github.com/darktt/QueueMacro/actions/workflows/main.yml)

一個 Swift 巨集套件，提供便利的 DispatchQueue 執行語法糖。

## 功能特色

- **簡化語法**：使用巨集語法簡化 DispatchQueue 的使用
- **類型安全**：編譯時期巨集展開，保持類型安全
- **效能優化**：零執行時期開銷，巨集在編譯時完全展開

## 支援平台

- macOS 12.0+
- iOS 13.0+
- tvOS 13.0+
- watchOS 6.0+
- Mac Catalyst 13.0+

## 安裝

### Swift Package Manager

在你的 `Package.swift` 中加入：

```swift
dependencies: [
    .package(url: "https://github.com/eden0606/QueueMacro.git", from: "1.0.0")
]
```

在目標中加入依賴：

```swift
.target(
    name: "YourTarget",
    dependencies: ["QueueMacro"]
)
```

### Xcode

1. 開啟 Xcode 專案
2. 選擇 File > Add Package Dependencies
3. 輸入 `https://github.com/eden0606/QueueMacro.git`
4. 選擇版本並加入至專案

## 使用方式

### MainQueue 巨集

執行程式碼在主佇列：

```swift
import QueueMacro

#MainQueue {
    // 這段程式碼會在主佇列執行
    print("在主執行緒執行")
}
```

### Async 巨集

在指定佇列執行程式碼：

```swift
import QueueMacro

// 預設在主佇列執行
#Async {
    print("在主佇列執行")
}

// 指定佇列執行
#Async(queue: .global(qos: .background)) {
    print("在背景佇列執行")
}

// 使用參數形式
#Async(queue: .main, {
    print("在主佇列執行")
})
```

## 巨集展開

這些巨集會在編譯時期展開為標準的 DispatchQueue 呼叫：

```swift
// #MainQueue { print("Hello") }
// 展開為：
DispatchQueue.main.async {
    print("Hello")
}

// #Async(queue: .global()) { print("World") }
// 展開為：
DispatchQueue.global().async {
    print("World")
}
```

## 開發

### 建置與測試

```bash
# 完整建置與測試流程
./test-build.sh

# 或個別指令
swift build
swift test
```

### 專案結構

```
QueueMacro/
├── Sources/
│   ├── QueueMacro/          # 公開 API 和巨集宣告
│   └── Macros/              # 巨集實作
│       ├── Plugins.swift    # 編譯器外掛註冊
│       ├── Async/           # Async 巨集實作
│       └── MainQueue/       # MainQueue 巨集實作
├── Tests/                   # 測試套件
└── Examples/                # 使用範例
```

## 授權

MIT License

## 貢獻

歡迎提交 Issue 和 Pull Request！
