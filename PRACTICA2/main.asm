
print macro  p
mov ax,@data
mov ds,ax
mov ah,09h ;numero de funcion para imprimir cadena en pantalla
mov dx,offset p;equivalente a lea dx,caden,inicializa en dx la posicion donde comienza la cadena
int 21h
endm

getChar macro
	mov AH, 08
	int 21
endm

sumar macro a
	inc a
endm



.MODEL SMALL
.RADIX 16
.STACK
;; PILA
.DATA
;;
clave_capturada        db     09  dup (0)
usuario_capturado      db     06  dup (0)
espacio_leido          db     00
estado                 db     00
buffer_linea           db     0ff dup (0)
tam_liena_leida        db     00
handle_conf            dw     0000
nombre_conf            db     "PRA2.CNF", 00



cadena1 db 0ah,0dh,'Universidad de San Carlos de Guatemala', '$'
cadena2 db 0ah,0dh,'Facultad de Ingenieria', '$'
cadena3 db 0ah,0dh, 'Escuela de Vacaciones', '$'
cadena4 db 0ah,0dh,'Arquitectura de Computadoras y Ensambladores 1','$'

cadena5 db 0ah,0dh,'Nombre: Cristian Daniel Gomez Esobar','$'
cadena6 db 0ah,0dh,'Carné: 202107190','$'

opcionP db 0ah,0dh,'1) Prroductos', '$'
opcionP1 db 0ah,0dh,'1) Ingreso de productos', '$'
opcionP2 db 0ah,0dh,'2) Eleminacion de productos', '$'
opcionP3 db 0ah,0dh,'3) Visualizacion de productos', '$'
opcionP4 db 0ah,0dh,'4) Volver al menu principal', '$'
opcionP5 db 0ah,0dh,'5) Salir', '$' 


;; tokens
tk_creds               db     0e, "[credenciales]"
tk_nombre              db     07, "usuario"
tk_clave               db     05, "clave"
tk_igual               db     01, "="
tk_comillas            db     01, '"'

tk_n              db      "cgomez"
tk_c              db      "202107190"


opcionV db 0ah,0dh,'2) Ventas', '$'
opcionV1 db 0ah,0dh,'1) Ingreso de ventas', '$'
opcionV2 db 0ah,0dh,'2) Volver al menu principal', '$'

eliminado db 0ah,0dh,'producto eliminado', '$'

opcionH db 0ah,0dh,'3) Herramientas', '$'
opcionH1 db 0ah,0dh,'1) Generacion de catalogo completo', '$'
opcionH2 db 0ah,0dh,'2) Reporte alfabetico de productos', '$'
opcionH3 db 0ah,0dh,'3) Reporte de ventas', '$'
opcionH4 db 0ah,0dh,'4) Reporte de productos sin exitencias', '$'
opcionH5 db 0ah,0dh,'5) Volver al menu principal', '$'
opcionH6 db 0ah,0dh,'6) Salir', '$'

opcionS db 0ah,0dh,'4) Salir', '$'
counter dw 0 ; Contador inicializado en 0
counter_b dw 0 ; Contador inicializado en 0
counter_c dw 0 ; Contador inicializado en 0
counter_d dw 0 ; Contador inicializado en 0
counter_e dw 0 ; Contador inicializado en 0
counter_f dw 0 ; Contador inicializado en 0
counter_g dw 0 ; Contador inicializado en 0
counter_h dw 0 ; Contador inicializado en 0
counter_i dw 0 ; Contador inicializado en 0
counter_j dw 0 ; Contador inicializado en 0
counter_k dw 0 ; Contador inicializado en 0
counter_l dw 0 ; Contador inicializado en 0
counter_m dw 0 ; Contador inicializado en 0
counter_n dw 0 ; Contador inicializado en 0
counter_nn dw 0 ; Contador inicializado en 0
counter_o dw 0 ; Contador inicializado en 0
counter_p dw 0 ; Contador inicializado en 0
counter_q dw 0 ; Contador inicializado en 0
counter_r dw 0 ; Contador inicializado en 0
counter_s dw 0 ; Contador inicializado en 0
counter_t dw 0 ; Contador inicializado en 0
counter_u dw 0 ; Contador inicializado en 0
counter_v dw 0 ; Contador inicializado en 0
counter_w dw 0 ; Contador inicializado en 0
counter_x dw 0 ; Contador inicializado en 0
counter_y dw 0 ; Contador inicializado en 0
counter_z dw 0 ; Contador inicializado en 0




a   db     'A'
b   db     'B'
cc   db     'C'
d   db     'D'
e   db     'E'
f   db     'F'
g   db     'G'
h   db     'H'
i   db     'I'
j   db     'J'
k   db     'K'
l   db     'L'
m   db     'M'
n   db     'N'
nn   db     'Ñ'
o   db     'O'
p   db     'P'
q   db     'Q'
r   db     'R'
s   db     'S'
t   db     'T'
u   db     'U'
v   db     'V'
w   db     'W'
x   db     'X'
y   db     'Y'
z   db     'Z'





tam_encabezado_html    db     0c
encabezado_html        db     "<html><body>"
tam_inicializacion_tabla   db   4F
tam_inicializacion_tabla_ABC   db  3B
inicializacion_tabla   db     '<table border="1"><tr><td>codigo</td><td>precio</td><td>unidades</td><td>descripcion</td></tr>'
tam_cierre_tabla       db     8
cierre_tabla           db     "</table>"
tam_footer_html        db     0e
footer_html            db     "</body></html>"
td_html                db     "<td>"
tdc_html               db     "</td>"
tr_html                db     "<tr>"
trc_html               db     "</tr>"
;;
inicializacion_tabla_ABC   db     '<table border="1"><tr><td>descripcion</td><td>cantidad</td></tr>'

;;
ceros          db     2b  dup (0)
;; VARIABLES | MEMORIA RAM
numero           db   05 dup (30)
;; 
usac       db    "                                            ",0a,"$"
titulo_producto db  "PRODUCTOS",0a,"$"
sub_prod        db  "    ",0a,"$"
titulo_ventas   db  "VENTAS",0a,"$"
sub_vent        db  "======",0a,"$"
titulo_herras   db  "HERRAMIENTAS",0a,"$"
sub_herr        db  "============",0a,"$"
prompt     db    "Elija una opcion:",0a,"$"
prompt_code      db    "Codigo: ","$"
prompt_name      db    "Nombre: ","$"
prompt_price     db    "Precio: ","$"
prompt_units     db    "Unidades: ","$"


espacio_largo    db    "                   ","$"

temp       db    00,"$"
nueva_lin  db    0a,"$"
numeroA    db    0ff
numeroB    db    50
numeros    db    20, 12, 24
buffer_entrada   db  20, 00
                 db  20 dup (0)
;mostrar_prod     db  "(M)ostrar productos",0a,"$"
;ingresar_prod    db  "(I)ngresar producto",0a,"$"
;editar_prod      db  "(E)ditar producto",0a,"$"
;borrar_prod      db  "(B)orrar producto",0a,"$"
;prods_registrados db "Productos registrados:",0a,"$"
buffer_entrada2   db  20, 00
                 db  20 dup (0)
Espacio db ' ', '$'
;;; temps
cod_prod_temp    db    05 dup (0)
puntero_temp     dw    0000
;; "ESTRUCTURA PRODUCTO"
cod_prod    db    05 dup (0)
cod_name    db    21 dup (0)
cod_price   db    05 dup (0)
cod_units   db    05 dup (0)


;; "ESTRUCTURA VENTA"
cod_prod_v    db    05 dup (0)
cod_units_v   db    05 dup (0)


;; numéricos
num_price   dw    0000
num_units   dw    0000
num_units_v dw    0000
;; archivo productos
archivo_prods    db   "PROD.BIN",00
handle_prods     dw   0000
;;

handle_ventas    dw   0000

nombre_rep1      db   "CATALG.HTML",00

nombre_rep2      db   "ABC.HTML",00

archivo_vens	db   "VENTAS.BIN",00
handle_reps      dw   0000
;;
.CODE
.STARTUP
;; CODIGO ceros
inicio:
		;call validar_acceso
		;int 03
		;; FALTA:
		;;    - Comparar cadenas obtenidas de archivo con
		;;      datos correctos.
		;;
		;; ENCABEZADO

acces:
	;	call validar_acceso
	;	cmp DL, 0ff
	;	print clave_capturada
	;	jne fin

	;	mov AH, 08
	;	int 21
	;	cmp AL, 0D
	;	je imprimir_encabezado
	;	jmp fin

        ;;VALIDAR USUARIO

		call validar_acceso





        mov SI, offset usuario_capturado
        inc SI ;;pasar al contenido del buffer
        mov DI, offset tk_n
        mov CX, 06
	;	print usuario_capturado
        call cadenas_iguales
        cmp DL, 00
        je fin


        mov SI, offset clave_capturada
        inc SI ;;pasar al contenido del buffer
        mov DI, offset tk_c
        mov CX, 09
	;	print usuario_capturado
        call cadenas_iguales
        cmp DL, 00
        je fin


      




		jmp imprimir_encabezado






imprimir_encabezado:

		mov AX, 7e7
		call numAcadena
		mov BX, 01
		mov CX, 0005

		;; ENCABEZADO
        print cadena1
        print cadena2
        print cadena3
        print cadena4
       	mov DX, offset nueva_lin
		mov AH, 09
		int 21
		print cadena5
		print cadena6
		mov DX, offset nueva_lin
		mov AH, 09
		int 21
		;;
menu_principal:
        print Espacio
        print opcionP
        print opcionV
        print opcionH
        print opcionS
		print Espacio
		

   ; Mostrar los contadores en pantalla
    ;mov ah, 0Eh

    ; Mostrar contador_a
    ;mov al, '0'
    ;add al, byte ptr [counter]
    ;int 10h

    ; Nueva línea
   ; mov dl, 0Ah
   ; int 21h



		
	;	mov al, [cadena1+2]
	;	mov dl, al
    ;	mov ah, 02h
    ;	int 21h

        print nueva_lin
		;; LEER 1 caracter
		getChar
		;; AL = CARACTER LEIDO
		cmp al, 31;codigo ascii del numero 1 en hexadecimal
		je menu_productos
		cmp AL, 32 ;; v minúscula ascii
		je menu_ventas 
		cmp al, 33;codigo ascii del numero 3 en hexadecimal
		je menu_herramientas
	
		jmp menu_principal
menu_productos:
        mov DX, offset nueva_lin
		mov AH, 09
		int 21
        print opcionP1
        print opcionP2
        print opcionP3
        print opcionP4
        print opcionP5
        mov DX, offset nueva_lin
		mov AH, 09
		int 21

		;;
		mov AH, 08
		int 21

		;; AL = CARACTER LEIDO
		cmp AL, 32 ;; borrar
		je eliminar_producto_archivo
		

		cmp al, 31;codigo ascii del numero 1 en hexadecimal
		je ingresar_producto_archivo
		cmp al, 33;codigo ascii del numero 3 en hexadecimal
		je mostrar_productos_archivo
		cmp al, 34;codigo ascii del numero 4 en hexadecimal
		je menu_principal
		jmp menu_productos
		;;
ingresar_producto_archivo:
		print Espacio
		mov DX, offset sub_prod
		mov AH, 09
		int 21
		mov DX, offset nueva_lin
		mov AH, 09
		int 21
		;;; PEDIR CODIGO
