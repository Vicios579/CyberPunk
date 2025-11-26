var express = require("express");
var router = express.Router();

var implantesController = require("../controllers/implantesController");

router.get("/todos", function (req, res) {
    implantesController.buscarListaImplantes(req, res);

});

router.get("/implantesUsuario/:id", function (req, res) {
    implantesController.buscarImplantesUsuario(req, res);

});

// router.get("/totalImplantesUsuario")

module.exports = router;
