--- 1: Buscar o nome e ano dos filmes

SELECT Nome, 
       Ano 
FROM Filmes

--- 2: Buscar o nome e ano dos filmes, ordenados por ordem crescente pelo ano

SELECT Nome, 
       Ano 
FROM Filmes
ORDER BY Ano ASC

--- 3: Buscar pelo filme de volta para o futuro, trazendo o nome, ano e a duração

SELECT Nome, 
       Ano,
       Duracao
FROM Filmes
WHERE Nome = 'De Volta para o Futuro'

--- 4: Buscar os filmes lançados em 1997
SELECT * 
FROM Filmes
WHERE Ano = 1997


--- 5: Buscar os filmes lançados APÓS o ano 2000
SELECT *
FROM Filmes
WHERE Ano > 2000


--- 6: Buscar os filmes com a duracao maior que 100 e menor que 150, ordenando pela duracao em ordem crescente
SELECT * 
FROM Filmes 
WHERE Duracao > 100
AND Duracao < 150
ORDER BY 4

--- 7: Buscar a quantidade de filmes lançadas no ano, agrupando por ano, ordenando pela duracao em ordem decrescente

SELECT Ano, 
       COUNT(*) AS QunatidadeFilmePorAno,
       MAX(Duracao) AS MaiorDuracao
FROM Filmes
GROUP BY Ano 
ORDER BY MaiorDuracao DESC

--- 8: Buscar os Atores do gênero masculino, retornando o PrimeiroNome, UltimoNome
SELECT PrimeiroNome,
       UltimoNome
FROM Atores
WHERE Genero = 'M'

--- 9: Buscar os Atores do gênero feminino, retornando o PrimeiroNome, UltimoNome, e ordenando pelo PrimeiroNome
SELECT PrimeiroNome,
       UltimoNome
FROM Atores
WHERE Genero = 'F'
ORDER BY PrimeiroNome

--- 10: Buscar o nome do filme e o gênero
SELECT F.Nome, 
       STRING_AGG(G.Genero, ', ') AS Generos 
FROM Filmes F
INNER JOIN FilmesGenero FG ON F.Id = FG.IdFilme
INNER JOIN Generos G ON G.Id = FG.IdGenero
GROUP BY F.Nome

--- 11: Buscar o nome do filme e o gênero do tipo "Mistério"
SELECT 
    F.Nome,
    G.Genero
FROM Filmes F
INNER JOIN FilmesGenero FG ON F.Id = FG.IdFilme
INNER JOIN Generos G ON G.Id = FG.IdGenero
WHERE G.Genero = 'Mistério'

--- 12: Buscar o nome do filme e os atores, trazendo o PrimeiroNome, UltimoNome e seu Papel
SELECT 
    F.Nome, 
    A.PrimeiroNome,
    A.UltimoNome,
    EF.Papel
FROM Filmes F
INNER JOIN ElencoFilme EF ON F.Id = EF.IdFilme
INNER JOIN Atores A ON A.Id = EF.IdAtor
