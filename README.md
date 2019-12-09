# Python 開発環境
## 環境詳細
- Python : 3.7
- Spark : 2.4.4
- Hadoop : 2.7

※変更したい場合はDockerfileの上部を確認

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
3. `dist` フォルダ内に.whlファイルが作成される

## Unit Test実行
TODO

## 注意
- spark起動時にWARNINGが出力される
```
WARN NativeCodeLoader: Unable to load native-hadoop library for your platform... using builtin-java classes where applicable
Using Spark's default log4j profile: org/apache/spark/log4j-defaults.properties
Setting default log level to "WARN".
To adjust logging level use sc.setLogLevel(newLevel). For SparkR, use setLogLevel(newLevel).
```
