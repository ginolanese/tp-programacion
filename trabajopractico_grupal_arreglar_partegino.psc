Proceso trabajopracticogrupal
	Definir articulos,rubro Como Caracter;
	Definir n,i,j,permiso, codigo,opcion Como Entero;
	Definir stock, importe_total Como Real;
	Escribir "Hola, ingrese la cantidad de articulos que quiere ingresar";
	Leer n;
	//inicio de ingreso de articulos
	Dimension articulos[n,8];
	Para i<-1 Hasta n Con Paso 1 Hacer
		Para j<-1 Hasta 8 Con Paso 1 Hacer
			
			Segun j Hacer
				1:
					Escribir "Ingrese el nombre del producto";
					Leer articulos[i,j];
				2:
					validacion(articulos,n,i,j,rubro);
				3:
					tiporubro(articulos,n,i,j,rubro);
				4:
					Escribir "Ingrese la descripción del producto";
					Leer articulos[i,j];
				5:
					Escribir "Ingrese el precio del articulo";
					Leer articulos[i,j];
				6:
					Escribir "Ingrese la cantidad de productos que hay";
					Leer articulos[i,j];
				7:	
					Escribir "Ingrese la cantidad de articulos vendidos en la 1ra quincena";
					Leer articulos[i,j];
				8:
					Escribir "Ingrese la cantidad de articulos vendidos en la 2da quincena";
					Leer articulos[i,j];
				De Otro Modo:
					Escribir "No hay mas";
			FinSegun
		FinPara
	FinPara
	//fin de ingreso de articulos
	
	//muestra del ingreso de articulos
	Para i<-1 Hasta n Con Paso 1 Hacer
		Para j<-1 Hasta 8 Con Paso 1 Hacer
			Escribir articulos[i,j];
		FinPara
	FinPara
	
	//inicio del menu
	Escribir "Quiere desplegar el menu: si(1), no(2):";
	Leer permiso;
	Mientras permiso=1 Hacer
		Escribir "Presione el numero correspondiente, para la accion que quiere realizar.";
		Escribir "Mostrar lista de articulos ordenada por descripción(1)";
		Escribir "Mostrar lista de articulos ordenada por cantidad vendida(2)";
		Escribir "Mostrar stock actual de articulos(3)";
		Escribir "Buscar articulos por codigod(4)";
		Escribir "Mostrar estadisticas(5)";
		Escribir "Salir(6)";
		Leer opcion;
		Segun opcion Hacer
			1:
				// poner parte(ezequiel) 
				mostrarArticulosPorDescripcion(articulos, n);
				
				Escribir "Usted quiere continuar en el menu, presione: si(1) o no(2)";
				Leer permiso;
			2:
				//poner parte(sebastian)
				mostrar_cantidad_vendida(articulos,n);
				
				
				Escribir "Usted quiere continuar en el menu, presione: si(1) o no(2)";
				Leer permiso;
			3://poner parte (luigi)
				Lista_stock_actual(articulos, n);
				
				Escribir "Usted quiere continuar en el menu, presione: si(1) o no(2)";
				Leer permiso;
			4://poner parte(gino)
				
				buscar_articulos(articulos,n);
				
				
				Escribir "Usted quiere continuar en el menu, presione: si(1) o no(2)";
				Leer permiso;
			5:	//poner parte (augusto)
				
				submenu(articulos,n);
				
				Escribir "Usted quiere continuar en el menu, presione: si(1) o no(2)";
				Leer permiso;
			De Otro Modo:
				permiso=2;
		FinSegun
		//fin de menu
	FinMientras	
FinProceso


//inicio de SubProceso validacion

