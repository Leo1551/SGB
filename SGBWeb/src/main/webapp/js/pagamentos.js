var metodoPagamento;
var pageContext = {
    request: {
        contextPath: '<%= request.getContextPath() %>'
    }
};
function formatarMoeda(campo) {
    let valor = campo.value.replace(/[^\d]/g, "");
    valor = (valor / 100).toFixed(2);
    campo.value = "R$ " + valor;
}

function mostrarOpcao(selecionado) {
    document.querySelectorAll('.opcao').forEach(div => div.style.display = 'none');
    document.getElementById(selecionado).style.display = 'block';
    metodoPagamento = selecionado;
}

function selec() {
    if (metodoPagamento === 'pix') {
        console.log('pix');
        pagamentoPix();
    }    
    else if (metodoPagamento === 'cartao') {
        console.log('cartao');
        pagamentoCartao();
    } else {
        console.log('transf');
        transferencia();
    }    
}

function pagamentoPix() {
    var xhr = new XMLHttpRequest();
    xhr.open("POST", "pagamentoPix.jsp", true);
    xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
    var recarga = document.getElementById("recarga").value;
    var params = "recarga=" + encodeURIComponent(recarga);
    xhr.onreadystatechange = function () {
        if (xhr.readyState === 4 && xhr.status === 200) {
            alert("Recarga efetuada com sucesso");
        }
    };
    xhr.send(params);
    window.location.href = "comprovantePix.jsp?recarga=" + encodeURIComponent(recarga) + "&metodoPagamento=" + encodeURIComponent("pix");
}

function transferencia() {
    var xhr = new XMLHttpRequest();
    xhr.open("POST", "transferencia.jsp", true);
    xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
    var recarga = document.getElementById("recarga").value;
    var matriculaDestino = document.getElementById("matriculaDesti").value;
    var params = "recarga=" + encodeURIComponent(recarga) + "&matriculaDestino=" + encodeURIComponent(matriculaDestino);
    xhr.onreadystatechange = function () {
        if (xhr.readyState === 4 && xhr.status === 200) {
            alert("Recarga efetuada com sucesso");
        }
    };
    xhr.send(params);
    window.location.href = "comprovanteTransf.jsp?recarga=" + encodeURIComponent(recarga) + "&matriculaDestino=" + encodeURIComponent(matriculaDestino) + "&metodoPagamento=" + encodeURIComponent("transf");
}

function pagamentoCartao() {
    var xhr = new XMLHttpRequest();
    xhr.open("POST", "pagamentoCartao.jsp", true);
    xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");

    var nomeTitular = document.getElementById("nome-titular").value;
    var validadeCartao = document.getElementById("validade-cartao").value;
    var recarga = document.getElementById("recarga").value;
    var numCartao = document.getElementById("num-cartao").value;
    var cvv = document.getElementById("seguranca-cartao").value;

    var params = 
        "recarga=" + encodeURIComponent(recarga) + 
        "&nomeTitular=" + encodeURIComponent(nomeTitular) + 
        "&valCartao=" + encodeURIComponent(validadeCartao) + 
        "&cvv=" + encodeURIComponent(cvv) + 
        "&numCartao=" + encodeURIComponent(numCartao);

    console.log("Enviando dados: " + params);

    xhr.onreadystatechange = function () {
        if (xhr.readyState === 4) {
            console.log("Resposta do servidor: " + xhr.responseText);
            if (xhr.status === 200) {
                alert("Recarga efetuada com sucesso");
                window.location.href = "comprovanteCartao.jsp?recarga=" + encodeURIComponent(recarga);
            } else {
                alert("Erro ao processar pagamento. Tente novamente.");
            }
        }
    };
    
    xhr.send(params);
}

