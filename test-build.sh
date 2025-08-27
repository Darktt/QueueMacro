#!/bin/bash

echo "🧪 測試 QueueMacro 建置..."

echo "📦 清理舊的建置檔案..."
swift package clean

echo "🔄 重新解析依賴..."
swift package resolve

echo "🔨 建置套件..."
swift build

echo "✅ 建置成功！"

echo "🧪 執行測試..."
swift test

echo "✅ 測試完成！"
