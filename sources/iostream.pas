unit iostream;

interface

uses
   types, crt;

procedure moveObject(input: char; map: field; posX, posY: ^integer);//функци€ перемещени€ объекта (будет внесена в класс)
procedure background(map: field);//функци€ вывода уровн€ на экран (как задника)

implementation

procedure background(map: field);

var
   x, y: integer;//переменные дл€ счетчиков

begin
   for y := 1 to h do
      for x := 1 to w do
      begin
         if (map[y][x] = 1) then write('#')//если в массиве стена, то выводитс€ "#"
         else write(' ');//если в массиве пол, то выводитс€ пробел
         if (x = h) then writeln();//если строка кончаетс€,то осуществл€етс€ переход на новую строку
      end;
end;

procedure moveObject(input: char; map: field; posX, posY: ^integer);
var
   prevX, prevY: integer;//предыдуща€ позици€ объекта (в классе объ€вление этих переменных скорее всего будет не нужно)
begin
   prevX := posX^;
   prevY := posY^;
   gotoxy(prevX, prevY);  
   write(' ');   
   
   case input of //осуществление изменени€ текущих координат
      #37: if (map[posY^][posX^ - 1] = 0) then posX^ -= 1;
      #38: if (map[posY^ - 1][posX^] = 0) then posY^ -= 1;
      #39: if (map[posY^][posX^ + 1] = 0) then posX^ += 1;
      #40: if (map[posY^ + 1][posX^] = 0) then posY^ += 1;
   end;
   
   gotoxy(posX^, posY^);  
   write('@');         
end;

end.