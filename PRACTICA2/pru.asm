print macro  p
mov ax,@data
mov ds,ax
mov ah,09h ;numero de funcion para imprimir cadena en pantalla
mov dx,offset p;equivalente a lea dx,caden,inicializa en dx la posicion donde comienza la cadena
int 21h
endm

getChar macro
 mov ah, 01
 int 21
endm



.model small
.RAdiX 16
;----------------------SEGMENTO DE PILA---------------------- 
.stack
;----------------------SEGMENTO DE DATO----------------------
.data
cadena1 db 0ah,0dh,'Universidad de San Carlos de Guatemala', '$'
cadena2 db 0ah,0dh,'Facultad de Ingenieria', '$'
cadena3 db 0ah,0dh, 'Escuela de Vacaciones', '$'
cadena4 db 0ah,0dh,'Arquitectura de Computadoras y Ensambladores 1','$'

opcionP db 0ah,0dh,'1) Productos', '$'
opcionP1 db 0ah,0dh,'1) Ingreso de productoss', '$'
opcionP2 db 0ah,0dh,'2) Eleminacion de productos', '$'
opcionP3 db 0ah,0dh,'3) Visualizacion de productos', '$'
opcionP4 db 0ah,0dh,'4) Volver al menu principal', '$'
opcionP5 db 0ah,0dh,'5) Salir', '$' 



opcionV db 0ah,0dh,'2) Ventas', '$'
opcionV1 db 0ah,0dh,'1) Volver al menu principal', '$'

opcionH db 0ah,0dh,'3) Herramientas', '$'
opcionH1 db 0ah,0dh,'1) Generacion de catalogo completo', '$'
opcionH2 db 0ah,0dh,'2) Reporte alfabetico de productos', '$'
opcionH3 db 0ah,0dh,'3) Reporte de ventas', '$'
opcionH4 db 0ah,0dh,'4) Reporte de productos sin exitencias', '$'
opcionH5 db 0ah,0dh,'5) Volver al menu principal', '$'
opcionH6 db 0ah,0dh,'6) Salir', '$'

opcionS db 0ah,0dh,'4) Salir', '$'

Espacio db 0ah,0dh,' ', '$'

buffer_entrada   db  20, 00
                 db  20 dup (0)
nn_cod db 0ah,0dh,'Codigo: ', '$'
nn_name db 0ah,0dh,'Descripcion del codigo: ', '$'
nn_price db 0ah,0dh,'Precio: ', '$'
nn_units db 0ah,0dh,'Unidades: ', '$'

nueva_lin  db    0a,"$"

; "PRODUC ESTRUC"
n_cod   db    05 dup (0)
n_name    db    21 dup (0)
n_price   db    05 dup (0)
n_units   db    05 dup (0)

num_price  dw    0000
num_units  dw    0000
;archivo productos
archivo_prods    db   "PROD.BIN",00
handle_prods     dw   0000
;;
ceros          db     2b  dup (0)
;; VARIABLES | MEMORIA RAM
numero           db   05 dup (30)