pedir_de_nuevo_codigo:
		mov DX, offset prompt_code
		mov AH, 09
		int 21
		mov DX, offset buffer_entrada
		mov AH, 0a
		int 21
		;mov dl, al
    	;mov ah, 02h
    	;int 21h
		;;; verificar que el tamaño del codigo no sea mayor a 5
		mov DI, offset buffer_entrada ; aqui se encuentra el tamaño del codigo
		inc DI ; me posiciono en el contenido del buffer
		mov AL, [DI] ; tamaño del codigo
		cmp AL, 00 ; si es 0, pedir de nuevo
		je  pedir_de_nuevo_codigo ; je --> jump if equal
		cmp AL, 05 ; si es mayor a 4, pedir de nuevo
		jb  aceptar_tam_cod  ;; jb --> jump if below
		mov DX, offset nueva_lin
		mov AH, 09
		int 21
		jmp pedir_de_nuevo_codigo
		;;; mover al campo codigo en la estructura producto
aceptar_tam_cod:
		mov SI, offset cod_prod ; me posiciono en el campo codigo de la estructura producto
		mov DI, offset buffer_entrada 		; me posiciono en el contenido del buffer
		inc DI ; me posiciono en el contenido del buffer
		mov CH, 00 ; aqui se encuentra el tamaño del codigo
		mov CL, [DI] ; tamaño del codigo
		inc DI  ;; me posiciono en el contenido del buffer
; aqui se aceptara la sintaxis del codigo [A-Z0-0]
copiar_cod:
	mov AL, [DI]
	cmp al, 'A'
    jl pedir_de_nuevo_codigo  ; Si no es una letra mayúscula o número válido, volver a pedir la cadena
    cmp al, 'Z'
    jle copiar_codigo
    cmp al, '0'
    jl pedir_de_nuevo_codigo  ; Si no es una letra mayúscula o número válido, volver a pedir la cadena
    cmp al, '9'
    jg pedir_de_nuevo_codigo  ; Si no es una letra mayúscula o número válido, volver a pedir la cadena


copiar_codigo:	
		mov AL, [DI]
		mov [SI], AL
		inc SI
		inc DI
		loop copiar_codigo  ;; restarle 1 a CX, verificar que CX no sea 0, si no es 0 va a la etiqueta, 
		;;; la cadena ingresada en la estructura
		;;;
		mov DX, offset nueva_lin
		mov AH, 09
		int 21


;empieza cambio aqui 



;ciclo_buscar:
;		int 03
;		mov BX, [handle_prods]
;		mov CX, 26
;		mov DX, offset cod_prod
;		moV AH, 3f
;		int 21
;		mov BX, [handle_prods]
;		mov CX, 4
;		mov DX, offset num_price
;		moV AH, 3f
;		int 21
;		cmp AX, 0000   ;; se acaba cuando el archivo se termina
;		je pedir_de_nuevo_nombre
;		mov DX, [puntero_temp]
;		add DX, 2a
;		mov [puntero_temp], DX
		;;; verificar si es producto válido
;		mov AL, [cod_prod]
;		cmp [cod_prod], AL
;		je ciclo_buscar
		;;; verificar el código
;		mov SI, offset cod_prod_temp
;		mov DI, offset cod_prod
;		mov CX, 0005
;		call cadenas_iguales
		;;;; <<
;		cmp DL, 0ff
;		je menu_principal
;		jmp ciclo_buscar



;finaliza cambio aqui


		;;; PEDIR NOMBRE
pedir_de_nuevo_nombre:
		mov DI, offset cod_name
		mov CX, 0005
		call memset


		mov DX, offset prompt_name
		mov AH, 09
		int 21
		
		mov DX, offset buffer_entrada
		mov AH, 0a
		int 21
		;;; verificar que el tamaño del codigo no sea mayor a 5
		mov DI, offset buffer_entrada
		inc DI
		mov AL, [DI]
		cmp AL, 00
		je  pedir_de_nuevo_nombre
		cmp AL, 32 ; si es mayor a 20, pedir de nuevo
		jb  aceptar_tam_nom
		mov DX, offset nueva_lin
		mov AH, 09
		int 21




		jmp pedir_de_nuevo_nombre
		;;; mover al campo codigo en la estructura producto
aceptar_tam_nom:
		mov SI, offset cod_name ;; aqui se aceptara la sintaxis del codigo [A-Z0-0]
		mov DI, offset buffer_entrada ;; aqui se encuentra el tamaño del codigo
		inc DI ;; me posiciono en el contenido del buffer
		mov CH, 00 ;; CH = 0
		mov CL, [DI] ;; CL = tamaño del nombre
		
		inc DI  ;; me posiciono en el contenido del buffer
copiar_nombre:	mov AL, [DI]
		mov [SI], AL
		inc SI
		inc DI
		loop copiar_nombre  ;; restarle 1 a CX, verificar que CX no sea 0, si no es 0 va a la etiqueta, 
		;;; la cadena ingresada en la estructura
		;;;
		mov DX, offset nueva_lin
		mov AH, 09
		int 21	


		;;
pedir_de_nuevo_precio:
		mov DX, offset prompt_price
		mov AH, 09
		int 21
		mov DX, offset buffer_entrada
		mov AH, 0a
		int 21
		;;; verificar que el tamaño del codigo no sea mayor a 5
		mov DI, offset buffer_entrada
		inc DI
		mov AL, [DI]
		cmp AL, 00
		je  pedir_de_nuevo_precio
		cmp AL, 03  ;; tamaño máximo del campo
		jb  aceptar_tam_precio ;; jb --> jump if below
		mov DX, offset nueva_lin
		mov AH, 09
		int 21
		jmp pedir_de_nuevo_precio
		;;; mover al campo codigo en la estructura producto
aceptar_tam_precio:
		mov SI, offset cod_price
		mov DI, offset buffer_entrada
		inc DI
		mov CH, 00
		mov CL, [DI]
		inc DI  ;; me posiciono en el contenido del buffer
copiar_precio:	mov AL, [DI]
		mov [SI], AL
		inc SI
		inc DI
		loop copiar_precio  ;; restarle 1 a CX, verificar que CX no sea 0, si no es 0 va a la etiqueta, 
		;;
		mov DX, offset nueva_lin
		mov AH, 09
		int 21
		;;
		mov DI, offset cod_price
		call cadenaAnum
		;; AX -> numero convertido
		mov [num_price], AX
		;;
		mov DI, offset cod_price
		mov CX, 0005
		call memset
		;;
pedir_de_nuevo_unidades:
		mov DX, offset prompt_units
		mov AH, 09
		int 21
		mov DX, offset buffer_entrada
		mov AH, 0a
		int 21
		;;; verificar que el tamaño del codigo no sea mayor a 5
		mov DI, offset buffer_entrada
		inc DI
		mov AL, [DI]
		cmp AL, 00
		je  pedir_de_nuevo_unidades
		cmp AL, 03  ;; tamaño máximo del campo
		jb  aceptar_tam_unidades ;; jb --> jump if below
		mov DX, offset nueva_lin
		mov AH, 09
		int 21
		jmp pedir_de_nuevo_unidades
		;;; mover al campo codigo en la estructura producto
aceptar_tam_unidades:
		mov SI, offset cod_units
		mov DI, offset buffer_entrada
		inc DI
		mov CH, 00
		mov CL, [DI]
		inc DI  ;; me posiciono en el contenido del buffer
copiar_unidades:
		mov AL, [DI]
		mov [SI], AL
		inc SI
		inc DI
		loop copiar_unidades  ;; restarle 1 a CX, verificar que CX no sea 0, si no es 0 va a la etiqueta, 
		;;
		mov DI, offset cod_units
		call cadenaAnum
		;; AX -> numero convertido
		mov [num_units], AX
		;;
		mov DI, offset cod_units
		mov CX, 0005
		call memset
		;; finalizó pedir datos de producto
		;;
		;;
		;;
		;;
		;; GUARDAR EN ARCHIVO
		;; probar abrirlo normal
		mov AL, 02
		mov AH, 3d
		mov DX, offset archivo_prods
		int 21
		;; si no lo cremos
		jc  crear_archivo_prod
		;; si abre escribimos
		jmp guardar_handle_prod
crear_archivo_prod:
		mov CX, 0000
		mov DX, offset archivo_prods
		mov AH, 3c
		int 21
		;; archivo abierto
guardar_handle_prod:
		;; guardamos handle
		mov [handle_prods], AX
		;; obtener handle
		mov BX, [handle_prods]
		;; vamos al final del archivo
		mov CX, 00
		mov DX, 00
		mov AL, 02
		mov AH, 42
		int 21
		;; escribir el producto en el archivo
		;; escribí los dos primeros campos
		mov CX, 26
		mov DX, offset cod_prod
		mov AH, 40
		int 21
		;; escribo los otros dos
		mov CX, 0004
		mov DX, offset num_price
		mov AH, 40
		int 21
		;; cerrar archivo
		mov AH, 3e
		int 21
		;;
		jmp menu_productos
mostrar_productos_archivo:
		mov DX, offset nueva_lin
		mov AH, 09
		int 21
		;;
		mov AL, 02
		mov AH, 3d
		mov DX, offset archivo_prods
		int 21
		;;
		mov [handle_prods], AX
		;; leemos
ciclo_mostrar:
		;; puntero cierta posición
		mov BX, [handle_prods]
		mov CX, 0026     ;; leer 26h bytes
		mov DX, offset cod_prod
		;;
		mov AH, 3f
		int 21
		;; puntero avanzó
		mov BX, [handle_prods]
		mov CX, 0004
		mov DX, offset num_price
		mov AH, 3f
		int 21
		;		print Espacio

		;; ¿cuántos bytes leímos?
		;; si se leyeron 0 bytes entonces se terminó el archivo...
		cmp AX, 0000
		je fin_mostrar
		;; ver si es producto válido
		mov AL, 00
		cmp [cod_prod], AL
		je ciclo_mostrar
		;; producto en estructura
		call imprimir_estructura
		jmp ciclo_mostrar
		;;
fin_mostrar:
		jmp menu_productos
eliminar_producto_archivo:


		mov DX, 0000 ;; posición en el archivo 
		mov [puntero_temp], DX ;; guardamos en memoria
		mov DX, offset nueva_lin
		mov AH, 09
		int 21
		print eliminado
		mov DX, offset nueva_lin
		mov AH, 09
		int 21
pedir_de_nuevo_codigo2:
		mov DX, offset prompt_code
		mov AH, 09
		int 21
		mov DX, offset buffer_entrada
		mov AH, 0a
		int 21
		;;
		mov DI, offset buffer_entrada
		inc DI
		mov AL, [DI]
		cmp AL, 00
		je  pedir_de_nuevo_codigo2
		cmp AL, 05
		jb  aceptar_tam_cod_ven  ;; jb --> jump if below
		mov DX, offset nueva_lin
		mov AH, 09
		int 21
		jmp pedir_de_nuevo_codigo2
		;;; mover al campo codigo en la estructura producto
aceptar_tam_cod_ven:
		mov SI, offset cod_prod_temp
		mov DI, offset buffer_entrada
		inc DI
		mov CH, 00
		mov CL, [DI]
		inc DI  ;; me posiciono en el contenido del buffer
