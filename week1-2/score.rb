require_relative "player"
require_relative "dealer"

# プレイヤー、ディーラークラスの手札の得点を集計する
class Score
  # 各プレイヤーの現在の得点を集計する
  def get_score(player)
    sum = 0
    have_a = nil # 手札にエースがあるか判定するための変数

    # 手札の合計得点を求める
    player.hand.each do |p|
      if p[1] == "A"
        sum += 1
        have_a = true # 手札にエースがあることを判定するためtrueにする
      elsif p[1] == "J" || p[1] == "Q" || p[1] == "K"
        sum += 10
      else
        sum += p[1]
      end
    end

    # エース有かつ手札の合計得点が11点以下なら10点追加(エースを11点としてカウント)
    sum += 10 if have_a && sum <= 11

    sum
  end
end
