function F91 (N : Integer) return Integer
  with 
  SPARK_Mode,
  Post => (if N <= 100 then F91'Result = 91 else F91'Result = N - 10)
     is
begin
   if N <= 100 then
      return F91 (F91 (N + 11));
   else
      return N - 10;
   end if;
end F91;
