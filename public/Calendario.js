//===========================================================================================================
var horary = new Array();

function request(){
    $.get('http://localhost:3000/reservations.json').done(function( data, error ) {    
        if(data.length>5000){
            document.location.href="/login";
        } else {
            for(var k=0;k<data.length;k++){
                var temp = new Array();
                temp['date']=data[k].date;
                temp['hour']=data[k].hour;
                temp['description']=data[k].description;
                temp['id']=data[k].id;
                horary.push(temp);
            }
            init();
        }
    });
}

class Reservaciones{
	constructor(){
		this.horas = [7,8,9,10,11,12,13,14,15,16,17,18,19,20]; 
        this.horarios = new Array();			
	}
	tablaHora(fecha){
		var evento;
		var boton;
		var id;
		var idBoton;
		
		for (var i=0; i<horary.length; i++) {
			if(fecha.localeCompare(horary[i]['date']) === 0){
				id = this.getPosHora(horary[i]['hour']);
				evento = document.getElementById("evento"+id);
				$(evento).empty();
				evento.appendChild( document.createTextNode(horary[i]['description'] ) );
				evento.setAttribute("class","btn btn-info");
				evento.setAttribute("style","height:30px; width:240px; color:#FFF");
				
				idBoton = "#"+(id+100);
				$(idBoton).attr('disabled', true);
			}
		}
	}
	//_____________________________________________________________________________
	
	//busca id de la hora y lo retorna
	getPosHora(hora){
		for(var i=0; i<this.horas.length; i++){
			if( hora===this.horas[i] ){
				return i;
			}
		}
		return 0;
	}
	//_____________________________________________________________________________
	
	//deja en disponible los horarios
	establecerHorarios(){
		var evento;
		var divBoton;
		var idBoton;
		
		for (var i=0; i<this.horas.length; i++) {
			evento = document.getElementById("evento"+i);
			$(evento).empty();
			evento.appendChild( document.createTextNode( 'Disponible' ) );
			evento.setAttribute("class","btn btn-default");
			evento.setAttribute("style","height:30px; width:240px; color:#09C");
			
			idBoton = "#"+(i+100);
			$(idBoton).attr('disabled', false);
		}
	}
	//_____________________________________________________________________________
	
	//inserta reservaciones
	insertar( fecha, hora, id){
		var a = document.getElementById(id);
		var direc = "/reservations/new?date="+fecha+"&hour="+hora;  
		$(a).attr('href',direc);
        $(a).trigger('click');
	}
	//_____________________________________________________________________________
	
	inhabilitarReservar(){
		var idBoton;
		for(var i=100; i<114; i++){
			idBoton = "#"+i;
			$(idBoton).attr('disabled', true);
		}
	}
	//_____________________________________________________________________________
	
	habilitarReservar(){
		var idBoton;
		for(var i=100; i<114; i++){
			idBoton = "#"+i;
			$(idBoton).attr('disabled', false);
		}
	}
	//_____________________________________________________________________________
	
};

//===========================================================================================================

class Calendario{
	constructor() {
		this.fechaActual = new Date();
		this.meses = new Array(6);
		
		this.diasMeses = [31, 29, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31];
		this.nombreMeses = ['Enero', 'Febrero', 'Marzo', 'Abril', 'Mayo', 'Junio', 'Julio', 
							'Agosto', 'Septiembre', 'Octubre', 'Noviembre', 'Diciembre'];
	}
	//_____________________________________________________________________________
	
	//crea el arreglo del mes
	mes(mes,year){
		var date = new Date(year,mes,0);
		var contPos = date.getDay();
		var contVal = 1;
		var i=0, j;
		while( i<6 ){
			j=0;
			var fila = new Array(7);
			while( j<7 ){
				if(i==0){	
					if(j>=contPos){
						fila[j] = contVal;
						contVal++;
					}
					else{
						fila[j] = ' ';
					}
				}
				else{
					if(contVal<=this.diasMeses[mes]){
						fila[j] = contVal;
						contVal++;
					}
					else{
						fila[j] = ' ';
					}
				}	
				j++;
			}
			this.meses[i] = fila.slice(0);
			i++;
		}
	}
	//_____________________________________________________________________________
	
