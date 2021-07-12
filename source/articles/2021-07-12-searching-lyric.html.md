---
title: iOSのショートカットで１タップ歌詞検索
tags: tips 
---

歳のせいか（？）新しい曲覚えたりが少し億劫になってきた感があり、極限まで手間を減らすために、iOSで1タップで歌詞検索できるようにしてみた。

READMORE

### 事前準備

- Shazam アプリをダウンロードしておく

### 仕組み

iOSにはショートカットというデフォルトのアプリがあり、軽い自動化が組めるので、それを利用して

- Shazam で流れている曲のアーティストと曲名を取得
- Google で　`アーティスト 曲名 歌詞` を検索する
- Google のスニペットで歌詞が表示される

というのをホームアイコンを１タップするだけで実行できるようにする。

### 設定作業

ショートカットアプリを開き、新規作成からなんやかんやで↓のようにする。

[<img src="/images/2021-07-12-searching-lyric/1.jpg" alt="1.jpg" style="height: 500px; border-radius: 0;">](/images/2021-07-12-searching-lyric/1.jpg)

ポイントは、Shazam から渡す文字列を `名前 歌詞` にすることで、あとにも言及するが `歌詞` というワードを追加すると1タップ操作が必要なくなる。
わかりにくいがキーボードのようなアイコンから `歌詞` を手入力で追加できる。

[<img src="/images/2021-07-12-searching-lyric/2.jpg" alt="2.jpg" style="height: 500px; border-radius: 0;">](/images/2021-07-12-searching-lyric/2.jpg)

あとは、`…` アイコンからホーム画面に追加して完成

[<img src="/images/2021-07-12-searching-lyric/3.jpg" alt="3.jpg" style="height: 500px; border-radius: 0;">](/images/2021-07-12-searching-lyric/3.jpg)

[<img src="/images/2021-07-12-searching-lyric/4.jpg" alt="4.jpg" style="height: 500px; border-radius: 0;">](/images/2021-07-12-searching-lyric/4.jpg)

### 検索結果

[<img src="/images/2021-07-12-searching-lyric/5.jpg" alt="5.jpg" style="height: 500px; border-radius: 0;">](/images/2021-07-12-searching-lyric/5.jpg)

こんな感じで表示される。
設定作業にあった `歌詞` というワードをわざわざ追加しておくと、 Google のスニペットの歌詞のタブが自動で開かれた状態になる。
（じゃないと概要のタブが開かれた状態で１タップ必要になる）

多分マイナーな曲だったりは Shazam だったり Google のスニペットが対応していないかもしれないが、たいてい大丈夫なはず。
