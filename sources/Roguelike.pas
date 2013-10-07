//v. 0.0.1
uses
   crt, mapClass, actorClass;

var
   player: Actor;
   level: Map := new Map();

//временная процедура иницилизации карты, позже будет удалена (т.к. карта уровня будет иницилизироваться в функции-генераторе
procedure mapInit ();
var
   i: integer;
begin   
   for i := 1 to 50 do        // Расставляем крайние стены поля
   begin;
      level.setWall(i, 1);
      level.setWall(1, i);
      level.setWall(i, 50);
      level.setWall(50, i);
   end;
end;

begin
   mapInit();
   level.render();
   player.setValues (25, 25, '@');
   
   while (true) do //основной цикл игры
   begin
      player.moveActor(level);
   end;
   
end.