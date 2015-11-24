function cargarEventos(cy, cyr){
	cyr.on('click', 'node', function(event){
		var node = event.cyTarget;
		//obtengo idNodo
		var idNodo = node.id();
		
		actualizarGrafo(cy, cyr, idNodo);
		
	});
}
