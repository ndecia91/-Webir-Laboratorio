var cy;
var cyr;
var stack = [];

function obtenerGrafoDelServidor(idCarrera) {
			
		var parametros = {
			"carrera" : idCarrera,
		};
		
		jQuery.ajax({
			data:  parametros,
			url:   'logica/obtenerGrafo.php',
			type:  'post',
			async: false,
			beforeSend: function () { },
			success:  function (response) {

				grafo = jQuery.parseJSON(response);
				
				cy = window.cy = cytoscape({
					elements: grafo 
				});
				
				construirGrafoReducido(cy);
				
			}
		});	
}

function modificarDatoNodo(cy, idNodo, atributo, valor)
{

	var selector = '#' + idNodo ;
	var nodo = cy.nodes(selector);
	nodo.data(atributo,valor);	

}

function obtenerDatosNodo(cy, idNodo)
{

	var selector = '#' + idNodo ;
	var nodo = cy.nodes(selector);
	return nodo.data();

}


function modificarEstiloNodo(cy, idNodo, atributo, valor)
{

	var selector = '#' + idNodo ;
	var nodo = cy.nodes(selector);
	return nodo.style(atributo, valor);

}

function modificarEstiloArista(cy, arista, atributo, valor)
{

	var nodo = cy.nodes(selector);
	return nodo.style(atributo, valor);

}

function obtenerPosicionNodo(cy, idNodo)
{
	var selector = '#' + idNodo ;
	var nodo = cy.nodes(selector);
	return nodo.position();
}

function modificarPosicionNodo(cy, idNodo, x, y)
{
	var selector = '#' + idNodo ;
	var nodo = cy.nodes(selector);
	nodo.position({x:x, y:y});
}

function obtenerDatosArista(cy, idOrigen, idDestino)
{
	var source = "[source='" + idOrigen + "']";
	var target = "[target='" + idDestino + "']";
	var selector = source + target;
	var arista = cy.edges(selector);
	return arista.data();

}

function obtenerDatosAristasAdyacentes(cy, idNodo)
{

	var selector = '#' + idNodo;
	var nodo = cy.nodes(selector);
	var adyacentes = nodo.outgoers(
		function() { 
  			return this.isEdge();
		}
	);
	var datos = [];
	adyacentes.forEach(
		function (ele, i) {
			datos.push(ele.data());
		}
	);
	return datos;
}

function obtenerDatosNodosAdyacentes(cy, idNodo)
{

	var selector = '#' + idNodo;
	var nodo = cy.nodes(selector);
	var adyacentes = nodo.outgoers(
		function() { 
  			return this.isNode();
		}
	);
	var datos = [];
	adyacentes.forEach(
		function (ele, i) {
			datos.push(ele.data());
		}
	);
	return datos;
}


function obtenerDatosAristasIncidentes(cy, idNodo)
{
	var selector = '#' + idNodo;
	var nodo = cy.nodes(selector);
	var incidentes = nodo.incomers(
		function() { 
  			return this.isEdge();
		}
	);
	var datos = [];
	incidentes.forEach(
		function (ele, i) {
			datos.push(ele.data());
		}
	);
	return datos;
	
}

function obtenerDatosNodosRaiz(cy)
{

	var nodos = cy.nodes();
	var raices = nodos.roots();
	var datos = [];
	raices.forEach(
		function (ele, i) {
			datos.push(ele.data());
		}
	);
	return datos;
	
}

function construirGrafoReducido(cy){
	
	var grafo = obtenerGrafoReducido(cy);
	//Grafo reducido
	cyr = window.cyr = cytoscape({
		container: document.getElementById('cy'),
		boxSelectionEnabled: false,
		autounselectify: true,
		layout: { name: 'grid' }, //fit: false, //name: 'preset',
		
		style: [ {selector: 'node', style: estilosNodos },
				 { selector: 'edge', style: estilosAristas }
		],
		elements: grafo,
	});
	
	cargarEventos(cy, cyr);
	inicializarGrafo(cyr);
	console.log("push");
	stack.push(cyr.json());
}

