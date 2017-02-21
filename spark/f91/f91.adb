pragma SPARK_Mode;

function F91 (N : Integer) return Integer
is
begin
   if N <= 100 then
      return F91 (F91 (N + 11));
   else
      return N - 10;
   end if;
end F91;
