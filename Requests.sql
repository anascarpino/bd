#Quem comprou ingressos para o evento de Maratona de Filmes Saga Senhor dos Anéis
SELECT nome FROM usuario WHERE id_usuario IN
		(SELECT id_usuario FROM compra WHERE id_compra IN 
					(SELECT id_compra FROM ingresso WHERE id_evento IN (
							SELECT id_evento FROM evento WHERE descricao = "Maratona de Filmes Saga Senhor dos Anéis")));

#Quem comprou ingressos para assistir o filme Planeta dos Macacos e à peça Hermanoteu Na Terra de Godah (TODO: AJUSTAR ESSE AQUI)
SELECT nome FROM usuario WHERE id_usuario IN
		(SELECT id_usuario FROM compra WHERE id_compra IN 
					(SELECT id_compra FROM ingresso WHERE id_evento IN (
							SELECT id_evento FROM evento WHERE id_evento IN(
								SELECT id_evento FROM filme WHERE nome = "Planeta dos Macacos: A Guerra")))AND
					(SELECT id_compra FROM ingresso WHERE id_evento IN(
							SELECT id_evento FROM evento WHERE id_evento IN(
								SELECT id_evento FROM peca WHERE nome = "Hermanoteu na Tingressoingressoerra de Godah"))));
                                
#Quais são os eventos que tiveram ingressos vendidos < 3
SELECT descricao FROM evento WHERE 
				(SELECT COUNT(*) FROM ingresso WHERE id_evento = evento.id_evento) < 3;

#Quem comprou ingressos estando autenticado em ordem alfabética
SELECT nome FROM  usuario JOIN autenticacao ON usuario.id_usuario = autenticacao.id_usuario ORDER BY nome ASC;

#Quem foram as pessoas que compraram ingressos para o show da Anitta?
SELECT usuario.nome FROM usuario 
		JOIN compra ON usuario.id_usuario = compra.id_usuario 
        JOIN ingresso ON compra.id_compra = ingresso.id_compra
        JOIN evento ON ingresso.id_evento = evento.id_evento 
        JOIN `show` ON `show`.id_evento = evento.id_evento 
				WHERE `show`.artista = 'Anitta';
                
#Quando foram comprados os ingressos para a estreia do filme A Múmia por ordem de compra
SELECT dCompra FROM compra WHERE id_compra IN
		(SELECT id_compra FROM ingresso WHERE id_evento IN
				(SELECT id_evento FROM evento WHERE descricao = "Estréia filme A Múmia")) ORDER BY dCompra ASC;

#Selecionar os ingressos vendidos para eventos que sejam do tipo peça
SELECT * FROM ingresso WHERE id_evento IN
		(SELECT id_evento FROM evento WHERE id_tipo IN
				(SELECT id_tipo FROM tipo WHERE nome = "peça"));

#Quantos ingressos Celso comprou
SELECT COUNT(*) FROM ingresso WHERE id_compra IN
		(SELECT id_compra FROM compra WHERE id_usuario IN 
				(SELECT id_usuario FROM usuario WHERE nome = "Celso Celante"));
                

#Quais foram os usuarios que pagaram em média mais que 40 reais e qual foi a média de consumo deles
SELECT nome, usuario.id_usuario, AVG(valor_total) FROM compra JOIN usuario ON compra.id_usuario =  usuario.id_usuario 
		GROUP BY id_usuario HAVING AVG(valor_total) > 40 ORDER BY AVG(valor_total) DESC;

#Todos os usuarios com o valor de suas compras (quem tiver) ordenado pelo nome do usuario
SELECT nome, valor_total FROM usuario LEFT JOIN compra ON usuario.id_usuario = compra.id_usuario ORDER BY nome;

#Todos os usuários e os e-mails
SELECT nome, email, login FROM usuario LEFT JOIN autenticacao ON usuario.id_usuario = autenticacao.id_usuario;

#Nome e e-mail de quem fez compras que totalizaram mais de 100 reais
SELECT nome, email FROM usuario WHERE EXISTS 
		(SELECT * FROM compra WHERE 
				usuario.id_usuario = compra.id_usuario AND 
                valor_total > 100);

#As datas de todos os jogos do Flamengo de qualquer esporte
SELECT dataEvento FROM evento WHERE EXISTS
		(SELECT * FROM esporte WHERE
				evento.id_evento = esporte.id_evento AND
                (equipe1 = "Flamengo" OR equipe2 = "Flamengo"));
                
#Quais os três evento tiveram a maior quantidade de ingressos vendidos
SELECT descricao, SUM(quantidade) FROM evento 
		JOIN ingresso ON evento.id_evento = ingresso.id_evento 
        JOIN compra ON ingresso.id_compra = compra.id_compra 
			GROUP BY evento.id_evento
            ORDER BY SUM(quantidade) DESC
            LIMIT 3;
            
#Quais pessoas compraram ingresso para jogos de basquete
SELECT DISTINCT nome FROM usuario WHERE id_usuario IN
		(SELECT id_usuario FROM compra WHERE id_compra IN
				(SELECT id_compra FROM ingresso WHERE id_evento IN
						(SELECT id_evento FROM evento WHERE id_evento IN
								(SELECT id_evento FROM esporte WHERE nome = "Basquete"))));