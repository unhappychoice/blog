---
title: My Github activity in 2017 / 12
tags: github,programming
---

あけおめことよろ

READMORE

## Comment

12月は仕事関連のコミットが多かった1ヶ月で、OSSとしてはbitFlyerのSPAクライアントをCycle.jsで作ったくらい。

### cycle-flyer

[cycle-flyer](https://cycle-flyer.now.sh)
[<img class="square" src="/images/2018-01-01-github/cycle-flyer.png" 
alt="cycle-flyer"/>](/images/2018-01-01-github/cycle-flyer.png)

公式SPAとの差分としては、

- 損益がちゃんと出る
- 板表示を単位価格ごとにまとめられる
- 全決済ボタンが有る

くらいで、問題点として

- bitFlyer APIがCORS対応してないっぽいので、CORS無効化してブラウザ起動しないと使えない
- PubnubがXHRでリアルタイム通信している関係でリクエストが詰まる時がある
- そもそもPublic APIは公式のSPAで使ってるPrivate 
APIより遅延しているようで、サーバーステータスがBusy以上だとまともに使えない

特殊注文とかもうちょいつけて個人用の取引ツールとして使っていきたい感じ。

### [unhappychoice/cycle-flyer](https://github.com/unhappychoice/cycle-flyer)

- 🎉 Created repository (12/09)






