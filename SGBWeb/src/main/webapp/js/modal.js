/* global pageContext */

function openModal(tipoPagamento) {
    const modal = document.getElementById('myModal');
    const modalTitle = document.getElementById('modal-title');
    const modalContent = document.getElementById('modal-content');


    if (tipoPagamento === "PIX") {
        modalContent.innerHTML = `
            <form action="${pageContext.request.contextPath}/SaldoServlet" method="post">
                <h3>Preencha os dados para pagamento via PIX</h3>
                <label for="chavePix">Insira a chave PIX:</label>
                <input type="text" id="chavePix" name="chavePix" required><br>
                <label for="saldo">Insira o saldo a ser recarregado:</label>
                <input type="number" id="saldo" name="saldo" required><br>
                <button type="submit" name="tipoPagamento" value="${tipoPagamento}">
                    Confirmar pagamento via PIX
                </button>
            </form>
        `;
    } else if (tipoPagamento === "CARTAO") {
        modalContent.innerHTML = `
            <form action="${pageContext.request.contextPath}/CartaoServlet" method="post">
                <h3>Preencha os dados para realizar o pagamento via CARTÃO</h3>
                <label for="numeroCartao">Número do cartão:</label>
                <input type="text" id="numeroCartao" name="numeroCartao" required><br>
                
                <label for="senhaCartao">Senha:</label>
                <input type="text" id="senhaCartao" name="senhaCartao" required><br>
                
                <label for="codigoCartao">Código:</label>
                <input type="text" id="codigoCartao" name="codigoCartao" required><br>
                
                <label for="validadeCartao">Validade:</label>
                <input type="text" id="validadeCartao" name="validadeCartao" required><br>
        
                <label for="saldo">Insira o saldo a ser recarregado:</label>
                <input type="number" id="saldo" name="saldo" required><br>
                <button type="submit" name="tipoPagamento" value="${tipoPagamento}">
                    Confirmar pagamento
                </button>
            </form>
        `;
    } else {
        modalContent.innerHTML = `
            <form action="${pageContext.request.contextPath}/SaldoServlet" method="post">
                <h3>Preencha os dados para realizar a transferência</h3>
                <label for="matricula">Insira a matrícula que receberá o saldo:</label>
                <input type="text" id="matricula" name="matricula" required><br>
                <label for="saldo">Insira o saldo a ser transferido:</label>
                <input type="number" id="saldo" name="saldo" required><br>
                <button type="submit" name="tipoPagamento" value="${tipoPagamento}">
                    Confirmar transferência
                </button>
            </form>
        `;
    }

    modal.style.display = 'block';
}

function closeModal() {
    const modal = document.getElementById('myModal');
    modal.style.display = 'none';
}

window.onclick = function (event) {
    const modal = document.getElementById('myModal');
    if (event.target === modal) {
        closeModal();
    }
};