copiar_codigo2:	
        mov AL, [DI]
		mov [SI], AL
		inc SI
		inc DI
		loop copiar_codigo2  ;; restarle 1 a CX, verificar que CX no sea 0, si no es 0 va a la etiqueta, 
		;;; la cadena ingresada en la estructura
		;;;
		mov DX, offset nueva_lin
		mov AH, 09
		int 21
		;;
		mov AL, 02              ;;;<<<<<  lectura/escritura aumentar_
		mov DX, offset archivo_prods
		mov AH, 3d
		int 21
		mov [handle_prods], AX
		;;; TODO: revisar si existe
ciclo_encontrar:
		int 03
		mov BX, [handle_prods]
		mov CX, 26
		mov DX, offset cod_prod
		moV AH, 3f
		int 21
		mov BX, [handle_prods]
		mov CX, 4
		mov DX, offset num_price
		moV AH, 3f
		int 21
		cmp AX, 0000   ;; se acaba cuando el archivo se termina
		je finalizar_borrar
		mov DX, [puntero_temp]
		add DX, 2a
		mov [puntero_temp], DX
		;;; verificar si es producto válido
		mov AL, 00
		cmp [cod_prod], AL
		je ciclo_encontrar
		;;; verificar el código
		mov SI, offset cod_prod_temp
		mov DI, offset cod_prod
		mov CX, 0005
		call cadenas_iguales
		;;;; <<
		cmp DL, 0ff
		je borrar_encontrado
		jmp ciclo_encontrar
borrar_encontrado:
		mov DX, [puntero_temp]
		sub DX, 2a
		mov CX, 0000
		mov BX, [handle_prods]
		mov AL, 00
		mov AH, 42
		int 21
		;;; puntero posicionado
		mov CX, 2a
		mov DX, offset ceros
		mov AH, 40
		int 21
finalizar_borrar:
		mov BX, [handle_prods]
		mov AH, 3e
		int 21
		jmp menu_productos
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
menu_ventas:
		print Espacio
		print opcionV1
		print opcionV2
		mov DX, offset nueva_lin
		mov AH, 09
		int 21
		getChar
		cmp al,31
		je generar_venta
		cmp al,32
		je menu_principal
		
generar_venta:
		print Espacio
		mov DX, offset prompt_code
		mov AH, 09
		int 21

		mov DX, offset buffer_entrada2
		mov AH, 0a
		int 21
		;;; verificar que el tamaño del codigo no sea mayor a 5
		mov DI, offset buffer_entrada2
		inc DI
		mov AL, [DI]
		cmp AL, 00
		je  generar_venta
		cmp AL, 05
		jb  aceptar_tam_cod2  ;; jb --> jump if below
		mov DX, offset nueva_lin
		mov AH, 09
		int 21
		jmp generar_venta
		;;; mover al campo codigo en la estructura producto
		
aceptar_tam_cod2:
	mov SI, offset cod_prod_v
	mov DI, offset buffer_entrada2
	inc DI
	mov CH, 00
	mov CL, [DI]
	inc DI  ;; me posiciono en el contenido del buffer
copiar_codigo_ven:	
	mov AL, [DI]
	mov [SI], AL
	inc SI
	inc DI
	loop copiar_codigo_ven  ;; restarle 1 a CX, verificar que CX no sea 0, si no es 0 va a la etiqueta,
	;;; la cadena ingresada en la estructura
	;;;
	mov DX, offset nueva_lin
	mov AH, 09
	int 21
	;;
pedir_de_nuevo_unidades2:
		mov DX, offset prompt_units
		mov AH, 09
		int 21
		mov DX, offset buffer_entrada2
		mov AH, 0a
		int 21
		;;; verificar que el tamaño del codigo no sea mayor a 5
		mov DI, offset buffer_entrada2
		inc DI
		mov AL, [DI]
		cmp AL, 00
		je  pedir_de_nuevo_unidades2
		cmp AL, 05
		jb  aceptar_tam_unidades2  ;; jb --> jump if below
		mov DX, offset nueva_lin
		mov AH, 09
		int 21
		jmp pedir_de_nuevo_unidades2
		;;; mover al campo codigo en la estructura producto
aceptar_tam_unidades2:
		mov SI, offset cod_units_v
		mov DI, offset buffer_entrada2
		inc DI
		mov CH, 00
		mov CL, [DI]
		inc DI  ;; me posiciono en el contenido del buffer
copiar_unidades2:
		mov AL, [DI]
		mov [SI], AL
		inc SI
		inc DI
		loop copiar_unidades2  ;; restarle 1 a CX, verificar que CX no sea 0, si no es 0 va a la etiqueta,
		;;; la cadena ingresada en la estructura
		;;;
		mov DI, offset cod_units_v
		call cadenaAnum
		mov [num_units_v], AX
		mov DI, offset cod_units_v
		mov CX, 0005
		call memset
		mov AL, 02
		mov AH, 3d
		mov DX, offset archivo_vens
		int 21
		;; si no lo cremos
		jc  crear_archivo_ventas
		;; si abre escribimos
		jmp guardar_handle_ventas

crear_archivo_ventas:
		mov CX, 0000
		mov DX, offset archivo_vens
		mov AH, 3c
		int 21

guardar_handle_ventas:
		mov [handle_ventas], AX
		mov BX, [handle_ventas]
		mov CX, 00
		mov DX, 00
		mov AL, 02
		mov AH, 42
		int 21	
		mov CX, 26
		mov DX, offset cod_prod_v
		mov AH, 40
		int 21
		mov CX, 0004
		mov DX, offset num_units_v
		mov AH, 40
		int 21
		mov AH, 3e
		int 21
		jmp menu_principal
		
menu_herramientas:
        print Espacio
        print opcionH1
        print opcionH2
        print opcionH3
        print opcionH4
        print opcionH5
        print opcionH6
        print Espacio
		mov AH, 08
		int 21
		cmp al, 31
		je generar_catalogo
		cmp al, 32
		je generar_ABC
        cmp al, 35;codigo ascii del numero 5 en hexadecimal
        je menu_principal


generar_ABC:
		mov AH, 3c; crear archivo
		mov CX, 0000 ; atributos
		mov DX, offset nombre_rep2 ; nombre del archivo
		int 21 ; llamada al sistema
		mov [handle_reps], AX ; guardamos el handle del archivo
		mov BX, AX ; guardamos el handle del archivo
		mov AH, 40 ; escribir en archivo
		mov CH, 00 ; cantidad de bytes a escribir
		mov CL, [tam_encabezado_html] ; cantidad de bytes a escribir
		mov DX, offset encabezado_html ; puntero a la cadena a escribir
		int 21 ; llamada al sistema
		mov BX, [handle_reps] ; guardamos el handle del archivo
		mov AH, 40	; escribir en archivo
		mov CH, 00 ; cantidad de bytes a escribir
		mov CL, [tam_inicializacion_tabla_ABC] ; cantidad de bytes a escribir
		mov DX, offset inicializacion_tabla_ABC ; puntero a la cadena a escribir
		int 21

	;	mov CX, 15  
	;	mov DX, offset a
		;;
	;	mov AH, 3f
	;	int 21

	;	cmp [a], AL


mostrar_productos_archivo_c: 
		mov DX, offset nueva_lin ; nueva linea
		mov AH, 09
		int 21
		;;
		mov AL, 02 ; abrir archivo
		mov AH, 3d ; abrir archivo
		mov DX, offset archivo_prods ; nombre del archivo
		int 21	; llamada al sistema
		;;
		mov [handle_prods], AX ; guardamos el handle del archivo
		;; leemos
ciclo_mostrar_c:
		;; puntero cierta posición
		mov BX, [handle_prods]
		mov CX, 0026     ;; leer 26h bytes
		mov DX, offset cod_prod
		;;
		mov AH, 3f
		int 21
		;; puntero avanzó
		mov BX, [handle_prods]
		mov CX, 0004
		mov DX, offset num_price
		mov AH, 3f
		int 21
		;		print Espacio

		;; ¿cuántos bytes leímos?
		;; si se leyeron 0 bytes entonces se terminó el archivo...
		cmp AX, 0000
		je imprimir_estructura_html_ABC
		;; ver si es producto válido
		mov AL, 00
		cmp [cod_prod], AL
		je ciclo_mostrar_c
		;; producto en estructura
		call sum_c
		jmp ciclo_mostrar_c



imprimir_estructura_html_ABC:
		mov BX, [handle_reps] ; guardamos el handle del archivo
		mov AH, 40 ; escribir en archivo
		mov CH, 00 ; cantidad de bytes a escribir
		mov CL, 04 ; cantidad de bytes a escribir
		mov DX, offset tr_html ; puntero a la cadena a escribir
		int 21 ; llamada al sistema
		;;
		mov BX, [handle_reps] ; guardamos el handle del archivo
		mov AH, 40 ; escribir en archivo
		mov CH, 00 ; cantidad de bytes a escribir
		mov CL, 04 ; cantidad de bytes a escribir
		mov DX, offset td_html ; puntero a la cadena a escribir
		int 21
		;;

; aqui pondremos la variable a en la tabla
	;	inc counter
		mov AX, [counter]
		call numAcadena

;		inc counter
		;mostrar el counter
;		mov AX, counter
;		call numAcadena
	;	print numero
		mov BX, [handle_reps]
		mov AH, 40 ; escribir en archivo
		mov CH, 00 ; cantidad de bytes a escribir
		mov CL, 01 ; cantidad de bytes a escribir
		mov DX, offset a ; puntero a la cadena a escribir
		int 21 ; llamada al sistema

		mov BX, [handle_reps]
		mov AH, 40
		mov CH, 00
		mov CL, 05
		mov DX, offset tdc_html
		int 21
		;;
		mov BX, [handle_reps]
		mov AH, 40
		mov CH, 00
		mov CL, 04
		mov DX, offset td_html
		int 21		


		mov BX, [handle_reps]
		mov AH, 40
		mov CH, 00
		mov CL, 05
		mov DX, offset numero
		int 21

		mov BX, [handle_reps]
		mov AH, 40
		mov CH, 00
		mov CL, 05
		mov DX, offset tdc_html
		int 21
		;;
		mov BX, [handle_reps]
		mov AH, 40
		mov CH, 00
		mov CL, 05
		mov DX, offset trc_html
		int 21

;--------------------b---------------------
		mov BX, [handle_reps]
		mov AH, 40
		mov CH, 00
		mov CL, 04
		mov DX, offset tr_html
		int 21
		;;
		mov BX, [handle_reps]
		mov AH, 40
		mov CH, 00
		mov CL, 04
		mov DX, offset td_html
		int 21
; aqui pondremos la variable a en la tabla
	;	inc counter
		mov AX, [counter_b]
		call numAcadena

;		inc counter
		;mostrar el counter
;		mov AX, counter
;		call numAcadena
	;	print numero
		mov BX, [handle_reps]
		mov AH, 40
		mov CH, 00
		mov CL, 01
		mov DX, offset b
		int 21

		mov BX, [handle_reps]
		mov AH, 40
		mov CH, 00
		mov CL, 05
		mov DX, offset tdc_html
		int 21
		;;
		mov BX, [handle_reps]
		mov AH, 40
		mov CH, 00
		mov CL, 04
		mov DX, offset td_html
		int 21		


		mov BX, [handle_reps]
		mov AH, 40
		mov CH, 00
		mov CL, 05
		mov DX, offset numero
		int 21

		mov BX, [handle_reps]
		mov AH, 40
		mov CH, 00
		mov CL, 05
		mov DX, offset tdc_html
		int 21
		;;
		mov BX, [handle_reps]
		mov AH, 40
		mov CH, 00
		mov CL, 05
		mov DX, offset trc_html
		int 21

