# FROM: イメージを作成する際の元のイメージを指定（オーバーライドみたいな）
# ここでは、latestタグのものを元として、元のレイヤーの上に新しいレイヤーを重ねることでカスタマイズする.
FROM docker/whalesay:latest

# RUN: イメージビルドの際に実行するコマンドを指定
# ここでは，作成するイメージに新しいパッケージをインストール
# fortunes: パッケージ．fortuneコマンドを実行すると，英語の格言が表示される．
# fortunesはubntsuがベースなのでapt-getコマンドを利用
# パッケージリストの更新 + fortunesのインストール
RUN apt-get -y update && apt-get install -y fortunes

# CMD: コンテナが作成された後に実行する命令を指定（ここではfotunesコマンドを実行）
CMD /usr/games/fortune | cowsay