;-----------------------SEGMENTO DE COdiGO-------------------
.code
main proc
    prueba:
    impr:
    	mov ax, 7e7
		call numAcadena
		mov BX, 01
		mov cx, 0005
		mov dx, offset numero
		mov ah, 40
		int 21
		mov dx, offset nueva_lin
		mov ah, 09
        int 21
        print cadena1
        print cadena2
        print cadena3
        print cadena4
        print Espacio
    
    MenuPrincipal:
        print Espacio
        print opcionP
        print opcionV
        print opcionH
        print opcionS
        print Espacio
        getChar
        cmp al, 31;codigo ascii del numero 1 en hexadecimal
        je Productos
        cmp al, 32;codigo ascii del numero 2 en hexadecimal
        je Ventas 
        cmp al, 33;codigo ascii del numero 3 en hexadecimal
        je Herramietas
        cmp al, 34;codigo ascii del numero 4 en hexadecimal
        je Salir
        jmp MenuPrincipal


    Productos:
        print Espacio
        print opcionP1
        print opcionP2
        print opcionP3
        print opcionP4
        print opcionP5
        print Espacio
        getChar
        cmp al, 31;codigo ascii del numero 1 en hexadecimal
        je ingreso_cod

        cmp al, 34;codigo ascii del numero 4 en hexadecimal
        je MenuPrincipal
        cmp al, 35;codigo ascii del numero 5 en hexadecimal
        je Salir


    Ventas:
        print opcionV
        print opcionV1
        print Espacio
        getChar
        cmp al, 31;codigo ascii del numero 1 en hexadecimal
        je MenuPrincipal

    Herramietas:
        print opcionH1
        print opcionH2
        print opcionH3
        print opcionH4
        print opcionH5
        print opcionH6
        print Espacio
        getChar
        cmp al, 35;codigo ascii del numero 5 en hexadecimal
        je MenuPrincipal

    ingreso_cod:
        print nn_cod
        mov dx, offset buffer_entrada
        mov ah,0a
        int 21
        ;verificar que el tamaño del codigo no sea mayor a 5
        mov di, offset buffer_entrada
        inc di 
        mov al, [di]
        cmp al,00   
        je ingreso_cod
        cmp al,05
        jb aceptar_tam_cod
        mov dx, offset nueva_lin
        mov ah, 09
        int 21
        jmp ingreso_cod
    aceptar_tam_cod:
        mov si, offset n_cod
        mov di, offset buffer_entrada
        inc di
        mov ch,00
        mov cl, [di]
        inc di ;me posiciono en el contenido del buffer
    copiar_cod:
        mov al,[di]
        mov [si],al
        inc si
        inc di
        loop copiar_cod
        mov dx, offset nueva_lin
        mov ah, 09
        int 21



    ingreso_name:
        print nn_name
        mov dx, offset buffer_entrada
        mov ah,0a
        int 21
        ;verificar que el tamaño del codigo no sea mayor a 5
        mov di, offset buffer_entrada
        inc di 
        mov al, [di]
        cmp al,00   
         je ingreso_name
        cmp al,20
        jb aceptar_tam_name
        mov dx, offset nueva_lin
        mov ah, 09
        int 21
        jmp ingreso_name  
    aceptar_tam_name:
        mov si, offset n_name
        mov di, offset buffer_entrada
        inc di
        mov ch,00
        mov cl, [di]
        inc di ;me posiciono en el contenido del buffer
    copiar_name:
        mov al,[di]
        mov [si],al
        inc si
        inc di
        loop copiar_name
        mov dx, offset nueva_lin
        mov ah, 09
        int 21


    ingreso_price:
        print nn_price
        mov dx, offset buffer_entrada
        mov ah,0a
        int 21
        ;verificar que el tamaño del codigo no sea mayor a 5
        mov di, offset buffer_entrada
        inc di 
        mov al, [di]
        cmp al,00   
        je ingreso_price
        cmp al,06
        jb aceptar_tam_price
        mov dx, offset nueva_lin
        mov ah, 09
        int 21
        jmp ingreso_price
    aceptar_tam_price:
        mov si, offset n_price
        mov di, offset buffer_entrada
        inc di
        mov ch,00
        mov cl, [di]
        inc di ;me posiciono en el contenido del buffer
    copiar_price:
        mov al,[di]
        mov [si],al
        inc si
        inc di
        loop copiar_price

        mov dx, offset nueva_lin
        mov ah, 09
        int 21

		mov di, offset n_price
		call cadenaAnum
		;; ax -> numero convertido
		mov [num_price], ax
		;;
		mov di, offset n_price
		mov cx, 0005
		call memset


    ingreso_units:
        print nn_units
        mov dx, offset buffer_entrada
        mov ah,0a
        int 21
        ;verificar que el tamaño del codigo no sea mayor a 5
        mov di, offset buffer_entrada
        inc di 
        mov al, [di]
        cmp al,00   
        je ingreso_units
        cmp al,06
        jb aceptar_tam_units
        mov dx, offset nueva_lin
        mov ah, 09
        int 21
        jmp ingreso_units
    aceptar_tam_units:
        mov si, offset n_units
        mov di, offset buffer_entrada
        inc di
        mov ch,00
        mov cl, [di]
        inc di ;me posiciono en el contenido del buffer
    copiar_units:
        mov al, [di]
        mov [si], al
        inc si
        inc di
        loop copiar_units ;; restarle 1 a cx, verificar que cx no sea 0, si no es 0 va a la etiqueta
      


      	mov di, offset n_units
		call cadenaAnum
		;; ax -> numero convertido
		mov [num_units], ax
		;;
		mov di, offset n_units
		mov cx, 0005
		call memset



        mov al, 02 
        mov ah, 3d 
        mov dx, offset archivo_prods
        int 21 
        ;; si no lo cremos
		jc  crear_archivo_prod
		;; si abre escribimos
		jmp guardar_handle_prod

    crear_archivo_prod:
            mov cx, 0000
            mov dx, offset archivo_prods
            mov ah, 3cDX
            int 21
            ;; archivo abierto
    guardar_handle_prod:
            ;; guardamos handle 
            mov [handle_prods], ax
            ;; obtener handle
            mov bx, [handle_prods]
            ;; vamos al final del archivo
            mov cx, 00
            mov dx, 00
            mov al, 02
            mov ah, 42
            int 21
            ;; escribí los dos primeros campos
            mov cx, 26
            mov dx, offset n_cod 
            mov ah, 40
            int 21
		;; escribo los otros dos
            mov cx, 0004
            mov dx, offset num_price
            mov ah, 40
            int 21
            ;; cerrar archivo
            mov ah, 3e
            int 21
            jmp Productos

        cadenaAnum:
                mov ax, 0000    ; inicializar la salida
                mov cx, 0005    ; inicializar contador
        seguir_convirtiendo:
                mov bl, [di]
                cmp bl, 00
                je retorno_cadenaAnum
                sub bl, 30      ; BL es el valor numérico del caracter
                mov dx, 000a
                mul dx         ; ax * dx -> dx:ax
                mov bh, 00
                add ax, bx
                inc di          ; puntero en la cadena
                loop seguir_convirtiendo
        retorno_cadenaAnum:
                ret
        numAcadena:
            mov cx, 0005
            mov di, offset numero
        ciclo_poner30s:
                mov bl, 30
                mov [di], bl
                inc di
                loop ciclo_poner30s
                ;; tenemos '0' en toda la cadena
                mov cx, ax    ; inicializar contador
                mov di, offset numero
                add di, 0004
                ;;
        ciclo_convertirAcadena:
                mov bl, [di]
                inc bl
                mov [di], bl
                cmp bl, 3a
                je aumentar_siguiente_digito_primera_vez
                loop ciclo_convertirAcadena
                jmp retorno_convertirAcadena
        aumentar_siguiente_digito_primera_vez:
                push di
        aumentar_siguiente_digito:
                mov bl, 30     ; poner en '0' el actual
                mov [di], bl
                dec di       ; puntero a la cadena
                mov bl, [di]
                inc bl
                mov [di], bl
                cmp bl, 3a
                je aumentar_siguiente_digito
                pop di         ; se recupera di
                loop ciclo_convertirAcadena
        retorno_convertirAcadena:
                ret
        memset:
        ciclo_memset:
                mov al, 00
                mov [di], al
                inc di
                loop ciclo_memset
                ret

        cadenas_iguales:
        ciclo_cadenas_iguales:
                mov al, [si]
                cmp [di], al
                jne no_son_iguales
                inc di
                inc si
                loop ciclo_cadenas_iguales
                ;;;;; <<<
                mov dl, 0ff
                ret
        no_son_iguales:	mov dl, 00
                ret



    Salir:
        mov ah, 4ch;Numero de funcion para finalizar el programa
        xor al,al ;equivalente a lea dx,caden,inicializa en dx la posicion donde comienza la cadena fin
        int 21h
 

main endp
end main
