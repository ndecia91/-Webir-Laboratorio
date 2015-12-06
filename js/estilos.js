
var padding = 20;
var maxColumnas = 3;




var nodePadding = 10
var nodeWidth = 130;
var nodeHeight = 25;

var estilosNodos = 
{
	'content': 'data(name)',
	'text-valign': 'center',
	'text-halign': 'center',
	'shape':'roundrectangle',
	'width': nodeWidth,
	'text-wrap': 'wrap',
	'text-max-width' : nodeWidth,
	'text-max-height' : nodeHeight,
	'height': nodeHeight,
	'color':'white',
	'padding-left' : nodePadding,
	'padding-right' : nodePadding,
	'padding-bottom' : nodePadding,
	'padding-top' : nodePadding,
	'visibility': 'hidden',
	'display':'none',
	'cursor' : 'pointer',
	'border-width' : 0.8,
	'border-color' : '#333333',
	'font-size' : '11px',

}

var estilosAristas = 
{
	'width': 1.5,
	'color':'white',
	'target-arrow-shape': 'triangle',
	'target-arrow-color': '#9dbaea',
	'label': 'data(label)',
	'text-outline-color' : '#9dbaea',
	'labelGlowColor': 'red',
	'text-outline-color':'red',
	'text-background-color':'#ff3377',
	'font-size':'10px',
    'text-background-shape':'roundrectangle',
    'text-background-opacity':1.0,
    'text-border-opacity':1,
    'text-border-width':1,
    'text-border-style':'solid',
    'text-border-color':'#333333',
    'source-arrow-shape': 'circle',
    'text-border-opacity' : 0.8,
	'visibility': 'hidden',
	
}

var estilosAristaCurso = {
	'line-color': '#ff9900',
	'target-arrow-color': '#ff9900',
	 'source-arrow-color': '#ff9900',
}

var estilosAristaExamen = {
	'line-color': '#008000',
	'target-arrow-color': '#008000',
	'source-arrow-color': '#008000',
}


var colores = 
[
	'#0088cc', 
	'#9900cc',
	'#00cc99',
	'#cc9900',
	'#999999',
	'#ff3377',
	'#333399',
	'#00cbcc',
	'#9dbaea',
	'#8c1aff',
	'#00ace6'
]

function agregarEstilosSemestres(cyr)
{//'#f2f2f2'

	for (i = 1 ; i <= 10 ; i++) {

		modificarEstiloNodo(cyr ,i, 'background-color', '#f2f2f2');
		modificarEstiloNodo(cyr ,i, 'border-opacity','0.2');
		modificarEstiloNodo(cyr ,i, 'border-width', 2.0);
		modificarEstiloNodo(cyr ,i, 'background-opacity', 0.5);
		modificarEstiloNodo(cyr ,i, 'color', '#737373');
		modificarEstiloNodo(cyr ,i,  'text-valign','top');
		modificarEstiloNodo(cyr ,i,  'font-size','15px');
		modificarEstiloNodo(cyr ,i,  'font-weight','450');
	
		
       
	}

}





