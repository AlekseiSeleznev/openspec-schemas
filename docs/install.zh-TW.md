# 安裝指南

[English](./install.md) · [繁體中文](./install.zh-TW.md)

本 repo 提供多個 OpenSpec schema bundle。挑選你想用的 bridge,然後選下面其中一種方法安裝。

## 方法 1:Claude Code 一鍵 prompt(推薦)

在你專案的根目錄打開 Claude Code,把下面這段 prompt 貼進去(把 `<bridge-name>` 換成 `superpowers-bridge` 或其他 bridge):

```
Install the <bridge-name> schema for OpenSpec into this project:

1. Verify the project has an `openspec/` directory (run `openspec init` if missing).
2. Clone https://github.com/JiangWay/openspec-schemas to a temp dir.
3. Copy the `<bridge-name>/` subdirectory to `openspec/schemas/<bridge-name>/`.
4. Run `openspec schema validate <bridge-name>` to verify.
5. Run `openspec schemas` and confirm `<bridge-name>` is listed.
6. Clean up the temp directory.
7. If the bridge requires the Superpowers plugin, verify it's installed
   by running `claude plugin list`. If not listed, run
   `claude plugin install superpowers@claude-plugins-official`.
8. Show me the final state.
```

Claude 會把整個安裝跑完,包含 bridge 需要的依賴。

## 方法 2:手動 bash(CI / 非 Claude 環境)

```bash
# 把 <bridge-name> 換成你要的
BRIDGE=superpowers-bridge
git clone https://github.com/JiangWay/openspec-schemas /tmp/oss
cp -R /tmp/oss/$BRIDGE ~/your-project/openspec/schemas/$BRIDGE
rm -rf /tmp/oss
cd ~/your-project
openspec schema validate $BRIDGE
openspec schemas
```

需要 Superpowers 的 bridge:

```bash
claude plugin install superpowers@claude-plugins-official
```

## 驗證

安裝後,在你專案根目錄跑:

```bash
openspec schemas       # 應該列出新 schema 並標 "(project)"
openspec schema validate <bridge-name>  # 應該印出 ✓ valid
```

對某個 change 用新 schema:

```bash
/opsx:new my-feature --schema <bridge-name>
```