;--------------------c---------------------
		mov BX, [handle_reps]
		mov AH, 40
		mov CH, 00
		mov CL, 04
		mov DX, offset tr_html
		int 21
		;;
		mov BX, [handle_reps]
		mov AH, 40
		mov CH, 00
		mov CL, 04
		mov DX, offset td_html
		int 21
; aqui pondremos la variable a en la tabla
	;	inc counter
		mov AX, [counter_c]
		call numAcadena

;		inc counter
		;mostrar el counter
;		mov AX, counter
;		call numAcadena
	;	print numero
		mov BX, [handle_reps]
		mov AH, 40
		mov CH, 00
		mov CL, 01
		mov DX, offset cc
		int 21

		mov BX, [handle_reps]
		mov AH, 40
		mov CH, 00
		mov CL, 05
		mov DX, offset tdc_html
		int 21
		;;
		mov BX, [handle_reps]
		mov AH, 40
		mov CH, 00
		mov CL, 04
		mov DX, offset td_html
		int 21		



   ; Mostrar los contadores en pantalla
  ;  mov ah, 0Eh

    ; Mostrar contador_a
   ; mov al, '0'
   ; add al, byte ptr [contador_a]
   ; int 10h

    ; Nueva línea
    ;mov dl, 0Ah
    ;int 21h


		mov BX, [handle_reps]
		mov AH, 40
		mov CH, 00
		mov CL, 05
		mov DX, offset numero
		int 21

		mov BX, [handle_reps]
		mov AH, 40
		mov CH, 00
		mov CL, 05
		mov DX, offset tdc_html
		int 21
		;;
		mov BX, [handle_reps]
		mov AH, 40
		mov CH, 00
		mov CL, 05
		mov DX, offset trc_html
		int 21
;--------------------d---------------------
		mov BX, [handle_reps]
		mov AH, 40
		mov CH, 00
		mov CL, 04
		mov DX, offset tr_html
		int 21
		;;
		mov BX, [handle_reps]
		mov AH, 40
		mov CH, 00
		mov CL, 04
		mov DX, offset td_html
		int 21
; aqui pondremos la variable a en la tabla
	;	inc counter
		mov AX, [counter_d]
		call numAcadena

;		inc counter
		;mostrar el counter
;		mov AX, counter
;		call numAcadena
	;	print numero
		mov BX, [handle_reps]
		mov AH, 40
		mov CH, 00
		mov CL, 01
		mov DX, offset d
		int 21

		mov BX, [handle_reps]
		mov AH, 40
		mov CH, 00
		mov CL, 05
		mov DX, offset tdc_html
		int 21
		;;
		mov BX, [handle_reps]
		mov AH, 40
		mov CH, 00
		mov CL, 04
		mov DX, offset td_html
		int 21		


		mov BX, [handle_reps]
		mov AH, 40
		mov CH, 00
		mov CL, 05
		mov DX, offset numero
		int 21

		mov BX, [handle_reps]
		mov AH, 40
		mov CH, 00
		mov CL, 05
		mov DX, offset tdc_html
		int 21
		;;
		mov BX, [handle_reps]
		mov AH, 40
		mov CH, 00
		mov CL, 05
		mov DX, offset trc_html
		int 21

;--------------------e---------------------
		mov BX, [handle_reps]
		mov AH, 40
		mov CH, 00
		mov CL, 04
		mov DX, offset tr_html
		int 21
		;;
		mov BX, [handle_reps]
		mov AH, 40
		mov CH, 00
		mov CL, 04
		mov DX, offset td_html
		int 21
; aqui pondremos la variable a en la tabla
	;	inc counter
		mov AX, [counter_e]
		call numAcadena

;		inc counter
		;mostrar el counter
;		mov AX, counter
;		call numAcadena
	;	print numero
		mov BX, [handle_reps]
		mov AH, 40
		mov CH, 00
		mov CL, 01
		mov DX, offset e
		int 21

		mov BX, [handle_reps]
		mov AH, 40
		mov CH, 00
		mov CL, 05
		mov DX, offset tdc_html
		int 21
		;;
		mov BX, [handle_reps]
		mov AH, 40
		mov CH, 00
		mov CL, 04
		mov DX, offset td_html
		int 21		


		mov BX, [handle_reps]
		mov AH, 40
		mov CH, 00
		mov CL, 05
		mov DX, offset numero
		int 21

		mov BX, [handle_reps]
		mov AH, 40
		mov CH, 00
		mov CL, 05
		mov DX, offset tdc_html
		int 21
		;;
		mov BX, [handle_reps]
		mov AH, 40
		mov CH, 00
		mov CL, 05
		mov DX, offset trc_html
		int 21


;--------------------f---------------------
		mov BX, [handle_reps]
		mov AH, 40
		mov CH, 00
		mov CL, 04
		mov DX, offset tr_html
		int 21
		;;
		mov BX, [handle_reps]
		mov AH, 40
		mov CH, 00
		mov CL, 04
		mov DX, offset td_html
		int 21
; aqui pondremos la variable a en la tabla
	;	inc counter
		mov AX, [counter_f]
		call numAcadena

;		inc counter
		;mostrar el counter
;		mov AX, counter
;		call numAcadena
	;	print numero
		mov BX, [handle_reps]
		mov AH, 40
		mov CH, 00
		mov CL, 01
		mov DX, offset f
		int 21

		mov BX, [handle_reps]
		mov AH, 40
		mov CH, 00
		mov CL, 05
		mov DX, offset tdc_html
		int 21
		;;
		mov BX, [handle_reps]
		mov AH, 40
		mov CH, 00
		mov CL, 04
		mov DX, offset td_html
		int 21		


		mov BX, [handle_reps]
		mov AH, 40
		mov CH, 00
		mov CL, 05
		mov DX, offset numero
		int 21

		mov BX, [handle_reps]
		mov AH, 40
		mov CH, 00
		mov CL, 05
		mov DX, offset tdc_html
		int 21
		;;
		mov BX, [handle_reps]
		mov AH, 40
		mov CH, 00
		mov CL, 05
		mov DX, offset trc_html
		int 21

;--------------------g---------------------
		mov BX, [handle_reps]
		mov AH, 40
		mov CH, 00
		mov CL, 04
		mov DX, offset tr_html
		int 21
		;;
		mov BX, [handle_reps]
		mov AH, 40
		mov CH, 00
		mov CL, 04
		mov DX, offset td_html
		int 21
; aqui pondremos la variable a en la tabla
	;	inc counter
		mov AX, [counter_g]
		call numAcadena

;		inc counter
		;mostrar el counter
;		mov AX, counter
;		call numAcadena
	;	print numero
		mov BX, [handle_reps]
		mov AH, 40
		mov CH, 00
		mov CL, 01
		mov DX, offset g
		int 21

		mov BX, [handle_reps]
		mov AH, 40
		mov CH, 00
		mov CL, 05
		mov DX, offset tdc_html
		int 21
		;;
		mov BX, [handle_reps]
		mov AH, 40
		mov CH, 00
		mov CL, 04
		mov DX, offset td_html
		int 21		


		mov BX, [handle_reps]
		mov AH, 40
		mov CH, 00
		mov CL, 05
		mov DX, offset numero
		int 21

		mov BX, [handle_reps]
		mov AH, 40
		mov CH, 00
		mov CL, 05
		mov DX, offset tdc_html
		int 21
		;;
		mov BX, [handle_reps]
		mov AH, 40
		mov CH, 00
		mov CL, 05
		mov DX, offset trc_html
		int 21
;--------------------h---------------------
		mov BX, [handle_reps]
		mov AH, 40
		mov CH, 00
		mov CL, 04
		mov DX, offset tr_html
		int 21
		;;
		mov BX, [handle_reps]
		mov AH, 40
		mov CH, 00
		mov CL, 04
		mov DX, offset td_html
		int 21
; aqui pondremos la variable a en la tabla
	;	inc counter
		mov AX, [counter_h]
		call numAcadena

;		inc counter
		;mostrar el counter
;		mov AX, counter
;		call numAcadena
	;	print numero
		mov BX, [handle_reps]
		mov AH, 40
		mov CH, 00
		mov CL, 01
		mov DX, offset h
		int 21

		mov BX, [handle_reps]
		mov AH, 40
		mov CH, 00
		mov CL, 05
		mov DX, offset tdc_html
		int 21
		;;
		mov BX, [handle_reps]
		mov AH, 40
		mov CH, 00
		mov CL, 04
		mov DX, offset td_html
		int 21		


		mov BX, [handle_reps]
		mov AH, 40
		mov CH, 00
		mov CL, 05
		mov DX, offset numero
		int 21

		mov BX, [handle_reps]
		mov AH, 40
		mov CH, 00
		mov CL, 05
		mov DX, offset tdc_html
		int 21
		;;
		mov BX, [handle_reps]
		mov AH, 40
		mov CH, 00
		mov CL, 05
		mov DX, offset trc_html
		int 21
;--------------------i---------------------
		mov BX, [handle_reps]
		mov AH, 40
		mov CH, 00
		mov CL, 04
		mov DX, offset tr_html
		int 21
		;;
		mov BX, [handle_reps]
		mov AH, 40
		mov CH, 00
		mov CL, 04
		mov DX, offset td_html
		int 21
; aqui pondremos la variable a en la tabla
	;	inc counter
		mov AX, [counter_i]
		call numAcadena

;		inc counter
		;mostrar el counter
;		mov AX, counter
;		call numAcadena
	;	print numero
		mov BX, [handle_reps]
		mov AH, 40
		mov CH, 00
		mov CL, 01
		mov DX, offset i
		int 21

		mov BX, [handle_reps]
		mov AH, 40
		mov CH, 00
		mov CL, 05
		mov DX, offset tdc_html
		int 21
		;;
		mov BX, [handle_reps]
		mov AH, 40
		mov CH, 00
		mov CL, 04
		mov DX, offset td_html
		int 21		


		mov BX, [handle_reps]
		mov AH, 40
		mov CH, 00
		mov CL, 05
		mov DX, offset numero
		int 21

		mov BX, [handle_reps]
		mov AH, 40
		mov CH, 00
		mov CL, 05
		mov DX, offset tdc_html
		int 21
		;;
		mov BX, [handle_reps]
		mov AH, 40
		mov CH, 00
		mov CL, 05
		mov DX, offset trc_html
		int 21
;--------------------j---------------------
		mov BX, [handle_reps]
		mov AH, 40
		mov CH, 00
		mov CL, 04
		mov DX, offset tr_html
		int 21
		;;
		mov BX, [handle_reps]
		mov AH, 40
		mov CH, 00
		mov CL, 04
		mov DX, offset td_html
		int 21
; aqui pondremos la variable a en la tabla
	;	inc counter
		mov AX, [counter_j]
		call numAcadena

;		inc counter
		;mostrar el counter
;		mov AX, counter
;		call numAcadena
	;	print numero
		mov BX, [handle_reps]
		mov AH, 40
		mov CH, 00
		mov CL, 01
		mov DX, offset j
		int 21

		mov BX, [handle_reps]
		mov AH, 40
		mov CH, 00
		mov CL, 05
		mov DX, offset tdc_html
		int 21
		;;
		mov BX, [handle_reps]
		mov AH, 40
		mov CH, 00
		mov CL, 04
		mov DX, offset td_html
		int 21		


		mov BX, [handle_reps]
		mov AH, 40
		mov CH, 00
		mov CL, 05
		mov DX, offset numero
		int 21

		mov BX, [handle_reps]
		mov AH, 40
		mov CH, 00
		mov CL, 05
		mov DX, offset tdc_html
		int 21
		;;
		mov BX, [handle_reps]
		mov AH, 40
		mov CH, 00
		mov CL, 05
		mov DX, offset trc_html
		int 21