	//da los valores de dias a los botones
	tablaMes(mes, year){
		$('#nombreMes').empty();
		for(var i=0; i<6; i++){
			for(var j=0; j<7; j++){
				$('#'+i.toString()+j.toString() ).empty();
			}
		}		
				
		this.mes(mes, year);
		
		var botonDia;
		var texto;
		
		var tituloMes = document.getElementById("nombreMes");
		tituloMes.appendChild( document.createTextNode( day+' - '+this.nombreMeses[mes]+' - '+year ) );
		
		for (var i=0; i<6; i++) {
			for (var j=0; j<7; j++) {
				botonDia = document.getElementById( i.toString()+j.toString() );
				texto = document.createTextNode( this.meses[i][j] );
				botonDia.appendChild( texto );
				botonDia.setAttribute("class","btn btn-info");
				botonDia.setAttribute("value",this.meses[i][j]);
				botonDia.setAttribute("style","height:70px; width:70px; font-size:x-large; font-weight:bold");
				if(j===5 || j===6){
					botonDia.setAttribute("class","btn btn-warning");
				}
				if(botonDia.value.localeCompare(' ')===0){
					botonDia.setAttribute("class","btn btn-warning");
				}
			}
		}
	}
	//_____________________________________________________________________________
	
};
	
//===========================================================================================================

var calendario;// = new Calendario();
var reservaciones;// = new Reservaciones();

var fechaA = new Date();
var day= fechaA.getDate();
var mes= fechaA.getMonth();
var year= fechaA.getFullYear();

//===========================================================================================================

function inicializar(){
	calendario.tablaMes(mes, year );
	reservaciones.establecerHorarios();
	reservaciones.tablaHora(year+'-'+(mes+1)+'-'+day);
}

//===========================================================================================================

function init(){
    calendario = new Calendario();
    reservaciones = new Reservaciones();
	
	var cad = '#selecName > option[value="'+mes+'"]';
	$(cad).attr('selected', 'selected');
	
	inicializar();
	
	$("button").click(function(){
		if(this.value>=1 && this.value<=31){
			reservaciones.habilitarReservar();
			
			day = this.value;
			$('#nombreMes').empty();
			var tituloMes = document.getElementById("nombreMes");
			tituloMes.appendChild( document.createTextNode( day+' - '+calendario.nombreMeses[mes]+' - '+year ) );
			
			//se procede a cargar las reservaciones
			reservaciones.establecerHorarios();
			var month = parseInt(mes)+1;
			reservaciones.tablaHora(year+'-'+month+'-'+day);
			
			if(this.id.charAt(1).localeCompare('5')===0 || this.id.charAt(1).localeCompare('6')===0 ){
				reservaciones.inhabilitarReservar();
			}
		}
		
		if( this.value.localeCompare(' ')===0 ){
			reservaciones.inhabilitarReservar();
		}
		
    });
	
	$("a").click(function(){
		if(this.id>=100 && this.id<=113){
			var fecha = year+'-'+(mes+1)+'-'+day;
			var evento = document.getElementById( "evento"+(this.id-100) ).value;
			var hora = obtenerHora( this.id );
			
			reservaciones.insertar(fecha, hora, this.id);
			
			reservaciones.establecerHorarios();
			reservaciones.tablaHora(year+'-'+(mes+1)+'-'+day);
		}
	});
}

$(document).on("ready", function(){
    request();	
});

//===========================================================================================================
	
function obtenerHora(id){
	var hora;
	switch(id){
		case '100' :{
			hora = '7';
			break;
		}
		case '101' :{
			hora = '8';
			break;
		}
		case '102' :{
			hora = '9';
			break;
		}
		case '103' :{
			hora = '10';
			break;
		}
		case '104' :{
			hora = '11';
			break;
		}
		case '105' :{
			hora = '12';
			break;
		}
		case '106' :{
			hora = '13';
			break;
		}
		case '107' :{
			hora = '14';
			break;
		}
		case '108' :{
			hora = '15';
			break;
		}
		case '109' :{
			hora = '16';
			break;
		}
		case '110' :{
			hora = '17';
			break;
		}
		case '111' :{
			hora = '18';
			break;
		}
		case '112' :{
			hora = '19';
			break;
		}
		case '113' :{
			hora = '20';
			break;
		}
		default:{
			hora = null;
			break;
		}
	}
	return hora;
}

//===========================================================================================================