# 52枚のトランプを管理するクラス
class Card
  attr_reader :deck

  def initialize
    # 52枚のカードを用意する
    numbers = ["A", 2, 3, 4, 5, 6, 7, 8, 9, "J", "Q", "K"]
    # marks = ["ハート", "スペード", "ダイヤ", "クラブ"]
    marks = %w[ハート スペード ダイヤ クラブ]
    @deck = []
    marks.each do |m|
      numbers.each do |n|
        @deck << [m, n]
      end
    end
  end
end