SubProceso  validacion(articulos,n,i,j,rubro Por referencia)
	Definir num Como Caracter;
	Definir codigo Como entero;
	Escribir "Ingrese el rubro del producto(100(Tornillos y tuercas),300(Adhesivos),450(Herrajes),680(Pinturas),720(Electricidad))";
	Leer rubro;
	Mientras rubro<>"100" & rubro<>"300" & rubro<>"450" & rubro<>"680" & rubro<>"720" Hacer
		Escribir "El rubro del articulo esta mal, los rubros pueden ser: 100,350,450,680,720";
		Leer rubro;
	FinMientras
	
	Escribir "Ingrese el codigo del producto, el codigo tiene que tener 5 digitos";
	leer codigo;
	Mientras codigo<9999|codigo>=99999 Hacer
		Escribir "El codigo no puede ser mayor, ni menor a 5 digistos, coloquelo nuevamente";
		Leer codigo;
	FinMientras
	num=ConvertirATexto(codigo);
	articulos[i,j]=rubro+num;
	Escribir articulos[i,j];
FinSubProceso
//fin de subproceso validacion


//inicio de SubProceso tiporubro
SubProceso tiporubro(articulos,n,i,j,rubro)
	Escribir rubro;
	
	Segun rubro Hacer
		"100":
			articulos[i,j]="Tornillos y tuercas";
		"300":
			articulos[i,j]="Adhesivos";
		"450":
			articulos[i,j]="Herrajes";
			
		"680":
			articulos[i,j]="Pinturas";
			
		"720":
			articulos[i,j]="Electricidad";
			
		De Otro Modo:
			escribir"No hay";
	FinSegun
	Escribir articulos[i,j];
FinSubProceso
//fin de SubProceso tiporubro


// inicio de subproceso articulos ordenados por descripcion
SubProceso mostrarArticulosPorDescripcion(articulos, n)
	
	definir i,j,k como entero;
	Definir aux Como Caracter;
	
	Para i <- 1 Hasta n Con Paso 1 Hacer
		Para j <- 1 Hasta n - i Con Paso 1 Hacer
			Si articulos[j, 4] > articulos[j + 1, 4] Entonces
				Para k <- 1 Hasta 8 Con Paso 1 Hacer
					// Intercambiar los valores de los artículos
					aux <- articulos[j, k];
					articulos[j, k] <- articulos[j + 1, k];
					articulos[j + 1, k] <- aux;
				FinPara
			FinSi
		FinPara
	FinPara
	
	// Mostrar la lista de artículos ordenada por descripción
	Para i <- 1 Hasta n Con Paso 1 Hacer
		Para j <- 1 Hasta 8 Con Paso 1 Hacer
			Si j = 4 Entonces
				Escribir "Descripción: " , articulos[i, j];
			FinSi
			
			Si j = 5 Entonces
				Escribir "Precio Venta: " , articulos[i, j];
			finsi
			Si j = 2 Entonces
				Escribir "Código: " , articulos[i, j];
			finsi
		FinPara
	FinPara
FinSubProceso

//Inicio Mostrar stock actual de articulos
SubProceso Lista_stock_actual(articulos,n)
	// mostrar stock actual de artículos:
	// los datos a mostrar para cada artículo son:
	// * código
	// * descripción
	// * stock actual (es la cantidad existente descontadas las cant.vendidas x quincena
	Definir i, stock_actual, stock_total, venta_1quinc, venta_2quinc Como Entero;
	
	Escribir "*--------------------------------------------------------------------------------------------*";
	Escribir "* Listado de stock actualizado de artículos *";
	Escribir "*--------------------------------------------------------------------------------------------*";
	Escribir " Código Producto Descripción Stock actual";
	Escribir " ---------------- ----------- ------------";
	Para i=1 Hasta n Con Paso 1 Hacer
		stock_total=ConvertirANumero(articulos[i,6]);
		venta_1quinc=ConvertirANumero(articulos[i,7]);
		venta_2quinc=ConvertirANumero(articulos[i,8]);
		stock_actual=stock_total-(venta_1quinc+venta_2quinc);
		Escribir " ",articulos[i,2]," ", articulos[i,4]," ", stock_actual;
	FinPara
FinSubProceso

