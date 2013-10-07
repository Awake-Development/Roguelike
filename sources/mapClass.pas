unit mapClass;

interface

type
   Tile = record//��������� ������ ������
   public
      isWall : boolean;//�������� �� ������
   end;
   
   Map = class
   public
      constructor create ();//����������� ������ (�������������)
      function isWall(x, y: integer) : boolean;//�������� �������� �� ������ ������
      procedure setWall(x, y: integer);//��������� ����� � ������
      procedure render();//����� ������ �� �����
   private
      const height: integer = 50;//��������� ������� ������
      const width: integer = 50;
      tiles: array [1..height, 1..width] of Tile;//��������� ������ ������
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
   isWall := tiles[y][x].isWall;//���������� �������� ������������ ������� ������
end;

procedure Map.setWall(x, y: integer);
begin
   tiles[y][x].isWall := true;//��������� ����� � ������� ������
end;

procedure Map.render();
var
   x, y: integer;
begin
   for y := 1 to height do
      for x := 1 to width do
      begin
         if (tiles[y][x].isWall) then write('#')//��� � ������ �����, �� ��������� �������
         else write(' ');//����� ������
         if (x = width) then writeln();//���� ������ ���������,�� �������������� ������� �� ����� ������
      end;
end;

end.