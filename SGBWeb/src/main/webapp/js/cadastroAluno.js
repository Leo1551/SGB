document.addEventListener("DOMContentLoaded", function () {
    const form = document.querySelector("form");
    const senhaInput = document.getElementById("senha");
    const confirmarSenhaInput = document.getElementById("confirmarSenha");
    const cpfInput = document.querySelector("input[name='cpf']");
    const enviarBtn = document.querySelector("button[type='submit']");
    const fileInput = document.querySelector("input[type='file']");
    const previewImagem = document.getElementById("previewImagem");

    function verificarSenha() {
        const entradaSenha = senhaInput.value;
        const requisitos = [
            { id: "oitoCaracteres", valido: entradaSenha.length >= 8 },
            { id: "contemNumero", valido: /\d/.test(entradaSenha) },
            { id: "contemMaiuscula", valido: /[A-Z]/.test(entradaSenha) },
            { id: "contemCaractereEspecial", valido: /[!@#$%^&*(),.?":{}|<>]/.test(entradaSenha) }
        ];
        
        requisitos.forEach(req => {
            document.getElementById(req.id).classList.toggle("valido", req.valido);
            document.getElementById(req.id).classList.toggle("invalido", !req.valido);
        });
    }

    function validarSenha() {
        const entradaSenha = senhaInput.value;
        const entradaConfirmarSenha = confirmarSenhaInput.value;
        const mensagemSenhaValida = document.getElementById("senhaValida");

        if (entradaSenha !== entradaConfirmarSenha || entradaSenha === "") {
            mensagemSenhaValida.textContent = "As senhas devem ser iguais";
            mensagemSenhaValida.classList.add("invalido");
            mensagemSenhaValida.classList.remove("valido");
        } else {
            mensagemSenhaValida.textContent = "As senhas são iguais";
            mensagemSenhaValida.classList.add("valido");
            mensagemSenhaValida.classList.remove("invalido");
        }
    }

    function validarCPF(cpf) {
        cpf = cpf.replace(/\D/g, "");
        if (cpf.length !== 11 || /^(\d)\1{10}$/.test(cpf)) return false;

        let soma = 0, resto;
        for (let i = 1; i <= 9; i++) soma += parseInt(cpf.charAt(i - 1)) * (11 - i);
        resto = (soma * 10) % 11;
        if (resto === 10 || resto === 11) resto = 0;
        if (resto !== parseInt(cpf.charAt(9))) return false;

        soma = 0;
        for (let i = 1; i <= 10; i++) soma += parseInt(cpf.charAt(i - 1)) * (12 - i);
        resto = (soma * 10) % 11;
        if (resto === 10 || resto === 11) resto = 0;
        return resto === parseInt(cpf.charAt(10));
    }

    function formatarCPF(event) {
        let cpf = event.target.value.replace(/\D/g, "");
        cpf = cpf.replace(/(\d{3})(\d)/, "$1.$2");
        cpf = cpf.replace(/(\d{3})\.(\d{3})(\d)/, "$1.$2.$3");
        cpf = cpf.replace(/(\d{3})\.(\d{3})\.(\d{3})(\d)/, "$1.$2.$3-$4");
        event.target.value = cpf;
    }

    function validarFormulario(event) {
        if (!validarCPF(cpfInput.value)) {
            alert("CPF inválido! Verifique e tente novamente.");
            event.preventDefault();
            return;
        }
        if (!document.getElementById("senhaValida").classList.contains("valido")) {
            alert("As senhas não coincidem ou não atendem aos requisitos.");
            event.preventDefault();
            return;
        }
    }

    function carregarPreviewImagem(event) {
        const arquivo = event.target.files[0];
        if (arquivo) {
            const tipoPermitido = ["image/jpeg", "image/png"];
            if (!tipoPermitido.includes(arquivo.type)) {
                alert("Apenas arquivos JPG, JPEG e PNG são permitidos.");
                fileInput.value = "";
                previewImagem.src = "";
                return;
            }
            previewImagem.src = URL.createObjectURL(arquivo);
            previewImagem.onload = function () {
                URL.revokeObjectURL(previewImagem.src);
            };
        }
    }


    senhaInput.addEventListener("input", verificarSenha);
    confirmarSenhaInput.addEventListener("input", validarSenha);
    cpfInput.addEventListener("input", formatarCPF);
    form.addEventListener("submit", validarFormulario);
    fileInput.addEventListener("change", carregarPreviewImagem);
});
