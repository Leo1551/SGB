function verificarSenha() {
    const senha = document.getElementById('senha');
    const entradaSenha = senha.value;
    const confirmarSenha = document.getElementById('confirmarSenha');
    const entradaConfirmarSenha = confirmarSenha.value;

    const oitoCaracteres = document.getElementById('oitoCaracteres');
    const contemNumero = document.getElementById('contemNumero');
    const contemMaiuscula = document.getElementById('contemMaiuscula');
    const contemCaractereEspecial = document.getElementById('contemCaractereEspecial');

    const temOitoCaracteres = entradaSenha.length >= 8;
    const temNumero = /\d/.test(entradaSenha);
    const temMaiuscula = /[A-Z]/.test(entradaSenha);
    const temCaractereEspecial = /[ !@#$%^&*()_+\-=\[\]{};':"\\|,.<>\/?]/.test(entradaSenha);

    oitoCaracteres.className = temOitoCaracteres ? 'valido' : 'invalido';
    contemNumero.className = temNumero ? 'valido' : 'invalido';
    contemMaiuscula.className = temMaiuscula ? 'valido' : 'invalido';
    contemCaractereEspecial.className = temCaractereEspecial ? 'valido' : 'invalido';
}

function validarSenha() {
    const senha = document.getElementById('senha');
    const entradaSenha = senha.value;
    const confirmarSenha = document.getElementById('confirmarSenha');
    const entradaConfirmarSenha = confirmarSenha.value;

    const mensagemSenhaValida = document.getElementById('senhaValida');

    if (senha.value !== confirmarSenha.value) {
        mensagemSenhaValida.textContent = 'As senhas devem ser iguais';
        mensagemSenhaValida.className = 'invalido';
    } else {
        mensagemSenhaValida.textContent = 'As senhas são iguais';
        mensagemSenhaValida.className = 'valido';
    }
}
const senha = document.getElementById('senha');
const entradaSenha = senha.value;
const confirmarSenha = document.getElementById('confirmarSenha');
const entradaConfirmarSenha = confirmarSenha.value;
senha.onchange = validarSenha;
confirmarSenha.onkeyup = validarSenha;

function carregarArquivo(evento) {
    var entrada = evento.target;
    var arquivo = entrada.files[0];
    var tipo = arquivo.type;

    var saida = document.getElementById('previewImagem');

    saida.src = URL.createObjectURL(evento.target.files[0]);
    saida.onload = function () {
        URL.revokeObjectURL(saida.src);
    }
}