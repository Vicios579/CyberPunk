var implantesModel = require("../models/implantesModel.js")

function buscarListaImplantes(req, res) {
   implantesModel.buscarListaImplantes().then((resultado) => {
      res.status(200).json(resultado)
   })
}

function buscarImplantesUsuario(req, res) {
    implantesModel.buscarImplantesUsuario(req.params.id).then((resultado) => {
        res.status(200).json(resultado)
    })
}

module.exports = { buscarListaImplantes, buscarImplantesUsuario }