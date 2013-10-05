//v. 0.0.1
uses
   crt, types, iostream;

var
   map: field;
   input: char;
   posX, posY: integer;

//временная процедура иницилизации карты, позже будет удалена (т.к. карта уровня будет иницилизироваться в функции-генераторе
procedure mapInit ();
var
   i, j: integer;
begin
   for i := 1 to h do
      for j := 1 to w do
         map[i][j] := 0;
   
   for j := 1 to w do
   begin;
      map[1][j] := 1;
      map[j][1] := 1;
      map[h][j] := 1;
      map[j][w] := 1;
   end;
end;

begin
   posX := w div 2;//размещение игрока по центру карты
   posY := h div 2;
   input := #0;
   mapInit();
   
   background(map);
   
   while (input <> #27) do //основной цикл игры
   begin
      moveObject(input, map, @posX, @posY);
      input := readkey;//считывание клавиши управления
   end;
   
end.