
var grafo = null;

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
	
			}
		});	
}

function modificarDatoNodo(idNodo, atributo, valor)
{

	var selector = '#' + idNodo ;
	var nodo = cy.nodes(selector);
	nodo.data(atributo,valor);	

}

function obtenerDatosNodo(idNodo)
{
	var selector = '#' + idNodo ;
	var nodo = cy.nodes(selector);
	return nodo.data();

}


function modificarEstiloNodo(idNodo, atributo, valor)
{
	var selector = '#' + idNodo ;
	var nodo = cy.nodes(selector);
	return nodo.style(atributo, valor);

}

function obtenerPosicionNodo(idNodo)
{
	var selector = '#' + idNodo ;
	var nodo = cy.nodes(selector);
	return nodo.position();
}

function modificarPosicionNodo(idNodo, x, y)
{
	var selector = '#' + idNodo ;
	var nodo = cy.nodes(selector);
	nodo.position({x:x, y:y});
}

function obtenerDatosArista(idOrigen, idDestino)
{
	var source = "[source='" + idOrigen + "']";
	var target = "[target='" + idDestino + "']";
	var selector = source + target;
	var arista = cy.edges(selector);
	return arista.data();

}

function obtenerDatosAristasAdyacentes(idNodo)
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


function obtenerDatosAristasIncidentes(idNodo)
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

function obtenerDatosNodosRaiz()
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

function test() 
{	

	console.log('[modificarDatoNodo(cy, "C1025","name", "PyE")]');
	modificarDatoNodo("C1025","name", "PyE");
	console.log(obtenerDatosNodo("C1025"));

	console.log('[obtenerDatosArista("C1020","G1001")]');
	var datosArista = obtenerDatosArista("C1020","G1001");
	console.log(datosArista);

	console.log('[obtenerDatosAristasAdyacentes("C1020")]');
	var aristasAdyacentes = obtenerDatosAristasAdyacentes("C1020");
	console.log(aristasAdyacentes);

	console.log('[obtenerDatosAristasIncidentes("C1025")]');
	var aristasIncidentes = obtenerDatosAristasIncidentes("C1025");
	console.log(aristasIncidentes);

	console.log('[obtenerDatosNodosRaiz()]');
	var datosRaices = obtenerDatosNodosRaiz();
	console.log(datosRaices);

	console.log('[obtenerPosicionNodo("C1025")]');
	var posicion = obtenerPosicionNodo("C1025");
	console.log(posicion);

	console.log('[modificarPosicionNodo("C1025",0,0)]');
	modificarPosicionNodo("C1025",200,	200);
	var posicion = obtenerPosicionNodo("C1025");
	console.log(posicion);

	modificarEstiloNodo("C1025","background-color", "red");
	//modificarEstiloNodo("C1025","visibility", "hidden");


}

