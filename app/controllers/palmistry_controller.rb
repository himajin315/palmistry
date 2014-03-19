class PalmistryController < ApplicationController
  skip_before_filter :verify_authenticity_token ,:only=>[:result]

  def appraisal
  end

  def result
    case params[:love]
    when '0' then
      @love = "hogehoge さんは突発的な恋愛をするタイプです。<br>
      人を好きになるまでが早く、一目惚れタイプです。<br>
      出会ってから付き合うまでに期間が短いタイプです。<br>
      合コンや友達の紹介など出会いの数だけのチャンスを掴み取ることができます。<br>
      ただ、熱しやすく冷めやすい恋愛をします。<br>
      相手のことが嫌になるとすぐに冷めてしまします。<br>
      恋愛の数は多いですが、長く続けるのは難しいです。<br>
      そのため、１年以上続く恋愛はめったにありません。<br>
      長く続けることができる恋愛は運命の人だけです。<br>
      多くの恋愛から運命の人を見つけて下さい。<br>"
    when '1' then
      @love = "hogehoge さんはゆっくり落ち着いた恋愛をします。<br>
      相手を好きになりまでに時間がかかるタイプです。<br>
      好きになると相手のことがとても大事にします。<br>
      愛情が深く、相手のためにいろいろと頑張ることでしょう。<br>
      結婚したらとても良い奥さんになるタイプです。<br>"
    when '2' then
      @love = "hogehoge さんは恋愛には消極的な人です。<br>
      あまり感情を表に出さないタイプなので、好きな人に好きと言えないです。<br>
      そのため、相手に気持ちが伝わりにくいことが多く、すれ違いなどが多いでしょう。<br>
      せっかく両思いでも結果的に付き合わないということもあります。<br>
      チャンスを逃してしまうこともあります。<br>
      恋愛がうまくいくかどうかは相手次第になるでしょう。<br>
      あまり感情を表に出さないので、相手にからすると何を考えているのかわからないこともあります。<br>
      素直になることで恋愛を成功させることができます。<br>
      伝えづらいことは手紙やメールなど文章にして伝えることが良いでしょう。<br>"
    when '3' then
      @love = "hogehoge さんは情が深い人です。<br>"
    when '4' then
      @love = "hogehoge さんは相手の気持ちになれる優しい人です。<br>"
    end

    love_etc = params[:love_etc]
    if love_etc then
      love_etc.keys.each do |select_num|
        case select_num
        when '0' then
          @love_etc_happy = "が<br>"
        when '1' then
          @love_etc_many = "ぎ<br>"
        when '2' then
          @love_etc_slow = "ぐ<br>"
        end
      end
    end
    @life = params[:life]
    case params[:life]
    when '0' then
      @life = "か<br>"
    when '1' then
      @life = "き<br>"
    when '2' then
      @life = "く<br>"
    end

    case params[:life_etc]
    when '0' then
      @life_etc = "さ<br>"
    when '1' then
      @life_etc = "し<br>"
    when '2' then
      @life_etc = "す<br>"
    end

    case params[:brain]
    when '0' then
      @brain = "た<br>"
    when '1' then
      @brain = "ち<br>"
    when '2' then
      @brain = "つ<br>"
    when '3' then
      @brain = "て<br>"
    end
  end

  def profile
  end
end
