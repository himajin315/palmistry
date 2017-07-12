# language: ja
フィーチャ: 太陽丘の特徴を選択したら、それに沿った鑑定結果を出すようにしたい
  ユーザーが自分自身の手相を選択した時に、それに沿った鑑定結果を出したい。
  なぜなら、ユーザーは自分自身の手相の鑑定結果を知りたいからだら。

  背景:
    前提 手相鑑定のトップページを表示する
    かつ unameに'himajin315'と入力する

  シナリオ: 先が左側に向いているを選択した時、その特徴通りの結果が見ることができる
    もし 先が左側に向いているを選択する
    かつ 鑑定結果をクリックする
    ならば 'himajin315 さんは地道な努力で出世するタイプです。'と表示されている

  シナリオ: 中央に向かってるを選択した時、その特徴通りの結果が見ることができる
    もし 中央に向かってるを選択する
    かつ 鑑定結果をクリックする
    ならば 'himajin315 さんは才能を活かして出世するタイプです。'と表示されている

  シナリオ: ほとんど見えないを選択した時、その特徴通りの結果が見ることができる
    もし ほとんど見えないを選択する
    かつ 鑑定結果をクリックする
    ならば 'ただ、himajin315 さんは現在才能を活かしきれていません。'と表示されている

  シナリオ: 小指と薬指の間と中指と人差し指の間を選択した時、その特徴通りの結果が見ることができる
    もし '小指と薬指の間と中指と人差し指の間'を選択する
    かつ 鑑定結果をクリックする
    ならば 'himajin315 さんは魅力的な人でもあります。'と表示されている