//Inicio buscar articulos por codigo
SubProceso buscar_articulos(articulos, n)
	Definir codigo Como Caracter;
	Escribir "Ingrese el código del artículo: ";
	Leer codigo;
	articulos = validacion_codigo;
	
	Si articulos <> -1 Entonces
	Escribir "Datos del artículo:";
	Escribir "Código: ", codigo;
	Escribir "Cantidades vendidas por quincena:";
	Para quincena = 1 Hasta 2 Hacer

	Escribir "Quincena ", quincena, ": ", cantidad_vendida;
	FinPara

	stock = stock_actual;
	Escribir "Stock actual: ", stock;

	importe_total = calcular_importe_total;
	Escribir "Importe total de venta en el mes: ", importe_total;
	Sino
	Escribir "No existe artículo con ese código.";
	FinSi
FinSubProceso


//inicio de punto 5 del menu
SubProceso submenu (articulos,n)
	Definir eleccion Como Caracter;
	Escribir "Este punto del menu tiene un sub menu elija: ";
	Escribir "a) Porcentaje de articulos vendidos en cada rubro";
	Escribir "b) Porcentaje de venta de cada quincena por Rubro sobre el total del mes";
	Escribir "c) Rubro con mayor importe total de ventas en cada quincena";	
	Leer eleccion;
	
	Segun eleccion Hacer
		"a":
			stats(articulos,n);
		"b":
			ventaquincena(articulos,n);
		"c":
			mayor_importe(articulos,n);
		De Otro Modo:
			Escribir "no existe esa opcion";
	FinSegun
	
FinSubProceso


//inicio Subproceso mostrar estadisticas
SubProceso stats(articulos,n) 
	Definir i,j,maux,cantidadtt,cantidadaa,cantidadh,cantidadp,cantidade,vpaux,vsaux,vtornillo,vadhesivos,vherraje,vpinturas,velectricidad Como Entero;
	Definir tornillopor,adhesivospor,herrajespor,pinturaspor,electricidadpor Como Real;
	Para i<-1 Hasta n Con Paso 1 Hacer
		maux=ConvertirANumero(articulos[i,6]);
		vpaux=ConvertirANumero(articulos[i,7]);
		vsaux=ConvertirANumero(articulos[i,8]);
		Segun articulos[i,3] Hacer
			"Tornillos y tuercas":
				cantidadtt=cantidadtt+maux;//contador de la cantidad de stock en este rubro					
				vtornillo=vtornillo+vpaux+vsaux;// se suma todas las ventas de las quincenas
				tornillopor=vtornillo/cantidadtt*100;//se hace la escuacion para savar el porcentaje
			"Adhesivos":
				cantidadaa=cantidadaa+maux;	
				vadhesivos=vadhesivos+vpaux+vsaux;
				adhesivospor=vadhesivos/cantidadaa*100;
			"Herrajes":
				cantidadh=cantidadh+maux;	
				vherraje=vherraje+vpaux+vsaux;
				herrajespor=vherraje/camtidad*100;
			"Pinturas":
				cantidadp=cantidadp+maux;	
				vpinturas=vpinturas+vpaux+vsaux;
				pinturaspor=vpinturas/cantidadp*100;
			"Electricidad":
				cantidade=cantidade+maux;	
				velectricidad=velectricidad+vpaux+vsaux;
				electricidadpor=velectricidad/cantidade*100;
			De Otro Modo:
				Escribir "nada";
		FinSegun
	FinPara
	
	
	//tornillos
	Escribir "Tornillos y tuercas";
	Escribir "";
	Escribir"cantidad de productos en el rubro 100(tornillos y tuercas): ", cantidadtt;
	Escribir "las ventas del rubro 100(tornillos y tuercas) es: ",vtornillo ;
	Escribir "el porcentaje de venta del rubro 100 (tornillos y tuecas), es de: ", tornillopor, "%";
	Escribir "";
	//tornillos
	
	//adhesivos
	Escribir "Adhesivos";
	Escribir "";
	Escribir"cantidad de productos en el rubro 300(adhesivos): ", cantidadaa;
	Escribir "las ventas del rubro 300(adhesivos) es: ", vadhesivos;
	Escribir "el porcentaje de venta del rubro 300 (adhesivos), es de: ",adhesivospor , "%";
	Escribir "";
	//adhesivos
	
	
	//herrajes
	Escribir "Herrajes";
	Escribir "";
	Escribir"cantidad de productos en el rubro 450(Herrajes): ", cantidadh;
	Escribir "las ventas del rubro 450(herrajes) es: ", vherraje;
	Escribir "el porcentaje de venta del rubro 450(herrajes), es de: ",herrajespor , "%";
	Escribir "";
	//herrajes
	
	
	//Pinturas
	Escribir "Pinturas";
	Escribir "";
	Escribir"cantidad de productos en el rubro 680(pinturas): ", cantidadp;
	Escribir "las ventas del rubro 680(pinturas) es: ", vpinturas;
	Escribir "el porcentaje de venta del rubro 680(pinturas), es de: ",pinturaspor , "%";
	Escribir "";
	//Pinturas
	
	
	//electricadad
	Escribir "Electricidad";
	Escribir "";
	Escribir"cantidad de productos en el rubro 720(electricidad): ", cantidade;
	Escribir "las ventas del rubro 720(electricidad) es: ", vpinturas;
	Escribir "el porcentaje de venta del rubro 720(electricidad), es de: ",electricidadpor , "%";
	//electricadad
