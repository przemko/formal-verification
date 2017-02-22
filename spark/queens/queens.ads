function Queens (N : Integer) return Natural
  with
    Pre => N >= 1 and then N <= 32;
