---
title: 知っていること / 知らないこと - コンピュータサイエンス
tags: what_i_know
---

コンピュータサイエンス周りのトピックについて

READMORE

大学 (卒業はしていない) では電子工学科だったため、全般的に得意という意識があまりない。
分野は [計算機科学 - Wikipedia](https://ja.wikipedia.org/wiki/計算機科学) を参考に、一部は数学のページへ。

## 基礎
### 情報理論
大学で少しやった気がする。エントロピーやシャノンの符号化定理等、一度理解はした気がするが、今説明せよと言われたら無理な程度。
様々な圧縮アルゴリズムや、無線通信のベースになっていることは知っている。

### 計算理論
#### 計算可能性 / 複雑性

計算量の `O(n)` 表記はわかっていると思う。とはいっても実用上はループを何度回るかくらいにしか着目していない。
そもそも実用上はIO処理をどうするかがボトルネックになるパターンが多いので、並列 / 非同期処理を考えることのほうが多い気がする。
複雑性クラスに関しては、P≠NP予想がミレニアム懸賞問題にあることとその概要以外全然知らない。

#### チューリングマシン
チューリングマシンやオートマトンに関しては存在は知っているにしても、理論的に理解しているとは言い難い。
チューリング完全かどうかの判定もできない。

#### ラムダ計算
[アンダースタンディングコンピューテーション](https://www.amazon.co.jp/アンダースタンディング-コンピュテーション-―単純な機械から不可能なプログラムまで-Tom-Stuart/dp/487311697X) 等を読んでちょっとわかったつもりになっている。
データ自体やその構造もこれで表現できることや、再帰はYコンビネーターを利用することを知っている。が、1から説明せよと言われると難しい。
LISPを実装すれば体で理解できると思っているが、実装したことはない。

#### アルゴリズム解析
そういう研究分野があることをいま知った。全然知らない。

### データ構造
各種リスト、ハッシュ、セットや木は知っている。実装せよと言われると危ういかもしれない。
InnoDB の Index は B-tree だということや、Javaにはデフォルトで様々なコレクションが用意されていることを知っている。
が、計算量と同様に普段着目するかというとそうでもなく、各言語で用意されてる実装をそのまま利用している。

### 形式言語 / プログラム意味論
全然知らない。

### 数値解析
数値解析の基本的なアルゴリズムは大学でやったように思う。ググらないと実装はできない。

### 最適化問題
あまり知らない。巡回セールスマンやナップサック問題があって様々なアルゴリズムがあるくらいの認識。



## 実装
### コンパイラ / インタプリタ
自分で実装したことはない。一般的なコンパイラが何をしているかについては理解していると思う。
Ruby / Swift / Scala / Kotlin / Go 辺りのソースは眺めたことはあるが、本当に眺めた程度。


### 分散コンピューティング
理論的なところは全然知らない。実務でやったこともない。

### 並列 / 並行コンピューティング
理論的なところは全然知らないと思う。アムダールの法則は知っている。
実装に近いところで言えば、プロセス / スレッド / ファイバー のモデルは知っていると思う。と同時に、ロックの概念も一通り知っていると思う。
が、実際に実装で問題を起こさないかとは別ではある。
使ったことのあるフレームワークや言語に関しては、それがどのような実装なのかをなんとなく理解していると思っている。

### ソフトウェア工学
#### 開発方法
ウォーターフォール / アジャイル / DDD / TDD 等の関連の書籍は何冊か読んだ。
どれが良いというわけではなく、組織やソフトウェアの要件に関してはそれぞれのプラクティスの要素を最適に組み合わせることで、最善になると思っている。

### コンピュータ・アーキテクチャ
#### ハードウェア
[知っていること / 知らないこと - ハードウェア](/2019/05/25/what-i-know-hardware.html) へ

#### オペレーティングシステム
Win / Mac / Ubuntu / CentOS 辺りは実際に使ったことがある / 一通りアプリケーション作るために必要な操作はできるといえる。
Winに関しては内部構造全然知らずに使っていると思う。Unix / Linux に関しては構成要素や設計は一通り理解しているつもり。
システムコールやAPIに関しては実用上必要なときに調べて利用する程度。


### ネットワーク
[ネットワークはなぜつながるのか](https://www.amazon.co.jp/ネットワークはなぜつながるのか-第2版-知っておきたいTCP-IP、LAN、光ファイバの基礎知識-戸根/dp/4822283119) 読んだかつプラスアルファの知識くらい。
OSI参照モデルのトランスポート層より下は多分全然わかってない。
TCP/IP の主要なプロトコルは大体知っている、使ったことがある。トラブルが発生した際に `ping` や `ifconfig` `traceroute` 等して原因を調べることはできるはず。  

### 暗号理論
公開鍵方式、特にRSAに関していえば知っているといえる。その他の理論の部分は全然知らない。
単純な置換によるものは頻度分析で解けることや、エニグマ周りの歴史的経緯等は聞いた/見たことがある。

### データベース
実務の経験から、ACID特性やトランザクション、悲観 / 楽観ロックの概念は知っているかつ利用したことがある。
リレーショナルデータベースに関しては各種正規系や主キー / 外部キーに関して理解していると思う。
その他実装面だと、MySQL / Postgres / SQLite / Redis / DynamoDB / Redshift 辺りは実務で触っているので大まかな特性はだいたい理解していると思う。

### コンピュータグラフィックス
大学在籍中は一応画像処理の研究室だったので、一通りのトピックに関して調べて理解した気がする。
Minecraft 等の影響で shader 技術だったりも自分で調べたりはしていた。が、あまりアウトプットしていたわけじゃないので、実力はないに等しい。

### 機械学習 / データマイニング
使われてる単語は一通りググって理解していると思う。ディープラーニングが出てきたのが大学在籍中であったと思い、当時論文も何本か読んだと思うが覚えているかというとそうではないのはもちろんである。
求める出力に対して pros/cons ある様々な手法が存在するというか、人間の主観によりがちな俗っぽい分野だと思っていて、そもそもあまり好きではないかもしれない。
特に今は過渡期だと思っていて、体系だってきてからしっかり学びたいとは思っている (願望) 。
