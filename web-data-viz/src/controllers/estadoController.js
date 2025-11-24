var estadoModel = require("../models/estadoModel");

function buscarUltimasMedidas(req, res) {


    var idUsuario = req.params.idUsuarioLogado;

    estadoModel.buscarUltimasMedidas(idUsuarioLogado).then(function (resultado) {
        if (resultado.length > 0) {
            res.status(200).json(resultado);
        } else {
            res.status(204).send("Nenhum resultado encontrado!")
        }
    }).catch(function (erro) {
        console.log(erro);
        console.log("Houve um erro ao buscar as ultimas medidas.", erro.sqlMessage);
        res.status(500).json(erro.sqlMessage);
    });
}


module.exports = {
    buscarUltimasMedidas

}