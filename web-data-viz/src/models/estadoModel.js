var database = require("../database/config");

function buscarUltimasMedidas(idUsuariologado) {

    var instrucaoSql = `
    SELECT count(estado) FROM Usuario as u
    JOIN estadoCorpo as e ON e.fkUsuario = u.idUsuario
    WHERE fkusuario = ${idUsuario}
    AND estado = 1`;

    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}

module.exports = {
    buscarUltimasMedidas
}
