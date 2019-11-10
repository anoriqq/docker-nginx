## docker-nginx

- nginxのdockerイメージを使えるようになるまで遊ぶ場所

## Memo

- ```zsh
  $ docker run --name hoge -d -p 8080:80 nginx
  ```
  - pullが長い｡多分wslの問題だと思うけど｡
  - 動いたすごい
    - `http://localhost:8080`
  - docker@19.03.1にしたら早くなった
- `docker-compose.yml`を書く

## 参考

- [Docker入門 Nginxを動かしてみる](https://qiita.com/mtakehara21/items/d7be42cf12772f3ada25)

## windowsで証明書を有効にする方法
- ワークスペースルートでコマンド実行
  ```sh
  docker-compose -f ./sandbox/docker-compose.yml
  ```
- windows側の`Users/shota/AppData/Local/mkcert`にrootCAが保存されるので､コントロールパネルの"ユーザー証明書の管理"からインポートする
