# Python 開発環境

## 環境詳細

- Python : 3.8
- PostgreSQL :

※変更したい場合は Dockerfile の上部を確認

## 開発環境

### 事前準備

- Docker インストール
- VSCode インストール
- VSCode の拡張機能「Remote - Containers」インストール
  - https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-containers
- 本リポジトリの clone

### 開発手順

1. VSCode 起動
2. 左下の緑色のアイコンクリック
3. 「Remote-Containers - Open Folder in Container...」クリック
4. しばらく待つ
   - 初回の場合コンテナ image の取得や作成が行われる
5. 起動したら開発可能

## ライブラリ作成手順

1. 開発環境起動
2. 下記コマンド実行
   - `python setup.py bdist_wheel`
3. `dist` フォルダ内に.whl ファイルが作成される

## PostgreSQL 接続設定

1. VSCode の左側のバーの PostgreSQL Explor アイコンを選択
2. 右上「+」で設定を開始

   - `/project/docker-compose.yml` の db 部を参考に設定
   - hostname : db
   - user : root
   - password : password-changeme
   - port : 5432
   - ssl connection? : Standard Connection
   - show database : project-db
   - display name : 任意

3. PostgreSQL Explor に設定が表示される
   - `>` をクリックしていくことで各テーブルが確認可能
   - 「右クリック -> New Query」 で Query の実行が可能