FinSubProceso




//SubProceso de venta de quincena
SubProceso ventaquincena(articulos,n)
	Definir i,vqp,vqs,vtotal,primeraquincenat,segundaquincenat,primeraquincenaa,segundaquincenaa,primeraquincenah,segundaquincenah,primeraquincenap,segundaquincenap,primeraquincenae,segundaquincenae Como Entero; 
	Definir vqptornillos,vqpadhesivos,vqpherrajes,vqppinturas,vqpelectricidad,vqstornillos,vqsadhesivos,vqsherrajes,vqspinturas,vqselectricidad Como Real;
	Para i<-1 Hasta n Con Paso 1 Hacer
		vqp=ConvertirANumero(articulos[i,7]);
		vqs=ConvertirANumero(articulos[i,8]);
		
		Segun articulos[i,3] Hacer
			"Tornillos y tuercas":
				primeraquincenat=primeraquincenat+vqp;//contador de ventas en primera quincena
				segundaquincenat=segundaquincenat+vqs;;//contador de ventas de segunda quincena
				vqptornillos=primeraquincenat/(primeraquincenat+segundaquincenat)*100;//ecuacion para sacar porcentaje de la primera quincena
				vqstornillos=segundaquincenat/(primeraquincenat+segundaquincenat)*100;//ecuacion para sacar porcentaje de la segunda quincena
			"Adhesivos":
				primeraquincenaa=primeraquincenaa+vqp;
				segundaquincenaa=segundaquincenaa+vqs;
				vqpadhesivos=primeraquincenaa/(primeraquincenaa+segundaquincenaa)*100;
				vqsadhesivos=segundaquincenaa/(primeraquincenaa+segundaquincenaa)*100;
			"Herrajes":
				primeraquincenah=primeraquincenah+vqp;
				segundaquincenah=segundaquincenah+vqs;
				vqpherrajes=primeraquincenah/(primeraquincenah+segundaquincenah)*100;
				vqsherrajes=segundaquincenah/(primeraquincenah+segundaquincenah)*100;
			"Pinturas":	
				primeraquincenap=primeraquincenap+vqp;
				segundaquincenap=segundaquincenap+vqs;
				vqppinturas=primeraquincenap/(primeraquincenap+segundaquincenap)*100;
				vqspinturas=segundaquincenap/(primeraquincenap+segundaquincenap)*100;
			"Electricidad":	
				primeraquincenae=primeraquincenae+vqp;
				segundaquincenae=segundaquincenae+vqs;
				vqpelectricidad=primeraquincenae/(primeraquincenae+segundaquincenae)*100;
				vqselectricidad=segundaquincenae/(primeraquincenae+segundaquincenae)*100;
			De Otro Modo:
				Escribir "nada";
		FinSegun
		
	FinPara
	//tuercas y tornillos
	Escribir "Tuercas y Tornillos";
	Escribir "";
	Escribir "el porcentaje de venta en la primera quincena del rubro 100(tornillos y tuercas) es de: ",vqptornillos, "%";
	Escribir "el porcentaje de venta en la segunda quincena del rubro 100(tornillos y tuercas) es de: ",vqstornillos, "%";
	Escribir "";
	//
	
	
	//adhesivos
	Escribir "Adhesivos";
	Escribir "";
	Escribir "el porcentaje de venta en la primera quincena del rubro 300(adhesivos) es de: ",vqpadhesivos, "%";
	Escribir "el porcentaje de venta en la segunda quincena del rubro 300(adhesivos) es de: ",vqsadhesivos, "%";
	Escribir "";
	//
	
	//herrajes
	Escribir "Herrajes";
	Escribir "";
	Escribir "el porcentaje de venta en la primera quincena del rubro 450(herrajes) es de: ",vqpherrajes, "%";
	Escribir "el porcentaje de venta en la segunda quincena del rubro 450(herrajes) es de: ",vqsherrajes, "%";
	Escribir "";
	//
	
	
	//Pinturas
	Escribir "Pinturas";
	Escribir "";
	Escribir "el porcentaje de venta en la primera quincena del rubro 680(pinturas) es de: ",vqppinturas, "%";
	Escribir "el porcentaje de venta en la segunda quincena del rubro 680(pinturas) es de: ",vqspinturas, "%";
	Escribir "";
	//
	
	
	//Electricidad
	Escribir "Electricidad";
	Escribir "";
	Escribir "el porcentaje de venta en la primera quincena del rubro 720(electricidad) es de: ",vqpelectricidad, "%";
	Escribir "el porcentaje de venta en la segunda quincena del rubro 720(electricidad) es de: ",vqselectricidad, "%";
	Escribir "";
	//
	
