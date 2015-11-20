
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
}

function obtenerGrafoReducido(cy){
	var datosNodosCurso = obtenerDatosNodosTipoCurso(cy);
	
	var grafo = [];
	datosNodosCurso.forEach(
		function(nodo, i){
			grafo.push({data: { id: nodo.id, name: nodo.name, estado: 'inhabilitado'}});
		}
	);
	
	var datos = obtenerDatosNodosRaiz(cy);
	
	for (i = 0; i < datos.length; i++) { 
		agregarAristas(cy, grafo, datos[i].id);
	}
	
	return grafo;
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

function agregarAristas(cy, grafo, idNodo){
	//Obtengo hijos del nodo
	var adyacentes = obtenerDatosAristasAdyacentes(cy, idNodo);
	adyacentes.forEach(function(arista, i){
		var nodoHijo = obtenerDatosNodo(cy, arista.target);
		var tipoNodo = nodoHijo.tipo;
		var nodosAdyacentes = [];
		if(tipoNodo == "CURSO"){
			nodosAdyacentes.push(nodoHijo);
		else{
			
		}
			//agrego arista
			grafo.push({data: { source: idNodo, target: nodoHijo.id}});
			agregarAristas(cy, grafo, nodoHijo.id);
		}else{
			agregarAristas(cy, grafo,)
		}
	});
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