;--------------------k---------------------
		mov BX, [handle_reps]
		mov AH, 40
		mov CH, 00
		mov CL, 04
		mov DX, offset tr_html
		int 21
		;;
		mov BX, [handle_reps]
		mov AH, 40
		mov CH, 00
		mov CL, 04
		mov DX, offset td_html
		int 21
; aqui pondremos la variable a en la tabla
	;	inc counter
		mov AX, [counter_k]
		call numAcadena

;		inc counter
		;mostrar el counter
;		mov AX, counter
;		call numAcadena
	;	print numero
		mov BX, [handle_reps]
		mov AH, 40
		mov CH, 00
		mov CL, 01
		mov DX, offset k
		int 21

		mov BX, [handle_reps]
		mov AH, 40
		mov CH, 00
		mov CL, 05
		mov DX, offset tdc_html
		int 21
		;;
		mov BX, [handle_reps]
		mov AH, 40
		mov CH, 00
		mov CL, 04
		mov DX, offset td_html
		int 21		


		mov BX, [handle_reps]
		mov AH, 40
		mov CH, 00
		mov CL, 05
		mov DX, offset numero
		int 21

		mov BX, [handle_reps]
		mov AH, 40
		mov CH, 00
		mov CL, 05
		mov DX, offset tdc_html
		int 21
		;;
		mov BX, [handle_reps]
		mov AH, 40
		mov CH, 00
		mov CL, 05
		mov DX, offset trc_html
		int 21
;--------------------l---------------------
		mov BX, [handle_reps]
		mov AH, 40
		mov CH, 00
		mov CL, 04
		mov DX, offset tr_html
		int 21
		;;
		mov BX, [handle_reps]
		mov AH, 40
		mov CH, 00
		mov CL, 04
		mov DX, offset td_html
		int 21
; aqui pondremos la variable a en la tabla
	;	inc counter
		mov AX, [counter_l]
		call numAcadena

;		inc counter
		;mostrar el counter
;		mov AX, counter
;		call numAcadena
	;	print numero
		mov BX, [handle_reps]
		mov AH, 40
		mov CH, 00
		mov CL, 01
		mov DX, offset l
		int 21

		mov BX, [handle_reps]
		mov AH, 40
		mov CH, 00
		mov CL, 05
		mov DX, offset tdc_html
		int 21
		;;
		mov BX, [handle_reps]
		mov AH, 40
		mov CH, 00
		mov CL, 04
		mov DX, offset td_html
		int 21		


		mov BX, [handle_reps]
		mov AH, 40
		mov CH, 00
		mov CL, 05
		mov DX, offset numero
		int 21

		mov BX, [handle_reps]
		mov AH, 40
		mov CH, 00
		mov CL, 05
		mov DX, offset tdc_html
		int 21
		;;
		mov BX, [handle_reps]
		mov AH, 40
		mov CH, 00
		mov CL, 05
		mov DX, offset trc_html
		int 21
;--------------------m---------------------
		mov BX, [handle_reps]
		mov AH, 40
		mov CH, 00
		mov CL, 04
		mov DX, offset tr_html
		int 21
		;;
		mov BX, [handle_reps]
		mov AH, 40
		mov CH, 00
		mov CL, 04
		mov DX, offset td_html
		int 21
; aqui pondremos la variable a en la tabla
	;	inc counter
		mov AX, [counter_m]
		call numAcadena

;		inc counter
		;mostrar el counter
;		mov AX, counter
;		call numAcadena
	;	print numero
		mov BX, [handle_reps]
		mov AH, 40
		mov CH, 00
		mov CL, 01
		mov DX, offset m
		int 21

		mov BX, [handle_reps]
		mov AH, 40
		mov CH, 00
		mov CL, 05
		mov DX, offset tdc_html
		int 21
		;;
		mov BX, [handle_reps]
		mov AH, 40
		mov CH, 00
		mov CL, 04
		mov DX, offset td_html
		int 21		


		mov BX, [handle_reps]
		mov AH, 40
		mov CH, 00
		mov CL, 05
		mov DX, offset numero
		int 21

		mov BX, [handle_reps]
		mov AH, 40
		mov CH, 00
		mov CL, 05
		mov DX, offset tdc_html
		int 21
		;;
		mov BX, [handle_reps]
		mov AH, 40
		mov CH, 00
		mov CL, 05
		mov DX, offset trc_html
		int 21
;--------------------n---------------------
		mov BX, [handle_reps]
		mov AH, 40
		mov CH, 00
		mov CL, 04
		mov DX, offset tr_html
		int 21
		;;
		mov BX, [handle_reps]
		mov AH, 40
		mov CH, 00
		mov CL, 04
		mov DX, offset td_html
		int 21
; aqui pondremos la variable a en la tabla
	;	inc counter
		mov AX, [counter_n]
		call numAcadena

;		inc counter
		;mostrar el counter
;		mov AX, counter
;		call numAcadena
	;	print numero
		mov BX, [handle_reps]
		mov AH, 40
		mov CH, 00
		mov CL, 01
		mov DX, offset n
		int 21

		mov BX, [handle_reps]
		mov AH, 40
		mov CH, 00
		mov CL, 05
		mov DX, offset tdc_html
		int 21
		;;
		mov BX, [handle_reps]
		mov AH, 40
		mov CH, 00
		mov CL, 04
		mov DX, offset td_html
		int 21		


		mov BX, [handle_reps]
		mov AH, 40
		mov CH, 00
		mov CL, 05
		mov DX, offset numero
		int 21

		mov BX, [handle_reps]
		mov AH, 40
		mov CH, 00
		mov CL, 05
		mov DX, offset tdc_html
		int 21
		;;
		mov BX, [handle_reps]
		mov AH, 40
		mov CH, 00
		mov CL, 05
		mov DX, offset trc_html
		int 21
;--------------------o---------------------
		mov BX, [handle_reps]
		mov AH, 40
		mov CH, 00
		mov CL, 04
		mov DX, offset tr_html
		int 21
		;;
		mov BX, [handle_reps]
		mov AH, 40
		mov CH, 00
		mov CL, 04
		mov DX, offset td_html
		int 21
; aqui pondremos la variable a en la tabla
	;	inc counter
		mov AX, [counter_o]
		call numAcadena

;		inc counter
		;mostrar el counter
;		mov AX, counter
;		call numAcadena
	;	print numero
		mov BX, [handle_reps]
		mov AH, 40
		mov CH, 00
		mov CL, 01
		mov DX, offset o
		int 21

		mov BX, [handle_reps]
		mov AH, 40
		mov CH, 00
		mov CL, 05
		mov DX, offset tdc_html
		int 21
		;;
		mov BX, [handle_reps]
		mov AH, 40
		mov CH, 00
		mov CL, 04
		mov DX, offset td_html
		int 21		


		mov BX, [handle_reps]
		mov AH, 40
		mov CH, 00
		mov CL, 05
		mov DX, offset numero
		int 21

		mov BX, [handle_reps]
		mov AH, 40
		mov CH, 00
		mov CL, 05
		mov DX, offset tdc_html
		int 21
		;;
		mov BX, [handle_reps]
		mov AH, 40
		mov CH, 00
		mov CL, 05
		mov DX, offset trc_html
		int 21
;--------------------p---------------------
		mov BX, [handle_reps]
		mov AH, 40
		mov CH, 00
		mov CL, 04
		mov DX, offset tr_html
		int 21
		;;
		mov BX, [handle_reps]
		mov AH, 40
		mov CH, 00
		mov CL, 04
		mov DX, offset td_html
		int 21
; aqui pondremos la variable a en la tabla
	;	inc counter
		mov AX, [counter_p]
		call numAcadena

;		inc counter
		;mostrar el counter
;		mov AX, counter
;		call numAcadena
	;	print numero
		mov BX, [handle_reps]
		mov AH, 40
		mov CH, 00
		mov CL, 01
		mov DX, offset p
		int 21

		mov BX, [handle_reps]
		mov AH, 40
		mov CH, 00
		mov CL, 05
		mov DX, offset tdc_html
		int 21
		;;
		mov BX, [handle_reps]
		mov AH, 40
		mov CH, 00
		mov CL, 04
		mov DX, offset td_html
		int 21		


		mov BX, [handle_reps]
		mov AH, 40
		mov CH, 00
		mov CL, 05
		mov DX, offset numero
		int 21

		mov BX, [handle_reps]
		mov AH, 40
		mov CH, 00
		mov CL, 05
		mov DX, offset tdc_html
		int 21
		;;
		mov BX, [handle_reps]
		mov AH, 40
		mov CH, 00
		mov CL, 05
		mov DX, offset trc_html
		int 21
;--------------------q---------------------
		mov BX, [handle_reps]
		mov AH, 40
		mov CH, 00
		mov CL, 04
		mov DX, offset tr_html
		int 21
		;;
		mov BX, [handle_reps]
		mov AH, 40
		mov CH, 00
		mov CL, 04
		mov DX, offset td_html
		int 21
; aqui pondremos la variable a en la tabla
	;	inc counter
		mov AX, [counter_q]
		call numAcadena

;		inc counter
		;mostrar el counter
;		mov AX, counter
;		call numAcadena
	;	print numero
		mov BX, [handle_reps]
		mov AH, 40
		mov CH, 00
		mov CL, 01
		mov DX, offset q
		int 21

		mov BX, [handle_reps]
		mov AH, 40
		mov CH, 00
		mov CL, 05
		mov DX, offset tdc_html
		int 21
		;;
		mov BX, [handle_reps]
		mov AH, 40
		mov CH, 00
		mov CL, 04
		mov DX, offset td_html
		int 21		


		mov BX, [handle_reps]
		mov AH, 40
		mov CH, 00
		mov CL, 05
		mov DX, offset numero
		int 21

		mov BX, [handle_reps]
		mov AH, 40
		mov CH, 00
		mov CL, 05
		mov DX, offset tdc_html
		int 21
		;;
		mov BX, [handle_reps]
		mov AH, 40
		mov CH, 00
		mov CL, 05
		mov DX, offset trc_html
		int 21
;--------------------r---------------------
		mov BX, [handle_reps]
		mov AH, 40
		mov CH, 00
		mov CL, 04
		mov DX, offset tr_html
		int 21
		;;
		mov BX, [handle_reps]
		mov AH, 40
		mov CH, 00
		mov CL, 04
		mov DX, offset td_html
		int 21
; aqui pondremos la variable a en la tabla
	;	inc counter
		mov AX, [counter_r]
		call numAcadena

;		inc counter
		;mostrar el counter
;		mov AX, counter
;		call numAcadena
	;	print numero
		mov BX, [handle_reps]
		mov AH, 40
		mov CH, 00
		mov CL, 01
		mov DX, offset r
		int 21

		mov BX, [handle_reps]
		mov AH, 40
		mov CH, 00
		mov CL, 05
		mov DX, offset tdc_html
		int 21
		;;
		mov BX, [handle_reps]
		mov AH, 40
		mov CH, 00
		mov CL, 04
		mov DX, offset td_html
		int 21		


		mov BX, [handle_reps]
		mov AH, 40
		mov CH, 00
		mov CL, 05
		mov DX, offset numero
		int 21

		mov BX, [handle_reps]
		mov AH, 40
		mov CH, 00
		mov CL, 05
		mov DX, offset tdc_html
		int 21
		;;
		mov BX, [handle_reps]
		mov AH, 40
		mov CH, 00
		mov CL, 05
		mov DX, offset trc_html
		int 21
