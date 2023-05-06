# 各プレイヤークラスの基本的な機能を搭載したベースクラス
# 手札の保持とカードを引く機能を搭載
class BasePlayer
  attr_reader :hand

  # 手札の配列を作成
  def initialize
    @hand = []
  end

  # カードを山札から引いて手札に格納する
  def get_card(card)
    hand << card.deck.shuffle!.first
    card.deck.shift
    hand
  end
end