FinSubProceso
//sin de subproceso venta de quincena
//inicio del arreglo mayor importe
SubProceso mayor_importe(articulos,n)
	Definir j,h,arreglosubmenu,i,auxp,auxs,pqtornillos,pqadhesivos,pqherrajes,pqpinturas,pqelectricidad,sqtornillos,sqadhesivos,sqherrajes,sqpinturas,sqelectricidad Como Entero;
	Definir posmayor1,posmayor2,aux1,aux2,auxprecio,pqpretornillos,pqpreadhesivos,pqpreherrajes,pqprepinturas,pqpreelectricidad,sqpretornillos,sqpreadhesivos,sqpreherrajes,sqprepinturas,sqpreelectricidad Como Real;
	Dimension arreglosubmenu[5,2];// posicion [x,1] primera quincena, [x,2] segunda quincena
	
	Para i<-1 Hasta n Con Paso 1 Hacer
		auxp=ConvertirANumero(articulos[i,7]);
		auxs=ConvertirANumero(articulos[i,8]);
		auxprecio=ConvertirANumero(articulos[i,5]);
		
		Segun articulos[i,3] Hacer
			"Tornillos y tuercas":
				pqtornillos=pqtornillos+auxp;//contador de ventas en primera quincena
				sqtornillos=sqtornillos+auxs;//contador de ventas de segunda quincena
				pqpretornillos=pqpretornillos+(pqtornillos*auxprecio);//ecuacion para sacar el importe de la primera quincena
				sqpretornillos=sqpretornillos+(sqtornillos*auxprecio);//ecuacion para sacar el importe de la segunda quincena
				arreglosubmenu[1,1]=pqpretornillos;//se guarda en un arreglo
				arreglosubmenu[1,2]=sqpretornillos;//se guarda en un arreglo
			"Adhesivos":
				pqadhesivos=pqadhesivos+auxp;
				sqadhesivos=sqadhesivos+auxs;
				pqpreadhesivos=pqpreadhesivos+(pqadhesivos*auxprecio);
				sqpreadhesivos=sqpreadhesivos+(sqadhesivos*auxprecio);
				arreglosubmenu[2,1]=pqpreadhesivos;
				arreglosubmenu[2,2]=sqpreadhesivos;
			"Herrajes":
				pqherrajes=pqherrajes+auxp;
				sqherrajes=sqherrajes+auxs;
				pqpreherrajes=pqpreherrajes+(pqherrajes*auxprecio);
				sqpreherrajes=sqpreherrajes+(sqherrajes*auxprecio);
				arreglosubmenu[3,1]=pqpreherrajes;
				arreglosubmenu[3,2]=sqpreherrajes;
			"Pinturas":
				pqpinturas=pqpinturas+auxp;
				sqpinturas=sqpinturas+auxs;
				pqprepinturas=pqprepinturas+(pqpinturas*auxprecio);
				sqprepinturas=sqprepinturas+(sqpinturas*auxprecio);
				arreglosubmenu[4,1]=pqprepinturas;
				arreglosubmenu[4,2]=sqprepinturas;
			"Electricidad":
				pqelectricidad=pqelectricidad+auxp;
				sqelectricidad=sqelectricidad+auxs;
				pqpreelectricidad=pqpreelectricidad+(pqelectricidad*auxprecio);
				sqpreelectricidad=sqpreelectricidad+(sqelectricidad*auxprecio);
				arreglosubmenu[5,1]=pqpreelectricidad;
				arreglosubmenu[5,2]=sqpreelectricidad;
			De Otro Modo:
				Escribir "nada";
		FinSegun
	FinPara
	
	
	//incio de ordenamientos
	Para j<-1 Hasta 5-1 Con Paso 1 Hacer
		posmayor1=j;
		Para h<-j+1 Hasta 2 Con Paso 1 Hacer
			Si arreglosubmenu[posmayor1,1]<arreglosubmenu[h,1]  Entonces
				posmayor1=h;
			FinSi
		FinPara
		aux1=arreglosubmenu[j,1];
		arreglosubmenu[j,1]=arreglosubmenu[posmayor1,1];
		arreglosubmenu[posmayor1,1]=aux1;
	FinPara
	
	
	Para j<-1 Hasta 5-1 Con Paso 1 Hacer
		posmayor2=j;
		Para h<-j+1 Hasta 2 Con Paso 1 Hacer
			Si arreglosubmenu[posmayor2,2]<arreglosubmenu[h,2]  Entonces
				posmayor2=h;
			FinSi
		FinPara
		aux2=arreglosubmenu[j,2];
		arreglosubmenu[j,2]=arreglosubmenu[posmayor2,2];
		arreglosubmenu[posmayor2,2]=aux2;
	FinPara
	
	//fin de ornamientos
	
	//se busca el nro del mayor precio de la primera quincena
	Segun arreglosubmenu[1,1] Hacer
		pqpretornillos:
			Escribir "en la primera quincena el rubro que mas gasto fue 100(tornillos y tuercas) ","y el total fue: $", arreglosubmenu[1,1];
		pqpreadhesivos:
			Escribir "en la primera quincena el rubro que mas gasto fue 300(adhesivos) ","y el total fue: $", arreglosubmenu[1,1];
		pqpreherrajes:
			Escribir "en la primera quincena el rubro que mas gasto fue 450(herrajes) ","y el total fue: $", arreglosubmenu[1,1];
		pqprepinturas:
			Escribir "en la primera quincena el rubro que mas gasto fue 680(pinturas) ","y el total fue: $", arreglosubmenu[1,1];
		pqpreelectricidad:
			Escribir "en la primera quincena el rubro que mas gasto fue 720(electricidad) ","y el total fue: $", arreglosubmenu[1,1];
		De Otro Modo:
			
	FinSegun
	Escribir "casa";
	//se busca el nro del mayor precio de la segunda quincena
	Segun arreglosubmenu[1,2] Hacer
		sqpretornillos:
			Escribir "en la segunda  quincena el rubro que mas gasto fue 100(tornillos y tuercas) ","y el total fue: $", arreglosubmenu[1,2];
		sqpreadhesivos:
			Escribir "en la segunda quincena el rubro que mas gasto fue 300(adhesivos) ","y el total fue: $", arreglosubmenu[1,2];
		sqpreherrajes:
			Escribir "en la segunda quincena el rubro que mas gasto fue 450(herrajes) ","y el total fue: $", arreglosubmenu[1,2];
		sqprepinturas:
			Escribir "en la segunda quincena el rubro que mas gasto fue 680(pinturas) ","y el total fue: $", arreglosubmenu[1,2];
		sqpreelectricidad:
			Escribir "en la segunda quincena el rubro que mas gasto fue 720(electricidad) ","y el total fue: $", arreglosubmenu[1,2];
		De Otro Modo:
			
	FinSegun
	//se muestran todos los datos ordenados del importe
	Escribir "";
	Escribir "cuadro ordenado:";
	Para j<-1 Hasta 5 Con Paso 1 Hacer
		Para h<-1 Hasta 2 Con Paso 1 Hacer
			Si h=1 Entonces
				Escribir "pimera quincena ","en la posicion ",j, ",",h," ", arreglosubmenu[j,h];
			SiNo
				Escribir "segunda quincena ","en la posicion ",j, ",",h," ", arreglosubmenu[j,h];
			FinSi
		FinPara
	FinPara
