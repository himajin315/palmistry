# encoding: utf-8
# language: ja

@common
機能: hoge機能
  hoge機能のテストを行っています。
  hoge、fugaの両パターンにてテストしてます。

  背景:
    前提 PCを利用している

  シナリオ: topを訪問しhogehogeすると成功
    もし topを訪問
    かつ hogehogeボタンをクリック
    ならば hoge成功

  シナリオ: topを訪問しhogehogeすると成功
    もし helpを訪問
    かつ fugafugaをフォームに入力
    ならば hoge成功
