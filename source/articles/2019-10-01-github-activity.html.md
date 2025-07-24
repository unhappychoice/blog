---
title: My Github activity in 2019 / 09
tags: github,programming
description: "Repository 大量生産の巻"
---

Repository 大量生産の巻

READMORE

## Comment

なんやかんや色々作った。Ruby しか書いてない。
いまさらだが諸言語に比べて

- 書きやすい
- 動かしやすい
- 静的な型解析なくてもテスト書けば良い
  - 実際問題、 `静的解析/コンパイル時間` と `テスト書く/実行` の総和比べてどっちが早いかって言うと普通に微妙な所だと思う
  - テストは型合ってても書く必要あるし
  
ので、まだまだ実用性高いと感じている。この辺の認識についてはいつかまとめて書きたい気もするが、その日は来るのであろうか (反語)。

### いらすとや周り
- [コアのロジックライブラリ](https://github.com/unhappychoice/irasutoya) 
- [CLI インターフェース](https://github.com/unhappychoice/irasutoya-cli)
- [lita インターフェース](https://github.com/unhappychoice/lita-irasutoya)

で、3つレポジトリ作った。ついでに CLI で画像表示したいと思いその方法調べると、そのような gem がなかったので[作った](https://github.com/unhappychoice/terminal_image)。

### circleci-cli

メンテ活動 & リネーム & [RubyFlow](http://www.rubyflow.com) で宣伝した。
宣伝したらちょっとだけ Star 増えたかつ、 PR もらったりしたので最近各所で見る [AllContributors](https://github.com/all-contributors/all-contributors) 入れたりなども。
あと GitHub Action入れてみたり。

### その他
#### starship/starship
[Qiitaの記事](https://qiita.com/unhappychoice/items/3b774310d95e2124eb77) 書いたりした関係でドキュメントの翻訳をちょっとやった。インストール楽なのはいいプロダクトですね。

- https://github.com/starship/starship/pull/333

####  freeCodeCamp/freeCodeCamp
ローカライズPRを送る人生。

- https://github.com/freeCodeCamp/freeCodeCamp/pull/36767
- https://github.com/freeCodeCamp/freeCodeCamp/pull/36772

### crisp-im/ruby-crips-api
Intercom やら Freshchat ではなく Crisp が機能的にいい感じで使い始めたので。 

- https://github.com/crisp-im/ruby-crisp-api/pull/6
 
## Activity

### [unhappychoice/circleci-cli](https://github.com/unhappychoice/circleci-cli)
##### 📁 Pull requests

- [Branch parameter to watch command](https://github.com/unhappychoice/circleci-cli/pull/38) (09/29)
- [All contributors](https://github.com/unhappychoice/circleci-cli/pull/36) (09/29)
- [:+1: Create GitHub action config file](https://github.com/unhappychoice/circleci-cli/pull/33) (09/24)
- [Changelog](https://github.com/unhappychoice/circleci-cli/pull/32) (09/24)
- [Fix title label light black color to white to make more readable](https://github.com/unhappychoice/circleci-cli/pull/31) (09/24)
- [Last failed option](https://github.com/unhappychoice/circleci-cli/pull/29) (09/24)
- [:+1: Add last option to build command](https://github.com/unhappychoice/circleci-cli/pull/28) (09/24)
- [Reimplement watch command to watch project](https://github.com/unhappychoice/circleci-cli/pull/27) (09/23)

##### 🎉 Releases

- [v2.2.0](https://github.com/unhappychoice/circleci-cli/releases/tag/v2.2.0) (09/29)
- [v2.1.0](https://github.com/unhappychoice/circleci-cli/releases/tag/v2.1.0) (09/24)
- [v2.0.0](https://github.com/unhappychoice/circleci-cli/releases/tag/v2.0.0) (09/23)

### [unhappychoice/irasutoya](https://github.com/unhappychoice/irasutoya)
##### 📁 Pull requests

- [:+1: Add GitHub action file](https://github.com/unhappychoice/irasutoya/pull/15) (09/24)

### [unhappychoice/irasutoya-cli](https://github.com/unhappychoice/irasutoya-cli)

- 🎉 Created repository (09/16)

### [unhappychoice/lita-aws-cloudfront](https://github.com/unhappychoice/lita-aws-cloudfront)

- 🎉 Created repository (09/03)

### [unhappychoice/lita-irasutoya](https://github.com/unhappychoice/lita-irasutoya)
##### 📁 Pull requests

- [CircleCI](https://github.com/unhappychoice/lita-irasutoya/pull/14) (09/26)
- [Guard](https://github.com/unhappychoice/lita-irasutoya/pull/13) (09/26)
- [Rubocop](https://github.com/unhappychoice/lita-irasutoya/pull/12) (09/26)

### [unhappychoice/terminal_image](https://github.com/unhappychoice/terminal_image)

- 🎉 Created repository (09/16)
