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

#Quais foram os eventos para os quais as pessoas não autenticadas compraram ingressos ordenadas por grupos
#(SELECT nome FROM  usuario JOIN autenticacao ON usuario.id_usuario = autenticacao.id_usuario);

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

#Agrupar os usuarios por ID cuja data de nascimento
#SELECT nome FROM usuario GROUP BY id_usuario HAVING dNascimento;

#Quantos ingressos Celso comprou
SELECT COUNT(*) FROM ingresso WHERE id_compra IN
		(SELECT id_compra FROM compra WHERE id_usuario IN 
				(SELECT id_usuario FROM usuario WHERE nome = "Celso Celante"));