require_relative "player"
require_relative "dealer"
require_relative "card"
require_relative "score"

# ブラックジャックのゲームを開始します
# 開始するには game_start メソッドを実行してください
class Blackjack
  attr_reader :player, :dealer, :card, :score

  def initialize
    @player = Player.new
    @dealer = Dealer.new
    @card = Card.new
    @score = Score.new
  end

  # ブラックジャックゲームを開始する
  def game_start
    puts "ブラックジャックを開始します"
    player.get_card(card)
    puts "あなたの引いたカードは#{player.hand[-1][0]}の#{player.hand[-1][1]}です。"
    player.get_card(card)
    puts "あなたの引いたカードは#{player.hand[-1][0]}の#{player.hand[-1][1]}です。"
    dealer.get_card(card)
    puts "ディーラーの引いたカードは#{dealer.hand[-1][0]}の#{dealer.hand[-1][1]}です。"
    dealer.get_card(card)
    puts "ディーラーの引いた2枚目のカードはわかりません。"

    loop do
      puts "あなたの現在の得点は#{score.get_score(player)}です。カードを引きますか？（Y/N）"
      yorn = gets.chomp.upcase
      break if yorn == "N"

      player.get_card(card)
      puts "あなたの引いたカードは#{player.hand[-1][0]}の#{player.hand[-1][1]}です。"
      if score.get_score(player) > 21
        puts "あなたの現在の得点は#{score.get_score(player)}です。"
        puts "21点を超えたのであなたの負けです..."
        return
      end
    end

    puts "ディーラーの引いた2枚目のカードは#{dealer.hand[-1][0]}の#{dealer.hand[-1][1]}でした。"
    puts "ディーラーの現在の得点は#{score.get_score(dealer)}です。"

    loop do
      break if score.get_score(dealer) >= 17

      dealer.get_card(card)
      puts "ディーラーの引いたカードは#{dealer.hand[-1][0]}の#{dealer.hand[-1][1]}です。"
    end

    puts "あなたの得点は#{score.get_score(player)}です。"
    puts "ディーラーの得点は#{score.get_score(dealer)}です。"

    result = score.get_score(player) - score.get_score(dealer)
    if score.get_score(dealer) > 21 || result >= 0
      puts "あなたの勝ちです！"
    else
      puts "残念！あなたの負けです..."
    end
    puts "ブラックジャックを終了します。"
  end
end

blackjack = Blackjack.new
blackjack.game_start
