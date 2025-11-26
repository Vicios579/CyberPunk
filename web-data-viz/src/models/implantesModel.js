var database = require("../database/config.js");

function buscarListaImplantes() {
   var instrucaoSql = `
   SELECT * FROM modificacoes
   WHERE idModificacao > 1;
   `

   return database.executar(instrucaoSql)
}

function buscarImplantesUsuario(idUsuarioLogado) {
   var instrucaoSql = `
   SELECT u.idUsuario AS 'Usuário',
	   pc.nome AS 'Parte do Corpo',
	   m.nome AS 'Modificação',
       ec.estado AS 'Estado'
FROM EstadoCorpo AS ec JOIN Usuario AS u ON u.idUsuario = ec.fkUsuario
JOIN Modificacoes AS m ON m.idModificacao = ec.fkModificacao
JOIN ParteCorpo AS pc ON pc.idParteCorpo = ec.fkParteCorpo
WHERE fkUsuario = ${idUsuarioLogado};
   `

   return database.executar(instrucaoSql)
}

module.exports = { buscarListaImplantes, buscarImplantesUsuario }
