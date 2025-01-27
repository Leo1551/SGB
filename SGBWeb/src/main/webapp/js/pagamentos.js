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
    } else
        console.log('transf');
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
    window.location.href = "comprovante.jsp";
}

function pagamentoCartao() {
    var xhr = new XMLHttpRequest();
    xhr.open("POST", "cadastraCartao.jsp", true);
    xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");

    //console.log(matriculaDestinatario);
    var nomeTitular = document.getElementById("nome-titular").value;
    var validadeCartao = document.getElementById("validade-cartao").value;
    var recarga = document.getElementById("recarga").value;
    var numCartao = document.getElementById("num-cartao").value;
    var cvv = document.getElementById("seguranca-cartao").value;
    console.log(recarga);
    var params = "recarga=" + encodeURIComponent(recarga) + "&nomeTitular=" + encodeURIComponent(nomeTitular) + "&valCartao=" + encodeURIComponent(validadeCartao) + "&cvv=" + encodeURIComponent(cvv) + "&numCartao=" + encodeURIComponent(numCartao); //+ "&metodoPagamento=" + encodeURIComponent(metodoPagamento) + "&matriculaDesti=" + encodeURIComponent(matriculaDestinatario);
    console.log(params);
    xhr.onreadystatechange = function () {
        if (xhr.readyState === 4 && xhr.status === 200) {
            alert("Recarga efetuada com sucesso");
        }
    };
    xhr.send(params);
    window.location.href = "comprovante.jsp";
}
