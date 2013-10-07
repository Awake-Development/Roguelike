type
   Tile = record
   public
      isWall : boolean;
   end;
   
   Map = class
   public
      function isWall(x, y: integer) : boolean;
      procedure setWall(x, y: integer);
      procedure render();
   private
      const height: integer = 50;
      const width: integer = 50;
      tiles: array [1..height, 1..width] of Tile;
   end;
   
function Map.isWall (x, y: integer) :boolean;
begin
   Map.isWall := tiles[y][x].isWall;
end;

procedure Map.setWall(x, y: integer);
begin
   tiles[y][x].isWall := true;
end;

procedure Map.render();
var
   x, y: integer;
begin
   for y := 1 to height do
      for x := 1 to width do
         begin
         if (tiles[y][x].isWall) then write('#')
         else write(' ');
         if (x = width) then writeln();
         end;
end;