function formatarMoeda(campo) {
    let valor = campo.value.replace(/[^\d]/g, "");
    valor = (valor / 100).toFixed(2).replace(".", ",");
    campo.value = "R$ " + valor;
}

function mostrarOpcao(selecionado) {
    document.querySelectorAll('.opcao').forEach(div => div.style.display = 'none');
    document.getElementById(selecionado).style.display = 'block';
}