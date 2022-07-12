def desenha_forca(erros)
	cabeca = "   "
	corpo = " "
	pernas = "   "
	bracos = "   "
	if erros >= 1
		cabeca = "(_)"
	end
	if erros >= 2
		bracos = " | "
		corpo = "|"
	end
	if erros >= 3
		bracos = "\\|/"
	end
	if erros >= 4
		pernas = "/ \\"
	end

	puts "  _______       "
	puts " |/      |      "
	puts " |      #{cabeca}  "
	puts " |      #{bracos}  "
	puts " |       #{corpo}     "
	puts " |      #{pernas}   "
	puts " |              "
	puts "_|___           "
	puts 
 
end

def avisa_escolhendo_secret
    puts "Escolhendo uma palavra secreta..."
end

def avisa_secret(secret)
    puts "Palavra secreta com #{secret.size} letras..... boa sorte!"
end

def avisa_already_chute
    puts "Você já chutou #{chute}"
end

def avisa_letra_notFound
    puts "Letra não encontrada"
end

def avisa_letra_found(cont)
    puts "Letra encontrada #{cont} vezes!"
end

def avisa_acerto
    puts "\nParabéns, você ganhou!"
		puts
 
		puts "       ___________      "
		puts "      '._==_==_=_.'     "
		puts "      .-\\:      /-.    "
		puts "     | (|:.     |) |    "
		puts "      '-|:.     |-'     "
		puts "        \\::.    /      "
		puts "         '::. .'        "
		puts "           ) (          "
		puts "         _.' '._        "
		puts "        '-------'       "
		puts
end

def avisa_erro
    puts "Ops, errou"
end

def avisa_pontos(points_for_now)
    puts "Você ganhou #{points_for_now} pontos."
end

def avisa_pontos_totais(pontos_totais)
    puts "Você possui #{pontos_totais} pontos."
end

def avisa_campeao_atual(dados)
    puts "Nosso campeão atual é #{dados[0]} com #{dados[1]} pontos."
end

def welcome
    puts "/****************/"
	puts "/ Jogo de Forca */"
	puts "/****************/"
	puts "Qual é o seu nome?"
	nome = gets.strip
	puts "\n\n\n\n\n\n"
	puts "Começaremos o jogo para você, #{nome}"
	nome
end

def want_to_play?
    puts "Deseja jogar novamente? (S/N)"
    wannaplay = gets.strip
    notwannaplay = wannaplay.upcase == "N"
end

def cabecalho_de_tentativa(chutes, erros, mascara)
    puts "\n\n\n\n"
    desenha_forca(erros)
    puts "Palavra secreta #{mascara}"
    puts "Erros até agora: #{erros}"
    puts "Chutes até agora: #{chutes}"
end

def ask_chute
    puts "Entre com uma letra ou uma palavra"
    chute = gets.strip.downcase
    puts "\nSerá que acertou? Você chutou '#{chute}'"
    chute
end
