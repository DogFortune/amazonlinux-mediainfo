# THIS REPOGITORY IS ARCHIVED
公式からAWS Lambda用のバイナリが公開されております。  
[リンク](https://mediaarea.net/en/MediaInfo/Download/Lambda)  
このリポジトリは役目を終えたのでアーカイブします。

# Amazonlinux-Mediainfo

https://hub.docker.com/r/dogfortune/amazonlinux-mediainfo

Amazonlinux上でMediainfoをコンパイルする為のDockerイメージです。
Lambda内でMediainfoを動かしたい場合は、Amazonlinux上でコンパイルする必要がありますが、いちいちEC2を使ってコンパイルするのは面倒なので、環境の統一の為に作成しました。

`--with-libcurl`を付与してコンパイルしていますので、Presign URLによるメタデータ取得にも対応しています。

## Lambdaに埋め込んで使うには？
/usr/local/binの中にmediainfoのバイナリがありますので、それをホストマシンにコピーして取り出して下さい。
ホストマシン上でmediainfoに対して実行権限を与えた後、Lambdaスクリプトと一緒にzipで固めてデプロイすれば完了です。
