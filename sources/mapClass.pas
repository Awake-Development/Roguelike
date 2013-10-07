unit mapClass;

interface

type
   Tile = record//структура клетки уровня
   public
      isWall : boolean;//является ли стеной
   end;
   
   Map = class
   public
      constructor create ();//конструктор класса (инициализация)
      function isWall(x, y: integer) : boolean;//проверка является ли клетка стеной
      procedure setWall(x, y: integer);//установка стены в клетке
      procedure render();//вывод уровня на экран
   private
      const height: integer = 50;//константы размера уровня
      const width: integer = 50;
      tiles: array [1..height, 1..width] of Tile;//двумерный массив клеток
   end;

implementation

constructor Map.create();
var
   i, j: integer;
begin
   for i := 1 to height do
      for j := 1 to width do
         tiles[i][j].isWall := false;
end;

function Map.isWall(x, y: integer): boolean;
begin
   isWall := tiles[y][x].isWall;//возращение значения проходимости текущей клетки
end;

procedure Map.setWall(x, y: integer);
begin
   tiles[y][x].isWall := true;//установка стены в текущей клетке
end;

procedure Map.render();
var
   x, y: integer;
begin
   for y := 1 to height do
      for x := 1 to width do
      begin
         if (tiles[y][x].isWall) then write('#')//ели в клетке стена, то выводится решётка
         else write(' ');//иначе пробел
         if (x = width) then writeln();//если строка кончается,то осуществляется переход на новую строку
      end;
end;

end.