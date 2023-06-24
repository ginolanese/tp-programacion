Proceso trabajopracticogrupal
	Definir articulos,rubro Como Caracter;
	Definir n,i,j,permiso, codigo, articulos,opcion Como Entero;
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
				
				Escribir "Usted quiere continuar en el menu, presione: si(1) o no(2)";
				Leer permiso;
			3://poner parte (luigi)
				
				
				Escribir "Usted quiere continuar en el menu, presione: si(1) o no(2)";
				Leer permiso;
			4://poner parte(gino)

					Escribir "Ingrese el código del artículo: "
					Leer codigo
					
					articulos = validacion_codigo
					
					Si articulos <> -1 Entonces
						Escribir "Datos del artículo:"
						Escribir "Código: ", codigo
						Escribir "Cantidades vendidas por quincena:"
						Para quincena = 1 Hasta 2
							Escribir "Quincena ", quincena, ": ", cantidad_vendida
						FinPara
						
						stock = stock_actual
						Escribir "Stock actual: ", stock
						
						importe_total = calcular_importe_total
						Escribir "Importe total de venta en el mes: ", importe_total
					Sino
						Escribir "No existe artículo con ese código."
					FinSi
				
				
				Escribir "Usted quiere continuar en el menu, presione: si(1) o no(2)";
				Leer permiso;
			5:	//poner parte (augusto)
				
				
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
	Escribir "Ingrese el rubro del producto";
	Leer rubro;
	Mientras rubro<>"100" & rubro<>"300" & rubro<>"450" & rubro<>"680" & rubro<>"720" Hacer
		Escribir "El rubro del articulo esta mal, los rubros pueden ser: 100,350,450,680,720";
		Leer rubro;
	FinMientras

	Escribir "Ingrese el codigo del producto";
	leer codigo;
	Mientras codigo>=99999 Hacer
		Escribir "El codigo no puede ser mayor a 5 digistos, coloquelo nuevamente";
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
	
	definir i,j como entero;
	

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
				Escribir "Descripción: " + articulos[i, j];
			FinSi
			
				Si j = 5 Entonces
					Escribir "Precio Venta: " + articulos[i, j];
					finsi
					Si j = 1 Entonces
						Escribir "Código: " + articulos[i, j];
						finsi
					FinPara
				FinPara
FinSubProceso




