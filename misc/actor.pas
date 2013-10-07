program Actor;
type
   Actor = record
   public
      procedure setValues(x, y: integer; c: char);
      procedure moveActor(level: Map);
   private
      posX, posY: integer;
      ch: char;
   end;
   
procedure Actor.setValues(x, y: integer; c: char);
begin
   posX := x;
   posY := y;
   ch := c;
   
   gotoxy (x, y);
   write (ch);
end;

procedure Actor.moveActor(level: Map);
var
   input: char;
begin
   input := readkey;
   
   gotoxy(posX, posY);  
   write(' ');   
   
   case input of //осуществление изменения текущих координат
      #37: if ( not level.isWall(posX - 1, posY) ) then posX -= 1;
      #38: if ( not level.isWall(posX, posY - 1) ) then posY -= 1;
      #39: if ( not level.isWall(posX + 1, posY) ) then posX += 1;
      #40: if ( not level.isWall(posX, posY + 1) ) then posY += 1;
   end;
   
   gotoxy(posX, posY);  
   write(ch);     
   
end;