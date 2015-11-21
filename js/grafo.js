
var cy;
var cyr;

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
		elements: grafo 	
	});
	
	cargarEventos();
	inicializarGrafo(cyr);
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
		var cursosAdyacentes = obtenerDatosCursosAdyacentes(cy, nodo.id);
		cursosAdyacentes.forEach(function (adyacente, i){
			grafo.push({data: {source: nodo.id, target: adyacente.id}});
		});
	});
	console.log(grafo);
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

function actualizarGrafo(idNodo){
	actualizarEstadoNodo(idNodo);
	
}

function actualizarEstadoNodo(idNodo){
	//Obtengo datos del nodo
	var datosNodo = obtenerDatosNodo(cyr, idNodo);
	var estado = datosNodo.estado;
	if(estado == "HABILITADO"){
		modificarDatoNodo(cyr, idNodo, 'estado', 'APROBADO');
		modificarEstiloNodo(cyr, idNodo, 'background-color', '#ff9900');
	}else if(estado == "APROBADO"){
		modificarDatoNodo(cyr, idNodo, 'estado', 'EXONERADO');
		modificarEstiloNodo(cyr, idNodo, 'background-color', '#008000');
	}else{
		modificarDatoNodo(cyr, idNodo, 'estado', 'HABILITADO');
		modificarEstiloNodo(cyr, idNodo, 'background-color', '#e60000');
	}
}
function test() 
{	

	console.log('[modificarDatoNodo(cy, "C1025","name", "PyE")]');
	modificarDatoNodo(cy, "C1025","name", "PyE");
	console.log(obtenerDatosNodo(cy, "C1025"));

	console.log('[obtenerDatosArista("C1020","G1001")]');
	var datosArista = obtenerDatosArista(cy, "C1020","G1001");
	console.log(datosArista);

	console.log('[obtenerDatosAristasAdyacentes("C1020")]');
	var aristasAdyacentes = obtenerDatosAristasAdyacentes(cy, "C1020");
	console.log(aristasAdyacentes);

	console.log('[obtenerDatosAristasIncidentes("C1025")]');
	var aristasIncidentes = obtenerDatosAristasIncidentes(cy, "C1025");
	console.log(aristasIncidentes);

	console.log('[obtenerDatosNodosRaiz()]');
	var datosRaices = obtenerDatosNodosRaiz(cy);
	console.log(datosRaices);

	console.log('[obtenerPosicionNodo("C1025")]');
	var posicion = obtenerPosicionNodo(cy, "C1025");
	console.log(posicion);

	console.log('[modificarPosicionNodo("C1025",0,0)]');
	modificarPosicionNodo(cy, "C1025",200,	200);
	var posicion = obtenerPosicionNodo(cy, "C1025");
	console.log(posicion);

	modificarEstiloNodo(cy, "C1025","background-color", "red");
	//modificarEstiloNodo(cy, "C1025","visibility", "hidden");


}

