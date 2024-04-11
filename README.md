# Docker PHP(composer) Apache PostgreSQL テンプレート例

## 起動方法

```
# どんな環境変数を設定すべきかのテンプレートファイルから、環境変数のファイルを作成
cp env_server.tpl env_server
# docker imageをビルド
make build
# Webサーバを起動
make up
# http://localhost:8080/
```

## サーバにシェルで入る方法

```
make bash
```

## ファイル別の解説

```
.
├── .editorconfig     : さまざまなエディタで共通して使えるフォーマットファイル
├── .gitignore        : .gitで無視するファイル
├── Makefile          : `make up` でデータベースを含めて起動します
├── README.md         : このファイル
├── data
│   ├── postgres      : データベースの実ファイルが保管される
│   └── server        : `server` コンテナの `/data` にマウントされる
├── docker
│   └── server
│       └── Dockerfile: `server` コンテナの基本設定を行う
├── docker-compose.yml: Docker composeの設定を書く
├── env_server        : envfile形式で環境変数を設定する
├── env_server.tpl    : 上記 `env_server` ファイルのテンプレート
└── server
    ├── composer.json : composer用の設定、依存するライブラリを書く
    ├── composer.lock : composer用の設定、composerが作成するし、コミットもする
    ├── app           : 実際のアプリケーションを入れるディレクトリで、 `server` コンテナの `/var/www/html` にマウントされる。
    └── vendor        : composer用のファイル、composerが作成するが、 `.gitignore` に書いてコミットしない
```
