unit iostream;

interface

uses
   types, crt;

procedure moveObject(input: char; map: field; posX, posY: ^integer);//функция перемещения объекта (будет внесена в класс)
procedure background(map: field);//функция вывода уровня на экран (как задника)

implementation

procedure background(map: field);

var
   x, y: integer;//переменные для счетчиков

begin
   for y := 1 to h do
      for x := 1 to w do
      begin
         if (map[y][x] = 1) then write('#')//если в массиве стена, то выводится "#"
         else write(' ');//если в массиве пол, то выводится пробел
         if (x = h) then writeln();//если строка кончается,то осуществляется переход на новую строку
      end;
end;

procedure moveObject(input: char; map: field; posX, posY: ^integer);
begin
   gotoxy(posX^, posY^);  
   write(' ');   
   
   case input of //осуществление изменения текущих координат
      #37: if (map[posY^][posX^ - 1] = 0) then posX^ -= 1;
      #38: if (map[posY^ - 1][posX^] = 0) then posY^ -= 1;
      #39: if (map[posY^][posX^ + 1] = 0) then posX^ += 1;
      #40: if (map[posY^ + 1][posX^] = 0) then posY^ += 1;
   end;
   
   gotoxy(posX^, posY^);  
   write('@');         
end;

end.