FinSubProceso
//fin de subproceso mayor importe


SubProceso mostrar_cantidad_vendida(articulos,n)
	Definir i,j,auxpqv,auxsqv,cantidadtotalv,auxprecio,importe,pos_mayor Como Entero;
	Definir cantidadv,auxcomp,importec,cantidadtotalvc Como Caracter;
	Dimension  cantidadv[n,4];
	Para i<-1 Hasta n Con Paso 1 Hacer
			auxpqv=ConvertirANumero(articulos[i,7]);
			auxsqv=ConvertirANumero(articulos[i,8]);
			auxprecio=ConvertirANumero(articulos[i,5]);
			cantidadv[i,1]=articulos[i,2];
			cantidadv[i,2]=articulos[i,4];
			cantidadtotalv=auxpqv+auxsqv;
			importe=cantidadtotalv*auxprecio;
			cantidadtotalvc=ConvertirATexto(cantidadtotalv);
			importec=ConvertirATexto(importe);
			cantidadv[i,3]=cantidadtotalvc;
			cantidadv[i,4]=importec;
	FinPara
	
	
	Para i<-1 Hasta n-1 Con Paso 1 Hacer
		pos_mayor=i;
		Para j<-i+1 Hasta n Con Paso 1 Hacer
			
			Si cantidadv[j,3]>cantidadv[pos_mayor,3] Entonces
				pos_mayor=j;
			FinSi
				
		FinPara
		
		auxcomp=cantidadv[i,3];
		cantidadv[i,3]=cantidadv[pos_mayor,3];
		cantidadv[pos_mayor,3]=auxcomp;
	FinPara
	Para i<-1 Hasta n Con Paso 1 Hacer
		Para j<-1 Hasta 4 Con Paso 1 Hacer
			
			Segun j Hacer
				1:
					Escribir "El codigo del articulo es:",cantidadv[i,j];
				2:
					Escribir "La descripción del articulo es:",cantidadv[i,j];
				3:
					Escribir "La cantidad de articulos vendidos al mes es:",cantidadv[i,j];
				4:	
					Escribir "El importe total de ventas del articulo es:",cantidadv[i,j];
				De Otro Modo:
					Escribir "nada";
			FinSegun
			
			
			
		FinPara
	FinPara
	
	
FinSubProceso
	