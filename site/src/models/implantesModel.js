var database = require("../database/config.js");

function buscarListaImplantes() {
   var instrucaoSql = `
   SELECT * FROM modificacoes
   ORDER BY categoria DESC, preco DESC;
   `

   return database.executar(instrucaoSql)
}

function buscarImplantesUsuario(idUsuarioLogado) {
   var instrucaoSql = `
   SELECT 
    m.nome AS nome,
    m.caminho AS path
FROM ImplantesUsuario AS iu
JOIN Modificacoes AS m 
    ON iu.fkModificacao = m.idModificacao
WHERE iu.fkUsuario = ${idUsuarioLogado};
   `

   return database.executar(instrucaoSql)
}

module.exports = { buscarListaImplantes, buscarImplantesUsuario }
