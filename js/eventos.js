function cargarEventos(cy, cyr){

	cyr.on('click', 'node', function(event){
		var node = event.cyTarget;
	
		//obtengo idNodo
		var idNodo = node.id();
		actualizarGrafo(cy, cyr, idNodo);
		
	});

	cyr.on('mouseover', 'node', function(event){
		 
		var node = event.cyTarget;
		var datos = node.data();
		console.log(node);
		//obtengo idNodo
		var idNodo = node.id();

		
		
	});
	
	cyr.on('cxttapstart ', 'node', function(event){
		
		var node = event.cyTarget;
		
		//obtengo idNodo
		var idNodo = node.id();
		if (node.data().estado == undefined) {
			modificarEstiloNodo(cyr ,idNodo, 'display', 'none');
			visible[idNodo] = false;
			console.log(idNodo);
		}
		else{
			cambiarVisibilidadAristas(cyr, idNodo);
			mostrarDatosCurso(cy, cyr, idNodo);
		}
	});
	
	/*jQuery("#cy").on('mousedown', function(e){
		console.log(e);
		if( e.button == 2 ) { 
		  //rollback();
			cyr.$('#cy').select();
		} 

	});*/
	
	
	
}

