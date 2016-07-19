def da_boas_vindas
    puts
    puts "        P  /_\  P                              "
    puts "       /_\_|_|_/_\                             "
    puts "   n_n | ||. .|| | n_n         Bem vindo ao    "
    puts "   |_|_|nnnn nnnn|_|_|     Jogo de Adivinhação!"
    puts "  |' '  |  |_|  |'  ' |                        "
    puts "  |_____| ' _ ' |_____|                        " 
    puts "        \__|_|__/                              "
    puts
    puts "Qual é o seu nome?"
    nome = gets.strip #strip limpa os caracteres em branco
    puts "\n\n\n\n\n\n"
    puts "Começaremos o jogo para você, " + nome
end

def sorteia_numero_secreto(dificuldade)
    case dificuldade
    when 1 
        maximo = 30
    when 2
        maximo = 60
    when 3
        maximo = 100
    when 4
        maximo = 150
    else
        maximo = 200
    end

    puts "Escolhendo um número secreto entre 1 e #{maximo -1}..."
    sorteado = rand(maximo) + 1 #realiza uim randon entre 0 e 200
    puts "Escolhido... que tal adivinhar hoje nosso número secreto?"
    sorteado
end

def pede_um_numero(chutes,tentativa, limite_de_tentativas)
    puts "\n\n\n\n"
    puts "Tentativa #{tentativa} de #{limite_de_tentativas}" 
    puts "Chutes até o momento #{chutes}"
    puts "Entre com o número"
    chute = gets.strip
    puts "Será que acertou? Você chutou #{chute}"
    chute.to_i
end

def verifica_se_acertou(numero_secreto, chute, nome)
    acertou = numero_secreto == chute

    if acertou
        puts "Parabéns #{nome}, você ACERTOU!!!"
        #break  o break tem que ficar no laço for
        ganhou
        return true
    end
    
    maior = numero_secreto > chute
    if maior
        puts "O número secreto é maior!"        
    else
        puts "O número secreto é menor!"            
    end        
    false
end

def pede_dificuldade
    puts "Qual o nível de dificuldade que deseja ? "
    puts "1 - Muito fácil (2) - Fácil (3) - Normal (4) - Difícil (5) - Impossível"
    dificuldade = gets.to_i
end

def joga(nome, dificuldade)    
    numero_secreto = sorteia_numero_secreto dificuldade

    pontos_ate_agora = 1000
    limite_de_tentativas = 5
    chutes = []
    
    for tentativa in 1..limite_de_tentativas
       
        chute = pede_um_numero chutes, tentativa, limite_de_tentativas
        chutes << chute #chutes[chutes.size] = chute
       
        pontos_a_perder = (chute - numero_secreto).abs / 2.0
        pontos_ate_agora -= pontos_a_perder
    
        if verifica_se_acertou numero_secreto, chute, nome
            break
        end    
    end
    
    puts "Você ganhou #{pontos_ate_agora} pontos"
end

def quero_jogar
    puts "Deseja jogar novamente ? (S/N)"
    quero_jogar = gets.strip
    quero_jogar.upcase == "S"
end

def ganhou 
    puts
    puts "             OOOOOOOOOOO               "
    puts "         OOOOOOOOOOOOOOOOOOO           "
    puts "      OOOOOO  OOOOOOOOO  OOOOOO        "
    puts "    OOOOOO      OOOOO      OOOOOO      "
    puts "  OOOOOOOO  #   OOOOO  #   OOOOOOOO    "
    puts " OOOOOOOOOO    OOOOOOO    OOOOOOOOOO   "
    puts "OOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO  "
    puts "OOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO  "
    puts "OOOO  OOOOOOOOOOOOOOOOOOOOOOOOO  OOOO  "
    puts " OOOO  OOOOOOOOOOOOOOOOOOOOOOO  OOOO   "
    puts "  OOOO   OOOOOOOOOOOOOOOOOOOO  OOOO    "
    puts "    OOOOO   OOOOOOOOOOOOOOO   OOOO     "
    puts "      OOOOOO   OOOOOOOOO   OOOOOO      "
    puts "         OOOOOO         OOOOOO         "
    puts "             OOOOOOOOOOOO              "
    puts
    puts "               Acertou!                "
    puts
end

nome = da_boas_vindas
dificuldade = pede_dificuldade

loop do
    joga nome, dificuldade
    if !quero_jogar
        break
    end
end
