var grafo = null;
function obtenerGrafo(carrera){
			
	var parametros = {
		"carrera" : carrera,
	};
	
	jQuery.ajax({
		data:  parametros,
		url:   'logica/obtenerGrafo.php',
		type:  'post',
		beforeSend: function () {
				jQuery("#div_grafo").html("Procesando, espere por favor...");
		},
		success:  function (response) {
			jQuery("#div_grafo").html("Exito!");
			grafo = jQuery.parseJSON(response);
			dibujarGrafo(grafo);
		}
	});
	
}

function dibujarGrafo(grafo){
	
}