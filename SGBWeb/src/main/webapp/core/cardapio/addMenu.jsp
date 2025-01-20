<!DOCTYPE html>
<html lang="pt-BR">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Adicionar Cardápio</title>
    <link rel="stylesheet" type="text/css" href="stylesAddMenu.css"> <!-- Link para o arquivo CSS -->
</head>

<body>
    <h1>Adicionar Cardápio</h1>
    <form action="adicionarCardapio" method="post">
        <input type="text" name="diaDaSemana" placeholder="Dia da Semana" required>
        <input type="text" name="guarnicao" placeholder="Guarnição" required>
        <input type="text" name="proteina" placeholder="Proteína" required>
        <input type="text" name="salada" placeholder="Salada" required>
        <input type="text" name="fruta" placeholder="Fruta" required>
        <input type="text" name="opcaoVegetariana" placeholder="Opção Vegetariana" required>
        <button type="submit">Adicionar</button>
    </form>
</body>

</html>