function inicializarGrafo(grafo){
	//Marco cursos raices como visibles, en color rojo y en estado habilitado
	var nodosRaiz = obtenerDatosNodosRaiz(grafo);
	nodosRaiz.forEach(function (nodo, i){
		modificarEstiloNodo(grafo, nodo.id, 'background-color', '#e60000');
		modificarEstiloNodo(grafo, nodo.id, 'visibility', 'visible');
		modificarDatoNodo(grafo, nodo.id, 'estado', 'HABILITADO');
	})
}

/*
function obtenerGrafoReducido(cy){
	
	var datosNodosCurso = obtenerDatosNodosTipoCurso(cy);
	
	//Agrego nodos tipo curso
	var grafo = [];
	datosNodosCurso.forEach(
		function(nodo, i){
			grafo.push({data: { id: nodo.id, name: nodo.name, estado: 'INHABILITADO'}});
		}
	);
	
	//Agrego aristas
	datosNodosCurso.forEach(function (nodo, i){
		var aristasAdyacentes = obtenerDatosAristasAdyacentes(cy, nodo.id);
		aristasAdyacentes.forEach(function(arista, i) {
			var nodoAdyacente = obtenerDatosNodo(cy, arista.target);
			var estilos = arista.actividadPrevia == "CURSO" ? estilosAristaCurso : estilosAristaExamen;
			var indiceColor = Math.round(10 * Math.random()) % colores.length;
			if(nodoAdyacente.tipo == "CURSO"){
				if(arista.actividad == "CURSO")
					grafo.push({data: {source: nodo.id, target: nodoAdyacente.id}, style: estilos})
			}else{//GRUPO
				estilos['text-background-color'] = colores[indiceColor];
				indiceColor = (indiceColor + 1) % colores.length;
				var puntaje = arista.puntaje;
				var minimo 	= obtenerDatosNodo(cy, arista.target).min;
				var label = puntaje + "/" + minimo;
				var aristasAdyacentes = obtenerDatosAristasAdyacentes(cy, nodoAdyacente.id);
				aristasAdyacentes.forEach(function(arista, i){
					if(arista.actividad == "CURSO")
						grafo.push({data: {source: nodo.id, target: arista.target, label: label}, style: estilos});
				});
			}
				
		});
	});
	console.log(grafo);
	return grafo;
} */

function obtenerGrafoReducido(cy){
	
	var datosNodosCurso = obtenerDatosNodosTipoCurso(cy);
	
	//Agrego nodos tipo curso
	var grafo = [];
	datosNodosCurso.forEach(
		function(nodo, i){
			grafo.push({data: { id: nodo.id, name: nodo.name, estado:'INHABILITADO'}});
		}
	);
	
	//Agrego aristas
	datosNodosCurso.forEach(function (nodo, i){
		var aristasIncidentes = obtenerDatosAristasIncidentes(cy, nodo.id);
		var indiceColor = 0;//Math.round(10 * Math.random()) % colores.length;
		aristasIncidentes.forEach(function(arista, i) {
			var nodoIncidente = obtenerDatosNodo(cy, arista.source);
			if (arista.actividad == "CURSO") {
				if(nodoIncidente.tipo == "CURSO") {
					var estilos = arista.actividadPrevia == "CURSO" ? estilosAristaCurso : estilosAristaExamen;
					grafo.push({data: {source: nodoIncidente.id, target: nodo.id}, style: estilos})
				} else {//GRUPO
					var minimo 	= nodoIncidente.min;
					var aristasIncidentes = obtenerDatosAristasIncidentes(cy, nodoIncidente.id);
					var sumatoriaPuntajeCursosGrupo = 0;
					aristasIncidentes.forEach(function(arista, i) {
							sumatoriaPuntajeCursosGrupo += parseInt(arista.puntaje);
					});
					aristasIncidentes.forEach(function(arista, i) {
						var puntaje = arista.puntaje;
						var label = null;
						if ((sumatoriaPuntajeCursosGrupo) != minimo) 
							label = puntaje + "/" + minimo;
						var estilos = Object.assign(
							{'text-background-color':colores[indiceColor]},
							arista.actividadPrevia == "CURSO" ? estilosAristaCurso : estilosAristaExamen);
						grafo.push({data: {source: arista.source, target: nodo.id, label: label}, style: estilos});
					});
				}
				indiceColor = (indiceColor + 1) % colores.length;	
			}
		});
	});
	return grafo;
}

