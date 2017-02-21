pragma SPARK_Mode;

function F91 (N : Integer) return Integer
  with
    Post => (if N <= 100 then F91'Result = 91 else F91'Result = N - 10);
