require_relative "ui"
require_relative 'rank'


def choose_secret
    avisa_escolhendo_secret
    texto = File.read("dicionario.txt")
    toda_palavra = texto.split "\n"
    random_num = rand(toda_palavra.size)
    secret = toda_palavra[random_num].downcase
    avisa_secret(secret)
    secret
end

def choose_secret_less_memory
    avisa_escolhendo_secret
    arquivo = File.new("dicionario.txt")
    qntd_palavras = arquivo.gets.to_i
    num_chosed = rand(qntd_palavras)
    for linha in 1..(num_chosed-1)
        arquivo.gets
    end
    secret = arquivo.gets.strip.downcase
end

def palavra_mascarada(secret,chutes)
    mascara = ""
    for letra in secret.chars
        if chutes.include? letra
            mascara << letra
        else
            mascara << "_"
        end
    end
    return mascara
end

def pede_um_chute_valido(chutes, erros, mascara)
    cabecalho_de_tentativa(chutes, erros, mascara)
    loop do
        chute = ask_chute
        if chutes.include? chute
            avisa_already_chute(chute)
        else
            return chute
        end
    end
end

def joga(nome)
    secret = choose_secret_less_memory
    erros = 0
    chutes = []
    points_for_now = 0

    while erros < 5
        mascara = palavra_mascarada(secret, chutes)
        chute = pede_um_chute_valido(chutes, erros, mascara)
        chutes << chute

        letra_for = chute.size == 1
        if letra_for
            letra = chute[0]
            cont = secret.count letra
            if cont == 0
                avisa_letra_notFound
                erros += 1
            else
                avisa_letra_found(cont)
            end
        else
            acertou = chute == secret
            if acertou
                avisa_acerto
                points_for_now += 100
                break
            else 
                avisa_erro
                erros += 1
            end
        end
    end
    avisa_pontos(points_for_now)
    points_for_now
end

def jogo_da_forca
    nome = welcome
    pontos_totais = 0

    avisa_campeao_atual(le_rank)

    loop do
        pontos_totais += joga(nome)
        avisa_pontos_totais(pontos_totais)

        if le_rank[1].to_i < pontos_totais
            salva_rank(nome, pontos_totais)
        end    

        break if want_to_play?
    end
end