function obtenerDatosCursosAdyacentes(cy, idNodo){
	
	var cursosAdyacentes = [];
	var nodosAdyacentes = obtenerDatosNodosAdyacentes(cy, idNodo);
	nodosAdyacentes.forEach(function(nodo, i){
		if(nodo.tipo == "CURSO"){
			cursosAdyacentes.push(nodo);
		}else{
			var datos = obtenerDatosNodosAdyacentes(cy, nodo.id);
			
			cursosAdyacentes = cursosAdyacentes.concat(datos);
	
		}
	});

		
	return cursosAdyacentes;
	
}

function obtenerDatosNodosTipoCurso(cy){
	var nodos = cy.nodes('[tipo="CURSO"]');

	
	var datos = [];
	nodos.forEach(
		function (ele, i) {
			datos.push(ele.data());
		}
	);
	
	return datos;
}

function actualizarGrafo(cy, cyr, idNodo){
	
	//Obtengo estado del nodo
	var datos 	   = obtenerDatosNodo(cy, idNodo);
	var estadoNodo = obtenerDatosNodo(cyr, idNodo).estado;
	
	if(estadoNodo == "HABILITADO"){
		//Actualizo el estado del nodo
		actualizarEstadoNodo(cyr, idNodo);
	}else if(estadoNodo == "APROBADO"){
		//Curso exonerado
		//Verifico que cumple con las previas del examen

		var exonerado = true;
		if (datos.exonerable == "No") {
			exonerado = cursoExonerado(cy, cyr, idNodo);
		}
		if(!exonerado)
			return;
		actualizarEstadoNodo(cyr, idNodo);
	}
	
	
	//Obtengo todos los cursos adyacentes
	var cursosAdyacentes = obtenerDatosCursosAdyacentes(cy, idNodo);
	
	cursosAdyacentes.forEach(function(curso, i){
		var estadoCurso = obtenerDatosNodo(cyr, curso.id).estado;
		
		if (estadoCurso == "INHABILITADO") {
			var aprobado = cursoAprobado(cy, cyr, curso.id);
			
			if(aprobado)
				actualizarEstadoNodo(cyr, curso.id);
		}		
	});
	console.log("push");
	stack.push(cyr.json());
}
/*
function rollback()
{

	var object;
	if (stack.length > 1) {
		object = stack.pop();
	}else{
		object = stack[0];
	}
	var nodos = object.elements.nodes;
	nodos.forEach(function(nodo, i){
		console.log(nodo.nodes);
	});
	cyr = window.cyr = cytoscape({
		style: [ {selector: 'node', style: estilosNodos },
				 { selector: 'edge', style: estilosAristas }
		],
		elements: object.elements,
		//style: object.style
	});
	
	cyr.load();
}*/

function actualizarEstadoNodo(cyr, idNodo){
	
	//Obtengo datos del nodo
	var datosNodo = obtenerDatosNodo(cyr, idNodo);
	var estado = datosNodo.estado;
	
	if(estado == "INHABILITADO"){
		modificarDatoNodo(cyr, idNodo, 'estado', 'HABILITADO');
		modificarEstiloNodo(cyr, idNodo, 'background-color', '#e60000');
		modificarEstiloNodo(cyr, idNodo, 'visibility', 'visible');
	}else if(estado == "HABILITADO"){
		modificarDatoNodo(cyr, idNodo, 'estado', 'APROBADO');
		modificarEstiloNodo(cyr, idNodo, 'background-color', '#ff9900');
	}else if(estado == "APROBADO"){
		modificarDatoNodo(cyr, idNodo, 'estado', 'EXONERADO');
		modificarEstiloNodo(cyr, idNodo, 'background-color', '#008000');
	}else if(estado == "EXONERADO"){
		modificarDatoNodo(cyr, idNodo, 'estado', 'HABILITADO');
		modificarEstiloNodo(cyr, idNodo, 'background-color', '#e60000');
	}
}

