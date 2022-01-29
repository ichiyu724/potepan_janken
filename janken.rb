def janken
  jankens = ["グー", "チョキ", "パー"]
  
  puts "じゃんけん..."
  puts "1(グー)2(チョキ)3(パー)4(戦わない)"

  $player_hand = gets.chomp.to_i
  
  if $player_hand == 4
    puts "ゲームを終了します"
    return true
  end
  if $player_hand > 4 || $player_hand < 1
    puts "エラー：正しい数値を入力してください"
    return true
  end
  $player_hand -= 1 
  program_hand = rand(0..2)
  if $player_hand == 0 || $player_hand == 1 || $player_hand == 2 
    puts "ポイ！"
    puts "あなた：" + jankens[$player_hand] + "を出しました"
    puts "相手：" + jankens[program_hand] + "を出しました"
    
    puts "--------------"
    while $player_hand == program_hand
      puts "あいこで..."
      puts "1(グー)2(チョキ)3(パー)4(戦わない)"
      $player_hand += 1
      $player_hand = gets.chomp.to_i
      if $player_hand == 4
        puts "ゲームを終了します"
        return true
      elsif $player_hand > 4 || $player_hand < 1
        puts "エラー：正しい数値を入力してください"
        return true
      else
        $player_hand -= 1
        program_hand = rand(0..2)
        puts "しょっ！"
        puts "あなた：" + jankens[$player_hand] + "を出しました"
        puts "相手：" + jankens[program_hand] + "を出しました"
      
        puts "--------------"
      end
    end
    if ($player_hand == 0 && program_hand == 1) || ($player_hand == 1 && program_hand == 2) || ($player_hand == 2 && program_hand == 0)
      puts "勝ち"
      puts "指の方向を選んでください"
      puts "--------------"
      $janken_result = "win"
      $player_hand += 1
    elsif ($player_hand == 0 && program_hand == 2) || ($player_hand == 1 && program_hand == 0) || ($player_hand == 2 && program_hand == 1)
      puts "負け"
      puts "顔の方向を選んでください"
      puts "--------------"
      $janken_result = "lose"
      $player_hand += 1
    end
  end
end

def achimuite
  
  case_pattern = ""  
  achimuites = ["上","右","下","左"]
  
  if $janken_result == "win"
    case_pattern = "player_turn"
  elsif $janken_result == "lose"
    case_pattern = "program_turn"
  end
  
  case case_pattern
  when "player_turn"
    puts "あっちむいて..."
    puts "1(上)2(右)3(下)4(左)"
      
      player_hoi = gets.chomp.to_i
      if player_hoi > 4 || player_hoi < 1
        puts "エラー：正しい数値を入力してください"
        return true
      else
        player_hoi -= 1
        program_hoi = rand(0..3)
        puts "ほい！"
        
        puts "あなたの指：" + achimuites[player_hoi] 
        puts "相手の顔：" + achimuites[program_hoi]
        puts "--------------"
        if player_hoi == program_hoi
          puts "あなたの勝ち！"
          $hoi_result = "win"
        else
          $hoi_result = "draw"
          player_hoi += 1
        end
      end
  when "program_turn"
    puts "あっちむいて..."
    puts "1(上)2(右)3(下)4(左)"
      
      player_hoi= gets.chomp.to_i
      if player_hoi > 4 || player_hoi < 1
        puts "エラー：正しい数値を入力してください"
        return true
      else
        player_hoi -= 1
        program_hoi = rand(0..3)
        puts "ほい！"
        
        puts "あなたの顔：" + achimuites[player_hoi] 
        puts "相手の指：" + achimuites[program_hoi]
        puts "--------------"
        if player_hoi == program_hoi
          puts "あなたの負け..."
          $hoi_result = "lose"
        else
          $hoi_result = "draw"
          player_hoi += 1
        end
      end
  end
end

janken
achimuite
while $hoi_result == "draw"
  janken
  if $player_hand == 4
    return true
  elsif $player_hand > 4 || $player_hand < 1
    return true
  end  
  achimuite
end
