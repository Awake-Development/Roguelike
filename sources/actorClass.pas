unit actorClass;

interface

uses
   crt, mapClass;

type
   Actor = record//объявление структуры персонажа
   public
      procedure setValues(x, y: integer; c: char);//получение значений (инициализация)
      procedure moveActor(level: Map);//осуществление передвежения
   private
      posX, posY: integer;
      ch: char;
   end;

implementation

procedure Actor.setValues(x, y: integer; c: char);
begin
   posX := x;
   posY := y;
   ch := c;
   
   gotoxy(x, y);//первичный рендер при получении значений
   write(ch);
end;

procedure Actor.moveActor(level: Map);
var
   input: char;
begin
   input := readkey;//получение клавиши управления
   
   gotoxy(posX, posY);//затирание старой позиции
   write(' ');   
   
   case input of //осуществление изменения текущих координат
      #37: if (not level.isWall(posX - 1, posY) ) then posX -= 1;
      #38: if (not level.isWall(posX, posY - 1) ) then posY -= 1;
      #39: if (not level.isWall(posX + 1, posY) ) then posX += 1;
      #40: if (not level.isWall(posX, posY + 1) ) then posY += 1;
   end;
   
   gotoxy(posX, posY);//рендер в новой позиции  
   write(ch);     
   
end;

end.