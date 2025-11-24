var express = require("express");
var router = express.Router();

var estadoController = require("../controllers/estadoController");

router.get("/usuario/:idUsuariologado", function (req, res) {
    estadoControllerController.buscarUltimasMedidas(req, res);

});

module.exports = router;