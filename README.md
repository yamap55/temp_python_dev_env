# Python 開発環境
## 開発環境
### 事前準備
- Dockerインストール
- VSCodeインストール
- VSCodeの拡張機能「Remote - Containers」インストール
    - https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-containers
- 本リポジトリのclone

### 開発手順
1. VSCode起動
2. 左下の緑色のアイコンクリック
3. 「Remote-Containers - Open Folder in Container...」クリック
4. しばらく待つ
    - 初回の場合コンテナimageの取得や作成が行われる
5. 起動したら開発可能

## ライブラリ作成手順
1. 開発環境起動
2. 下記コマンド実行
    - `python setup.py bdist_wheel`
3. `dist` フォルダ内に.whlファイルが作成されています。

