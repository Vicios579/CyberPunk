var database = require("../database/config")

function autenticar(email, senha) {
    console.log("ACESSEI O USUARIO MODEL \n \n\t\t >> Se aqui der erro de 'Error: connect ECONNREFUSED',\n \t\t >> verifique suas credenciais de acesso ao banco\n \t\t >> e se o servidor de seu BD está rodando corretamente. \n\n function entrar(): ", email, senha)
    var instrucaoSql = `
        SELECT idUsuario, nome, email, genero FROM Usuario WHERE email = '${email}' AND senha = '${senha}';
    `;
    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
} 

// Coloque os mesmos parâmetros aqui. Vá para a var instrucaoSql
function cadastrar(nome, email, genero, cpf, dtNasc, senha ) {
    console.log("ACESSEI O USUARIO MODEL \n \n\t\t >> Se aqui der erro de 'Error: connect ECONNREFUSED',\n \t\t >> verifique suas credenciais de acesso ao banco\n \t\t >> e se o servidor de seu BD está rodando corretamente. \n\n function cadastrar():", nome, email, genero, cpf, dtNasc, senha);
    
    // Insira exatamente a query do banco aqui, lembrando da nomenclatura exata nos valores
    //  e na ordem de inserção dos dados.
    var instrucaoSql = `
        INSERT INTO Usuario (nome, email, genero, cpf, dtNasc, senha) VALUES ('${nome}', '${email}', '${genero}', '${cpf}' , '${dtNasc}' , '${senha}');
    `;
    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql).then(function() {
      var instrucaoSelect = `SELECT idUsuario, genero FROM Usuario WHERE email = '${email}'`;
      console.log("executando select")
      return database.executar(instrucaoSelect)
    });
}

function definirEstadoCorpo(idUsuarioLogado) {
    var instrucaoSql = `
        INSERT INTO EstadoCorpo VALUES
            (${idUsuarioLogado}, 1, 1, 0, null),
            (${idUsuarioLogado}, 2, 1, 0, null),
            (${idUsuarioLogado}, 3, 1, 0, null),
            (${idUsuarioLogado}, 4, 1, 0, null),
            (${idUsuarioLogado}, 5, 1, 0, null),
            (${idUsuarioLogado}, 6, 1, 0, null),
            (${idUsuarioLogado}, 7, 1, 0, null),
            (${idUsuarioLogado}, 8, 1, 0, null),
            (${idUsuarioLogado}, 9, 1, 0, null),
            (${idUsuarioLogado}, 10, 1, 0, null),
            (${idUsuarioLogado}, 11, 1, 0, null),
            (${idUsuarioLogado}, 12, 1, 0, null),
            (${idUsuarioLogado}, 13, 1, 0, null),
            (${idUsuarioLogado}, 14, 1, 0, null),
            (${idUsuarioLogado}, 15, 1, 0, null),
            (${idUsuarioLogado}, 16, 1, 0, null),
            (${idUsuarioLogado}, 17, 1, 0, null),
            (${idUsuarioLogado}, 18, 1, 0, null),
            (${idUsuarioLogado}, 19, 1, 0, null);
    `;

    return database.executar(instrucaoSql);
}

module.exports = {
    autenticar,
    cadastrar,
    definirEstadoCorpo
};