;--------------------s---------------------
		mov BX, [handle_reps]
		mov AH, 40
		mov CH, 00
		mov CL, 04
		mov DX, offset tr_html
		int 21
		;;
		mov BX, [handle_reps]
		mov AH, 40
		mov CH, 00
		mov CL, 04
		mov DX, offset td_html
		int 21
; aqui pondremos la variable a en la tabla
	;	inc counter
		mov AX, [counter_s]
		call numAcadena

;		inc counter
		;mostrar el counter
;		mov AX, counter
;		call numAcadena
	;	print numero
		mov BX, [handle_reps]
		mov AH, 40
		mov CH, 00
		mov CL, 01
		mov DX, offset s
		int 21

		mov BX, [handle_reps]
		mov AH, 40
		mov CH, 00
		mov CL, 05
		mov DX, offset tdc_html
		int 21
		;;
		mov BX, [handle_reps]
		mov AH, 40
		mov CH, 00
		mov CL, 04
		mov DX, offset td_html
		int 21		


		mov BX, [handle_reps]
		mov AH, 40
		mov CH, 00
		mov CL, 05
		mov DX, offset numero
		int 21

		mov BX, [handle_reps]
		mov AH, 40
		mov CH, 00
		mov CL, 05
		mov DX, offset tdc_html
		int 21
		;;
		mov BX, [handle_reps]
		mov AH, 40
		mov CH, 00
		mov CL, 05
		mov DX, offset trc_html
		int 21
;--------------------t---------------------
		mov BX, [handle_reps]
		mov AH, 40
		mov CH, 00
		mov CL, 04
		mov DX, offset tr_html
		int 21
		;;
		mov BX, [handle_reps]
		mov AH, 40
		mov CH, 00
		mov CL, 04
		mov DX, offset td_html
		int 21
; aqui pondremos la variable a en la tabla
	;	inc counter
		mov AX, [counter_t]
		call numAcadena

;		inc counter
		;mostrar el counter
;		mov AX, counter
;		call numAcadena
	;	print numero
		mov BX, [handle_reps]
		mov AH, 40
		mov CH, 00
		mov CL, 01
		mov DX, offset t
		int 21

		mov BX, [handle_reps]
		mov AH, 40
		mov CH, 00
		mov CL, 05
		mov DX, offset tdc_html
		int 21
		;;
		mov BX, [handle_reps]
		mov AH, 40
		mov CH, 00
		mov CL, 04
		mov DX, offset td_html
		int 21		


		mov BX, [handle_reps]
		mov AH, 40
		mov CH, 00
		mov CL, 05
		mov DX, offset numero
		int 21

		mov BX, [handle_reps]
		mov AH, 40
		mov CH, 00
		mov CL, 05
		mov DX, offset tdc_html
		int 21
		;;
		mov BX, [handle_reps]
		mov AH, 40
		mov CH, 00
		mov CL, 05
		mov DX, offset trc_html
		int 21
;--------------------u---------------------
		mov BX, [handle_reps]
		mov AH, 40
		mov CH, 00
		mov CL, 04
		mov DX, offset tr_html
		int 21
		;;
		mov BX, [handle_reps]
		mov AH, 40
		mov CH, 00
		mov CL, 04
		mov DX, offset td_html
		int 21
; aqui pondremos la variable a en la tabla
	;	inc counter
		mov AX, [counter_u]
		call numAcadena

;		inc counter
		;mostrar el counter
;		mov AX, counter
;		call numAcadena
	;	print numero
		mov BX, [handle_reps]
		mov AH, 40
		mov CH, 00
		mov CL, 01
		mov DX, offset u
		int 21

		mov BX, [handle_reps]
		mov AH, 40
		mov CH, 00
		mov CL, 05
		mov DX, offset tdc_html
		int 21
		;;
		mov BX, [handle_reps]
		mov AH, 40
		mov CH, 00
		mov CL, 04
		mov DX, offset td_html
		int 21		


		mov BX, [handle_reps]
		mov AH, 40
		mov CH, 00
		mov CL, 05
		mov DX, offset numero
		int 21

		mov BX, [handle_reps]
		mov AH, 40
		mov CH, 00
		mov CL, 05
		mov DX, offset tdc_html
		int 21
		;;
		mov BX, [handle_reps]
		mov AH, 40
		mov CH, 00
		mov CL, 05
		mov DX, offset trc_html
		int 21
;--------------------v---------------------
		mov BX, [handle_reps]
		mov AH, 40
		mov CH, 00
		mov CL, 04
		mov DX, offset tr_html
		int 21
		;;
		mov BX, [handle_reps]
		mov AH, 40
		mov CH, 00
		mov CL, 04
		mov DX, offset td_html
		int 21
; aqui pondremos la variable a en la tabla
	;	inc counter
		mov AX, [counter_v]
		call numAcadena

;		inc counter
		;mostrar el counter
;		mov AX, counter
;		call numAcadena
	;	print numero
		mov BX, [handle_reps]
		mov AH, 40
		mov CH, 00
		mov CL, 01
		mov DX, offset v
		int 21

		mov BX, [handle_reps]
		mov AH, 40
		mov CH, 00
		mov CL, 05
		mov DX, offset tdc_html
		int 21
		;;
		mov BX, [handle_reps]
		mov AH, 40
		mov CH, 00
		mov CL, 04
		mov DX, offset td_html
		int 21		


		mov BX, [handle_reps]
		mov AH, 40
		mov CH, 00
		mov CL, 05
		mov DX, offset numero
		int 21

		mov BX, [handle_reps]
		mov AH, 40
		mov CH, 00
		mov CL, 05
		mov DX, offset tdc_html
		int 21
		;;
		mov BX, [handle_reps]
		mov AH, 40
		mov CH, 00
		mov CL, 05
		mov DX, offset trc_html
		int 21
;--------------------w---------------------
		mov BX, [handle_reps]
		mov AH, 40
		mov CH, 00
		mov CL, 04
		mov DX, offset tr_html
		int 21
		;;
		mov BX, [handle_reps]
		mov AH, 40
		mov CH, 00
		mov CL, 04
		mov DX, offset td_html
		int 21
; aqui pondremos la variable a en la tabla
	;	inc counter
		mov AX, [counter_w]
		call numAcadena

;		inc counter
		;mostrar el counter
;		mov AX, counter
;		call numAcadena
	;	print numero
		mov BX, [handle_reps]
		mov AH, 40
		mov CH, 00
		mov CL, 01
		mov DX, offset w
		int 21

		mov BX, [handle_reps]
		mov AH, 40
		mov CH, 00
		mov CL, 05
		mov DX, offset tdc_html
		int 21
		;;
		mov BX, [handle_reps]
		mov AH, 40
		mov CH, 00
		mov CL, 04
		mov DX, offset td_html
		int 21		


		mov BX, [handle_reps]
		mov AH, 40
		mov CH, 00
		mov CL, 05
		mov DX, offset numero
		int 21

		mov BX, [handle_reps]
		mov AH, 40
		mov CH, 00
		mov CL, 05
		mov DX, offset tdc_html
		int 21
		;;
		mov BX, [handle_reps]
		mov AH, 40
		mov CH, 00
		mov CL, 05
		mov DX, offset trc_html
		int 21
;--------------------x---------------------
		mov BX, [handle_reps]
		mov AH, 40
		mov CH, 00
		mov CL, 04
		mov DX, offset tr_html
		int 21
		;;
		mov BX, [handle_reps]
		mov AH, 40
		mov CH, 00
		mov CL, 04
		mov DX, offset td_html
		int 21
; aqui pondremos la variable a en la tabla
	;	inc counter
		mov AX, [counter_x]
		call numAcadena

;		inc counter
		;mostrar el counter
;		mov AX, counter
;		call numAcadena
	;	print numero
		mov BX, [handle_reps]
		mov AH, 40
		mov CH, 00
		mov CL, 01
		mov DX, offset x
		int 21

		mov BX, [handle_reps]
		mov AH, 40
		mov CH, 00
		mov CL, 05
		mov DX, offset tdc_html
		int 21
		;;
		mov BX, [handle_reps]
		mov AH, 40
		mov CH, 00
		mov CL, 04
		mov DX, offset td_html
		int 21		


		mov BX, [handle_reps]
		mov AH, 40
		mov CH, 00
		mov CL, 05
		mov DX, offset numero
		int 21

		mov BX, [handle_reps]
		mov AH, 40
		mov CH, 00
		mov CL, 05
		mov DX, offset tdc_html
		int 21
		;;
		mov BX, [handle_reps]
		mov AH, 40
		mov CH, 00
		mov CL, 05
		mov DX, offset trc_html
		int 21
;--------------------y---------------------
		mov BX, [handle_reps]
		mov AH, 40
		mov CH, 00
		mov CL, 04
		mov DX, offset tr_html
		int 21
		;;
		mov BX, [handle_reps]
		mov AH, 40
		mov CH, 00
		mov CL, 04
		mov DX, offset td_html
		int 21
; aqui pondremos la variable a en la tabla
	;	inc counter
		mov AX, [counter_y]
		call numAcadena

;		inc counter
		;mostrar el counter
;		mov AX, counter
;		call numAcadena
	;	print numero
		mov BX, [handle_reps]
		mov AH, 40
		mov CH, 00
		mov CL, 01
		mov DX, offset y
		int 21

		mov BX, [handle_reps]
		mov AH, 40
		mov CH, 00
		mov CL, 05
		mov DX, offset tdc_html
		int 21
		;;
		mov BX, [handle_reps]
		mov AH, 40
		mov CH, 00
		mov CL, 04
		mov DX, offset td_html
		int 21		


		mov BX, [handle_reps]
		mov AH, 40
		mov CH, 00
		mov CL, 05
		mov DX, offset numero
		int 21

		mov BX, [handle_reps]
		mov AH, 40
		mov CH, 00
		mov CL, 05
		mov DX, offset tdc_html
		int 21
		;;
		mov BX, [handle_reps]
		mov AH, 40
		mov CH, 00
		mov CL, 05
		mov DX, offset trc_html
		int 21
;--------------------z---------------------
		mov BX, [handle_reps]
		mov AH, 40
		mov CH, 00
		mov CL, 04
		mov DX, offset tr_html
		int 21
		;;
		mov BX, [handle_reps]
		mov AH, 40
		mov CH, 00
		mov CL, 04
		mov DX, offset td_html
		int 21
; aqui pondremos la variable a en la tabla
	;	inc counter
		mov AX, [counter_z]
		call numAcadena

;		inc counter  
		;mostrar el counter
