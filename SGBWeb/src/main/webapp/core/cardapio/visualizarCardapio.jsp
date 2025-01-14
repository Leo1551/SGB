<%-- 
    Document   : visualizarCardapio
    Created on : 13 de jan. de 2025, 07:58:15
    Author     : arthu
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>SGRU - Cardápio</title>
    <%@include file="../css.jsp"%>

    <script src="${pageContext.request.contextPath}/js/visualizarCardapio.js"></script>
</head>
<body>
     <%@include file="../header.jsp" %>
    <div class="container">
        <header class="header">
            <h1>Cardápio</h1>
        </header>

        <section class="search-filter">
            <input type="text" id="search" placeholder="Pesquisar alimentos..." onkeyup="filterCategory()" aria-label="Pesquisar alimentos">
        </section>

        <div id="noResults" class="no-results" style="display: none;">O alimento digitado não consta no cardápio.</div>

        <table>
            <thead>
                <tr>
                    <th scope="col">Semana do dia dd/mm - dd/mm</th>
                    <th scope="col">Guarnição</th>
                    <th scope="col">Proteínas</th>
                    <th scope="col">Saladas</th>
                    <th scope="col">Frutas</th>
                    <th scope="col">Opção Vegetariana</th>
                </tr>
            </thead>
            <tbody id="menuTable">
                <tr>
                    <td>Segunda-feira</td>
                    <td>Arroz</td>
                    <td>Frango grelhado</td>
                    <td>Salada de alface</td>
                    <td>Maçã</td>
                    <td>Quibe de abóbora</td>
                </tr>
                <tr>
                    <td>Terça-feira</td>
                    <td>Purê de batata</td>
                    <td>Car ne moída</td>
                    <td>Salada de tomate</td>
                    <td>Banana</td>
                    <td>Estrogonofe de cogumelos</td>
                </tr>
                <tr>
                    <td>Quarta-feira</td>
                    <td>Macarrão</td>
                    <td>Peixe assado</td>
                    <td>Salada de cenoura</td>
                    <td>Laranja</td>
                    <td>Hambúrguer de lentilha</td>
                </tr>
                <tr>
                    <td>Quinta-feira</td>
                    <td>Arroz integral</td>
                    <td>Frango ao curry</td>
                    <td>Salada de rúcula</td>
                    <td>Abacaxi</td>
                    <td>Tofu grelhado</td>
                </tr>
                <tr>
                    <td>Sexta-feira</td>
                    <td>Quinoa</td>
                    <td>Carne de porco assada</td>
                    <td>Salada de beterraba</td>
                    <td>Manga</td>
                    <td>Risoto de cogumelos</td>
                </tr>
            </tbody>
        </table>
    </div>

    <%@include file="../footer.jsp" %>
</body>
</html>