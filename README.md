# cc-switch: Claude Code Environment Variable Switch Tool

[点击查看中文说明](#cc-switch中文说明)

## Quick Remote Install
You can install cc-switch directly via one command (macOS/Linux/WSL):
```bash
bash <(curl -fsSL https://raw.githubusercontent.com/HamGuy/cc-switch/main/install.sh)
```
Or (if wget is preferred):
```bash
bash <(wget -qO- https://raw.githubusercontent.com/HamGuy/cc-switch/main/install.sh)
```
For Windows (PowerShell):
```powershell
irm https://raw.githubusercontent.com/HamGuy/cc-switch/main/install.ps1 | iex
```

---

## Supported Platforms
- macOS/Linux (Bash script: install.sh)
- Windows (PowerShell script: install.ps1)
- Windows WSL (use install.sh)

---

## Installation

### macOS/Linux/WSL
1. Go to the project directory and run:
   ```bash
   bash install.sh
   ```
2. After installation, you can use the `ccswitch` command directly.

### Windows (PowerShell)
1. Go to the project directory and run:
   ```powershell
   .\install.ps1
   ```
2. After installation, you can use the `ccswitch.ps1` command directly.
3. If prompted to restart PowerShell, run:
   ```powershell
   . $PROFILE
   ```

---

## Usage Examples
- Switch to kimi:
  ```
  ccswitch --type kimi --token sk-xxx
  ```
- Switch to anyrouter:
  ```
  ccswitch --type anyrouter --token sk-xxx
  ```
- Switch to custom BASE_URL:
  ```
  ccswitch --type custom --token sk-xxx --base_url https://your-url.com
  ```
- Reset to official default:
  ```
  ccswitch --reset
  ```
- Interactive mode:
  ```
  ccswitch
  ```

On Windows, use `ccswitch.ps1` instead of `ccswitch`, usage is the same.

---

## Reference
- https://github.com/LLM-Red-Team/kimi-cc

For customization or extension, please modify `cc_switch.py`.

---

# cc-switch中文说明

# cc-switch：Claude Code 环境变量切换工具

## 一键远程安装
你可以通过以下命令一键安装 cc-switch（macOS/Linux/WSL）：
```bash
bash <(curl -fsSL https://raw.githubusercontent.com/HamGuy/cc-switch/main/install.sh)
```
或（如果更喜欢 wget）：
```bash
bash <(wget -qO- https://raw.githubusercontent.com/HamGuy/cc-switch/main/install.sh)
```
Windows（PowerShell）：
```powershell
irm https://raw.githubusercontent.com/HamGuy/cc-switch/main/install.ps1 | iex
```

---

## 安装方法

### macOS/Linux/WSL
1. 进入项目目录，执行：
   ```bash
   bash install.sh
   ```
2. 安装完成后可直接使用 `ccswitch` 命令。

### Windows（PowerShell）
1. 进入项目目录，执行：
   ```powershell
   .\install.ps1
   ```
2. 安装完成后可直接使用 `ccswitch.ps1` 命令。
3. 若提示需重启 PowerShell，可执行：
   ```powershell
   . $PROFILE
   ```

---

## 用法示例
- 切换为 kimi：
  ```
  ccswitch --type kimi --token sk-xxx
  ```
- 切换为 anyrouter：
  ```
  ccswitch --type anyrouter --token sk-xxx
  ```
- 切换为自定义 BASE_URL：
  ```
  ccswitch --type custom --token sk-xxx --base_url https://your-url.com
  ```
- 重置为官方默认：
  ```
  ccswitch --reset
  ```
- 交互模式：
  ```
  ccswitch
  ```

Windows 下命令为 `ccswitch.ps1`，用法一致。

---

## 参考
- https://github.com/LLM-Red-Team/kimi-cc

如需定制或扩展，请修改 `cc_switch.py`。