;		mov AX, counter
;		call numAcadena
	;	print numero
		mov BX, [handle_reps]
		mov AH, 40
		mov CH, 00
		mov CL, 01
		mov DX, offset z
		int 21

		mov BX, [handle_reps]
		mov AH, 40
		mov CH, 00
		mov CL, 05
		mov DX, offset tdc_html
		int 21
		;;
		mov BX, [handle_reps]
		mov AH, 40
		mov CH, 00
		mov CL, 04
		mov DX, offset td_html
		int 21		


		mov BX, [handle_reps]
		mov AH, 40
		mov CH, 00
		mov CL, 05
		mov DX, offset numero
		int 21

		mov BX, [handle_reps]
		mov AH, 40
		mov CH, 00
		mov CL, 05
		mov DX, offset tdc_html
		int 21
		;;
		mov BX, [handle_reps]
		mov AH, 40
		mov CH, 00
		mov CL, 05
		mov DX, offset trc_html
		int 21


fin_mostrar_rep_ABC:
		mov BX, [handle_reps]
		mov AH, 40
		mov CH, 00
		mov CL, [tam_cierre_tabla]
		mov DX, offset cierre_tabla
		int 21
		;;
		mov BX, [handle_reps]
		mov AH, 40
		mov CH, 00
		mov CL, [tam_footer_html]
		mov DX, offset footer_html
		int 21
		;;
		mov AH, 3e
		int 21
		mov counter, 00




		jmp menu_principal

generar_catalogo:
		mov AH, 3c
		mov CX, 0000
		mov DX, offset nombre_rep1
		int 21
		mov [handle_reps], AX
		mov BX, AX
		mov AH, 40
		mov CH, 00
		mov CL, [tam_encabezado_html]
		mov DX, offset encabezado_html
		int 21
		mov BX, [handle_reps]
		mov AH, 40
		mov CH, 00
		mov CL, [tam_inicializacion_tabla]
		mov DX, offset inicializacion_tabla
		int 21
		;;
		mov AL, 02
		mov AH, 3d
		mov DX, offset archivo_prods
		int 21
		;;
		mov [handle_prods], AX
		;; leemos
ciclo_mostrar_rep1:
		;; puntero cierta posición
		mov BX, [handle_prods]
		mov CX, 26     ;; leer 26h bytes
		mov DX, offset cod_prod
		;;
		mov AH, 3f
		int 21
		;; puntero avanzó
		mov BX, [handle_prods]
		mov CX, 0004
		mov DX, offset num_price
		mov AH, 3f
		int 21
		;; ¿cuántos bytes leímos?
		;; si se leyeron 0 bytes entonces se terminó el archivo...
		cmp AX, 00
		je fin_mostrar
		;; ver si es producto válido
		mov AL, 00
		cmp [cod_prod], AL
		je ciclo_mostrar_rep1
		;; producto en estructura
		call imprimir_estructura_html
		jmp ciclo_mostrar_rep1
		;;
fin_mostrar_rep1:
		mov BX, [handle_reps]
		mov AH, 40
		mov CH, 00
		mov CL, [tam_cierre_tabla]
		mov DX, offset cierre_tabla
		int 21
		;;
		mov BX, [handle_reps]
		mov AH, 40
		mov CH, 00
		mov CL, [tam_footer_html]
		mov DX, offset footer_html
		int 21
		;;
		mov AH, 3e
		int 21
		jmp menu_principal
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; imprimir_estructura - ...
;; ENTRADAS:
;; SALIDAS:
;;     o Impresión de estructura
imprimir_estructura:
		;mov DI, offset espacio_largo
		mov DI, offset cod_name
ciclo_poner_dolar_1:
		mov AL, [DI]
		cmp AL, 00
		je poner_dolar_1
		inc DI
		jmp ciclo_poner_dolar_1
poner_dolar_1:
		mov AL, 24  ;; dólar
		mov [DI], AL
		;; imprimir normal
		print prompt_name
		;mov DX, offset espacio_largo
		mov DX, offset cod_name
		mov AH, 09
		int 21
;		mov al, [cod_name+2]
;		cmp al, 61 ; Comparar con 'a'
		; si es a, ira a la funcion es_a
;		je sum_count
;aqui
;sum_count:
	;	inc counter
		mov DX, offset nueva_lin
		mov AH, 09
		int 21

		mov AX, [num_price]
		call numAcadena
		;; [numero] tengo la cadena convertida
		mov BX, 0001
		mov CX, 0005
		print prompt_price
		mov DX, offset numero
		mov AH, 40
		int 21

		mov DX, offset nueva_lin
		mov AH, 09
		int 21
		mov DX, offset nueva_lin
		mov AH, 09
		int 21
		ret





sum_c:
		;mov DI, offset espacio_largo
		mov DI, offset cod_name
ciclo_poner_dolar_1_c:
		mov AL, [DI]
		cmp AL, 00
		je poner_dolar_1_c
		inc DI
		jmp ciclo_poner_dolar_1_c
poner_dolar_1_c:
		mov AL, 24  ;; dólar
		mov [DI], AL
		;; imprimir normal
		;mov DX, offset espacio_largo
		mov al, [cod_name]
		;mov DX, offset cod_name
		cmp al, 61 ; Comparar con 'a'
		je sum_count
		cmp al, 41 ; Comparar con 'A'
		je sum_count
		cmp al, 62 ; Comparar con 'b'
		je sum_b
		cmp al, 42 ; Comparar con 'B'
		je sum_b
		cmp al, 63 ; Comparar con 'c'
		je sum_cc
		cmp al, 43 ; Comparar con 'C'
		je sum_cc
		cmp al, 64 ; Comparar con 'd'
		je sum_d
		cmp al, 44 ; Comparar con 'D'
		je sum_d
		cmp al, 65 ; Comparar con 'e'
		je sum_e
		cmp al, 45 ; Comparar con 'E'
		je sum_e
		cmp al, 66 ; Comparar con 'f'
		je sum_f
		cmp al, 46 ; Comparar con 'F'
		je sum_f
		cmp al, 67 ; Comparar con 'g'
		je sum_g
		cmp al, 47 ; Comparar con 'G'
		je sum_g
		cmp al, 68 ; Comparar con 'h'
		je sum_h
		cmp al, 48 ; Comparar con 'H'
		je sum_h
		cmp al, 69 ; Comparar con 'i'
		je sum_i
		cmp al, 49 ; Comparar con 'I'
		je sum_i
		cmp al, 6A ; Comparar con 'j'
		je sum_j
		cmp al, 4A ; Comparar con 'J'
		je sum_j
		cmp al, 6B ; Comparar con 'k'
		je sum_k
		cmp al, 4B ; Comparar con 'K'
		je sum_k
		cmp al, 6C ; Comparar con 'l'
		je sum_l
		cmp al, 4C ; Comparar con 'L'
		je sum_l
		cmp al, 6D ; Comparar con 'm'
		je sum_m
		cmp al, 4D ; Comparar con 'M'
		je sum_m
		cmp al, 6E ; Comparar con 'n'
		je sum_n
		cmp al, 4E ; Comparar con 'N'
		je sum_n
		cmp al, 6F ; Comparar con 'o'
		je sum_o
		cmp al, 4F ; Comparar con 'O'
		je sum_o
		cmp al, 70 ; Comparar con 'p'
		je sum_p
		cmp al, 50 ; Comparar con 'P'
		je sum_p
		cmp al, 71 ; Comparar con 'q'
		je sum_q
		cmp al, 51 ; Comparar con 'Q'
		je sum_q
		cmp al, 72 ; Comparar con 'r'
		je sum_r
		cmp al, 52 ; Comparar con 'R'
		je sum_r
		cmp al, 73 ; Comparar con 's'
		je sum_s
		cmp al, 53 ; Comparar con 'S'
		je sum_s
		cmp al, 74 ; Comparar con 't'
		je sum_t
		cmp al, 54 ; Comparar con 'T'
		je sum_t
		cmp al, 75 ; Comparar con 'u'
		je sum_u
		cmp al, 55 ; Comparar con 'U'
		je sum_u
		cmp al, 76 ; Comparar con 'v'
		je sum_v
		cmp al, 56 ; Comparar con 'V'
		je sum_v
		cmp al, 77 ; Comparar con 'w'
		je sum_w
		cmp al, 57 ; Comparar con 'W'
		je sum_w
		cmp al, 78 ; Comparar con 'x'
		je sum_x
		cmp al, 58 ; Comparar con 'X'
		je sum_x
		cmp al, 79 ; Comparar con 'y'
		je sum_y
		cmp al, 59 ; Comparar con 'Y'
		je sum_y
		cmp al, 7A ; Comparar con 'z'
		je sum_z
		cmp al, 5A ; Comparar con 'Z'
		je sum_z
;aqui
;sum_count:
	;	inc counter
		ret






sum_count:
		inc counter
		ret
sum_b:
		inc counter_b
		ret
sum_cc:
		inc counter_c
		ret
sum_d:
		inc counter_d
		ret
sum_e:
		inc counter_e
		ret
sum_f:
		inc counter_f
		ret
sum_g:
		inc counter_g
		ret
sum_h:
		inc counter_h
		ret
sum_i:	
		inc counter_i
		ret
sum_j:
		inc counter_j
		ret	
sum_k:
		inc counter_k
		ret
sum_l:
		inc counter_l
		ret
sum_m:
		inc counter_m
		ret
sum_n:
		inc counter_n
		ret
sum_nn:
		inc counter_nn
		ret
sum_o:
		inc counter_o
		ret
sum_p:
		inc counter_p
		ret
sum_q:
		inc counter_q
		ret
sum_r:
		inc counter_r
		ret
sum_s:	
		inc counter_s
		ret
sum_t:
		inc counter_t
		ret
sum_u:
		inc counter_u
		ret
sum_v:
		inc counter_v
		ret
sum_w:
		inc counter_w
		ret
sum_x:
		inc counter_x
		ret
sum_y:
		inc counter_y
		ret
sum_z:
		inc counter_z
		ret



;;; ENTRADA:
;;    BX -> handle
imprimir_estructura_html:
		mov BX, [handle_reps]
		mov AH, 40
		mov CH, 00
		mov CL, 04
		mov DX, offset tr_html
		int 21
		;;
		mov BX, [handle_reps]
		mov AH, 40
		mov CH, 00
		mov CL, 04
		mov DX, offset td_html
		int 21
		;;
		mov DX, offset cod_prod
		mov SI, 0000
ciclo_escribir_codigo:
		mov DI, DX
		mov AL, [DI]
		cmp AL, 00
		je escribir_pre
		cmp SI, 0006
		je escribir_pre
		mov CX, 0001
		mov BX, [handle_reps]
		mov AH, 40
		int 21
		inc DX
		inc SI
		jmp ciclo_escribir_codigo

;------------------------------------

escribir_pre:
		;;
		mov BX, [handle_reps]
		mov AH, 40
		mov CH, 00
		mov CL, 05
		mov DX, offset tdc_html
		int 21
		
		;;
		mov BX, [handle_reps]
		mov AH, 40
		mov CH, 00
		mov CL, 04
		mov DX, offset td_html
		int 21

		mov AX, [num_price]
		call numAcadena
		; [numero] tengo la cadena convertida Universidad de San Carlos de Guat
		mov BX, 0001
		mov CX, 0005
		mov DX, offset numero
		mov SI, 0000

ciclo_escribir_pre:
		mov DI, DX
		mov AL, [DI]
		cmp AL, 00
		je escribir_units
		cmp SI, 0006
		je escribir_units
		mov CX, 0001
		mov BX, [handle_reps]
		mov AH, 40
		int 21
		inc DX
		inc SI
		jmp ciclo_escribir_pre
