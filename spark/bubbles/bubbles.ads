package Bubbles with SPARK_Mode is

   type Table is array (Integer range <>) of Integer;

   function Is_Sorted (T : in Table) return Boolean
   is
     (for all I in T'First .. T'last - 1 => T (I) <= T (I + 1))
   with
   Ghost,
   Pre => T'Last > Integer'First;

   function Is_Maximum (T : in Table; Value : in Integer) return Boolean
   is
     ((for all I in T'Range => T (I) <= Value) and then
        (for some I in T'Range => T (I) = Value))
   with
   Ghost;

   procedure Sort (T : in out Table)
     with
       Pre => T'Last > Integer'First,
       Post => Is_Sorted (T);

end Bubbles;
