var database = require("../database/config.js");

function buscarListaImplantes() {
   var instrucaoSql = `
   SELECT * FROM modificacoes
   WHERE idModificacao > 1
   ORDER BY categoria DESC, preco DESC;
   `

   return database.executar(instrucaoSql)
}

function buscarImplantesUsuario(idUsuarioLogado) {
   var instrucaoSql = `
   SELECT 
    pc.idParteCorpo,
    pc.nome AS Parte_Corpo,
    CASE 
    WHEN EXISTS 
		    (SELECT 1 
            FROM EstadoCorpo AS ec2
            WHERE ec2.fkUsuario = ec.fkUsuario
              AND ec2.fkParteCorpo = ec.fkParteCorpo
              AND ec2.fkModificacao != 1)
        THEN 1 ELSE 0
    END AS estado
FROM EstadoCorpo AS ec
JOIN ParteCorpo AS pc ON ec.fkParteCorpo = pc.idParteCorpo
WHERE ec.fkUsuario = ${idUsuarioLogado}
GROUP BY pc.idParteCorpo, pc.nome;
   `

   return database.executar(instrucaoSql)
}

module.exports = { buscarListaImplantes, buscarImplantesUsuario }