function cursoAprobado(cy, cyr, idNodo){
	//Obtengo aristas incidentes
	var aristasIncidentes = obtenerDatosAristasIncidentes(cy, idNodo);
	for (arista of aristasIncidentes) {
		//Obtengo nodo padre
		var actividad = arista.actividad;
		if(actividad == "CURSO"){
			var idPadre = arista.source;
			var actividadPreviaArista = arista.actividadPrevia;
			if(actividadPreviaArista == "GRUPO"){
				if(!grupoAprobado(cy, cyr, idPadre))
					return false;
			}else{
				var estadoNodoPadre = obtenerDatosNodo(cyr, idPadre).estado;
				if (actividadPreviaArista == "CURSO" && 
					(!estadoNodoPadre == "INHABILITADO"))
					return false;
				if (actividadPreviaArista == "EXAMEN" && 
					(estadoNodoPadre != "EXONERADO"))
					return false;
			}
		}
	}
	
	return true;
}

function cursoExonerado(cy, cyr, idNodo){
	//Obtengo aristas incidentes
	var aristasIncidentes = obtenerDatosAristasIncidentes(cy, idNodo);
	for (arista of aristasIncidentes) {
		//Obtengo nodo padre
		var actividad = arista.actividad;
		if(actividad == "EXAMEN"){
			var idPadre = arista.source;
			var actividadPreviaArista = arista.actividadPrevia;
			if(actividadPreviaArista == "GRUPO"){
				if(!grupoAprobado(cy, cyr, idPadre))
					return false;
			}else{
				var estadoNodoPadre = obtenerDatosNodo(cyr, idPadre).estado;
				if (actividadPreviaArista == "CURSO" && 
					(!estadoNodoPadre == "INHABILITADO"))
					return false;
				if (actividadPreviaArista == "EXAMEN" && 
					(estadoNodoPadre != "EXONERADO"))
					return false;
			}
		}
		
	}
	
	return true;
}

function grupoAprobado(cy, cyr, idNodo){
	
	//Obtengo aristas incidentes
	var aristasIncidentes = obtenerDatosAristasIncidentes(cy, idNodo);
	
	var minGrupo = parseInt(obtenerDatosNodo(cy,idNodo).min);
	
	var min = 0;
	aristasIncidentes.forEach(function(arista, i){
		//Obtengo nodo padre
		var idPadre = arista.source;
		var actividadPreviaArista = arista.actividadPrevia;
		var estadoNodoPadre = obtenerDatosNodo(cyr, idPadre).estado;
		if (actividadPreviaArista == "EXAMEN" && 
				estadoNodoPadre == "EXONERADO" )
			min+= parseInt(arista.puntaje);
		
		if (actividadPreviaArista == "CURSO" && 
				(estadoNodoPadre == "EXONERADO" ||
					estadoNodoPadre == "APROBADO"))
			min+= parseInt(arista.puntaje);
		
	});
	
	
	return (min >= minGrupo);
}

function mostrarDatosCurso(cy,cyr,idNodo)
{
	var selector = '#' + idNodo;
	var datos = obtenerDatosNodo(cy, idNodo);
	
	cyr.$(selector).qtip({
		content: {text: '<strong>Créditos: </strong>'+ datos.creditos +
						'<br><strong>Validez: </strong>'+ (datos.validez == "999" ? 'N/A' : datos.validez + " meses")  +
						'<br><strong>Exonerable: </strong>'+ datos.exonerable +
						'<br><strong>Nota Promedio: </strong>'+ datos.nota_promedio +
						'<br><strong>Inscriptos: </strong>'+ datos.total_cursantes +
						'<br><strong>Aprobados: </strong>'+ datos.aprobados +
						'<br><strong>Exonerados: </strong>'+ datos.exonerados +
						'<br><strong>% Aprobación: </strong>'+ datos.porcentaje_aprobacion,
				  title:'Información Curso'
		},
		position: {
			my: 'top center',
			at: 'bottom center'
		},
		show: {
			event: false,
			ready: true,
		},
		hide: {
			event: 'mouseout'
		},
		style: {
			classes: 'qtip-blue qtip-rounded qtip-shadow', 
			max_width: 30,
		}
});
}