;------------------------------------------------
escribir_units:
		;;
		mov BX, [handle_reps]
		mov AH, 40
		mov CH, 00
		mov CL, 05
		mov DX, offset tdc_html
		int 21
		
		;;
		mov BX, [handle_reps]
		mov AH, 40
		mov CH, 00
		mov CL, 04
		mov DX, offset td_html
		int 21

		mov AX, [num_units]
		call numAcadena
		; [numero] tengo la cadena convertida Universidad de San Carlos de Guat
		mov BX, 0001
		mov CX, 0005
		mov DX, offset numero
		mov SI, 0000
ciclo_escribir_units:
		mov DI, DX
		mov AL, [DI]
		cmp AL, 00
		je escribir_desc
		cmp SI, 0006
		je escribir_desc
		mov CX, 0001
		mov BX, [handle_reps]
		mov AH, 40
		int 21
		inc DX
		inc SI
		jmp ciclo_escribir_units
;-------------------------------------------------
escribir_desc:
		;;
		mov BX, [handle_reps]
		mov AH, 40
		mov CH, 00
		mov CL, 05
		mov DX, offset tdc_html
		int 21
		;;
		mov BX, [handle_reps]
		mov AH, 40
		mov CH, 00
		mov CL, 04
		mov DX, offset td_html
		int 21
		;;
		
;		mov AX, [num_price]
;		call numAcadena
;		; [numero] tengo la cadena convertida Universidad de San Carlos de Guat
;		mov BX, 0001
;		mov CX, 0005
		
		
;		mov DX, offset numero


		mov DX, offset cod_name

		mov SI, 0000
ciclo_escribir_desc:
		mov DI, DX
		mov AL, [DI]
		cmp AL, 00
		je cerrar_tags
		cmp SI, 0026
		je cerrar_tags
		mov CX, 0001
		mov BX, [handle_reps]
		mov AH, 40
		int 21
		inc DX
		inc SI
		jmp ciclo_escribir_desc
		;;


		;;



cerrar_tags:
		mov BX, [handle_reps]
		mov AH, 40
		mov CH, 00
		mov CL, 05
		mov DX, offset tdc_html
		int 21
		;;
		mov BX, [handle_reps]
		mov AH, 40
		mov CH, 00
		mov CL, 05
		mov DX, offset trc_html
		int 21
		;;
		ret


;; cadenaAnum
;; ENTRADA:
;;    DI -> dirección a una cadena numérica
;; SALIDA:
;;    AX -> número convertido
;
;captar_usuario
;
;;[31][32][33][00][00]
;;     ^
;;     |
;;     ----- DI
;;;;
;;AX = 0
;;10 * AX + *1*  = 1
;;;;
;;AX = 1
;;10 * AX + 2  = 12
;;;;
;;AX = 12
;;10 * AX + 3  = 123
;;;;
cadenaAnum:
		mov AX, 0000    ; inicializar la salida
		mov CX, 0005    ; inicializar contador
		;;
seguir_convirtiendo:
		mov BL, [DI]
		cmp BL, 00
		je retorno_cadenaAnum
		sub BL, 30      ; BL es el valor numérico del caracter
		mov DX, 000a
		mul DX          ; AX * DX -> DX:AX
		mov BH, 00
		add AX, BX 
		inc DI          ; puntero en la cadena
		loop seguir_convirtiendo
retorno_cadenaAnum:
		ret

;; numAcadena price
;; ENTRADA:
;;     AX -> número a convertir    
;; SALIDA:
;;    [numero] -> numero convertido en cadena
;;AX = 1500
;;CX = AX  <<<<<<<<<<<
;;[31][30][30][30][30]
;;                  ^
numAcadena:
		mov CX, 0005
		mov DI, offset numero
ciclo_poner30s:
		mov BL, 30
		mov [DI], BL
		inc DI
		loop ciclo_poner30s
		;; tenemos '0' en toda la cadena
		mov CX, AX    ; inicializar contador
		mov DI, offset numero
		add DI, 0004
		;;
ciclo_convertirAcadena:
		mov BL, [DI]
		inc BL
		mov [DI], BL
		cmp BL, 3a
		je aumentar_siguiente_digito_primera_vez
		loop ciclo_convertirAcadena
		jmp retorno_convertirAcadena
aumentar_siguiente_digito_primera_vez:
		push DI
aumentar_siguiente_digito:
		mov BL, 30     ; poner en '0' el actual
		mov [DI], BL
		dec DI         ; puntero a la cadena
		mov BL, [DI]
		inc BL
		mov [DI], BL
		cmp BL, 3a
		je aumentar_siguiente_digito
		pop DI         ; se recupera DI
		loop ciclo_convertirAcadena
retorno_convertirAcadena:
		ret

;; memset
;; ENTRADA:
;;    DI -> dirección de la cadena
;;    CX -> tamaño de la cadena
memset:
ciclo_memset:
		mov AL, 00
		mov [DI], AL
		inc DI
		loop ciclo_memset
		ret

;; cadenas_iguales -
;; ENTRADA:
;;    SI -> dirección a cadena 1
;;    DI -> dirección a cadena 2
;;    CX -> tamaño máximo
;; SALIDA:
;;    DL -> 00 si no son iguales

;;         0ff si si lo son
cadenas_iguales:
ciclo_cadenas_iguales:
		mov AL, [SI]
		cmp [DI], AL
		jne no_son_iguales
		inc DI
		inc SI
		loop ciclo_cadenas_iguales
		;;;;; <<<
		mov DL, 0ff
		ret
no_son_iguales:	
		mov DL, 00
		ret
limpiar_buffer:
		mov AH, 0ah
		mov DX, offset buffer_entrada
		int 21
		ret

validar_acceso:
		;; abrir archivo de configuración
		mov AH, 3d
		mov AL, 00
		mov DX, offset nombre_conf
		int 21
		mov [handle_conf], AX ; se guarda el handle
		;; analizarlo
ciclo_lineaXlinea:
		mov DI, offset buffer_linea 
		mov AL, 00
		mov [tam_liena_leida], AL ; inicializar el tamaño de la línea leída
ciclo_obtener_linea:
		mov AH, 3f
		mov BX, [handle_conf] ; se recupera el handle
		mov CX, 0001 ; se lee un caracter
		mov DX, DI ; se lee en el buffer
		int 21 ; se lee
		cmp CX, 0000 ; se verifica si se leyó 
		je fin_leer_linea ; si no se leyó, se termina
		mov AL, [DI] ; se recupera el caracter leído
		cmp AL, 0a ; se verifica si es un salto de línea
		je fin_leer_linea ; si es un salto de línea, se termina
		mov AL, [tam_liena_leida] ; se recupera el tamaño de la línea leída
		inc AL ; se incrementa
		mov [tam_liena_leida], AL ; se guarda el tamaño de la línea leída
		inc DI ; se incrementa el puntero
		jmp ciclo_obtener_linea ; se sigue leyendo
fin_leer_linea:
		mov AL, [tam_liena_leida]
		mov AL, 00
		cmp [estado], AL   ;; verificar la cadena credenciales
		je verificar_cadena_credenciales
		mov AL, 01 ; se incrementa el estado
		cmp [estado], AL   ;; obtener campo
		je obtener_campo_conf ; se obtiene el campo
		mov AL, 02; se incrementa el estado
		cmp [estado], AL   ;; obtener campo
		je obtener_campo_conf; se obtiene el campo
		jmp retorno_exitoso; se obtiene el campo
verificar_cadena_credenciales:
		cmp CX, 0000; se verifica si se leyó
		je retorno_fallido ; si no se leyó, se termina
		mov CH, 00 ; se limpia CH
		mov CL, [tk_creds]; se recupera el tamaño de la cadena
		mov SI, offset tk_creds; se recupera el tamaño de la cadena
		inc SI; se recupera el tamaño de la cadena
		mov DI, offset buffer_linea; se recupera el tamaño de la cadena
		call cadenas_iguales; se recupera el tamaño de la cadena
		cmp DL, 0ff; se verifica si son iguales
		je si_hay_creds; si son iguales, se incrementa el estado
		jmp retorno_fallido; si no son iguales, se termina
si_hay_creds:
		mov AL, [estado]
		inc AL
		mov [estado], AL
		jmp ciclo_lineaXlinea
		;;
obtener_campo_conf:
		cmp CX, 0000
		je retorno_fallido
		mov CH, 00
		mov CL, [tk_nombre]
		mov SI, offset tk_nombre
		inc SI
		mov DI, offset buffer_linea
		call cadenas_iguales
		cmp DL, 0ff
		je obtener_valor_usuario
		;;;;;;;;;;;;;;;;;;;;;;;;;;;;
		mov CH, 00
		mov CL, [tk_clave]
		mov SI, offset tk_clave
		inc SI
		mov DI, offset buffer_linea
		call cadenas_iguales
		cmp DL, 0ff
		je obtener_valor_clave
		jmp retorno_fallido
obtener_valor_usuario:
ciclo_espacios1:
		inc DI
		mov AL, [DI]
		cmp AL, 20    ;; ver si es espacio
		jne ver_si_es_igual
		inc DI
		jmp ciclo_espacios1
ver_si_es_igual:
		mov CH, 00
		mov CL, [tk_igual]
		mov SI, offset tk_igual
		inc SI
		call cadenas_iguales
		cmp DL, 0ff
		je obtener_valor_cadena_usuario
		jmp retorno_fallido
obtener_valor_cadena_usuario:
ciclo_espacios2:
		inc DI
		mov AL, [DI]
		cmp AL, 20    ;; ver si es espacio
		jne capturar_usuario
		inc DI
		jmp ciclo_espacios2
capturar_usuario:
		mov CX, 0006    ;; TAMAÑO DEL USUARIO: 6 caracteres
		mov SI, offset usuario_capturado
ciclo_cap_usuario:
		inc DI
		inc SI
		mov AL, [DI]
		mov [SI], AL
		loop ciclo_cap_usuario
		mov AL, [estado]
		inc AL
		mov [estado], AL
		jmp ciclo_lineaXlinea
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;,
obtener_valor_clave:
ciclo_espacios3:
		inc DI
		mov AL, [DI]
		cmp AL, 20    ;; ver si es espacio
		jne ver_si_es_igual2
		inc DI
		jmp ciclo_espacios3
ver_si_es_igual2:
		mov CH, 00
		mov CL, [tk_igual]
		mov SI, offset tk_igual
		inc SI
		call cadenas_iguales
		cmp DL, 0ff
		je obtener_valor_cadena_clave
		jmp retorno_fallido
obtener_valor_cadena_clave:
ciclo_espacios4:
		inc DI
		mov AL, [DI]
		cmp AL, 20    ;; ver si es espacio
		jne capturar_clave
		inc DI
		jmp ciclo_espacios4
capturar_clave:
		mov CX, 0009    ;; TAMAÑO DE LA CLAVE: 9 caracteres
		mov SI, offset clave_capturada
ciclo_cap_clave:
		inc DI
		inc SI
		mov AL, [DI]
		mov [SI], AL
		loop ciclo_cap_clave
		mov AL, [estado]
		inc AL
		mov [estado], AL
		jmp ciclo_lineaXlinea
		;; ver si el nombre de campo es "usuario"
		;;      trabajo con la línea
		;; comparar nombre
		;; comparar clave
		;; si son correctos devolver en DL = 0ff
		;; si no son correctos devolver en DL = 00
retorno_fallido:
		mov DL, 00
		ret
retorno_exitoso:
		mov DL, 0ff
		ret
es_a:
	inc counter
	

fin:
.EXIT
END