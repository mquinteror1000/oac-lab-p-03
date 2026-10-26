-- librerias, no necesarias tdavia para esta practica
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

-- los comentarios inician con dos guiones
-- multiplexor de dos lineas de emtrada ( a y b )
-- a una sola linea de salida tambien de un bit
-- señal select sirve para seleccionar la linea
-- seleccionar la linea a cuando select = 0 , seleccionar la linea b cuando select = 1
entity practica3 is
	port(
		a: in bit;
		b: in bit;
		selec: in bit;
		salida: out bit
	);
end practica3;

architecture comportamental of practica3 is
begin
	process (a, b, selec)
	begin 
		if ( selec = '0' ) then
			salida <= a;
		else
			salida <= b;
		end if;
	end process;
end comportamental;

architecture flujo1 of practica3 is
signal nosel, ax, bx: bit;
	begin nosel <= not selec;
	ax <= a and nosel;
	bx <= b and selec;
	salida <= ax OR bx;
end flujo1;

architecture flujo2 of practica3 is
begin
	salida <= a when selec='0' else b;
end flujo2;