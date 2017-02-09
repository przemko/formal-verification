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

   procedure Swap (T : in out Table; I : in Integer; J : in Integer)
     with
       Depends => (T => (T, I, J)),
       Pre => T'Length > 1 and then I in T'Range and then J in T'Range and then I < J,
     Post => (for all K in T'Range => (if K /= I and then K /= J then T (K) = T'Old (K))) and then
                T (I) = T'Old (J) and then T (J) = T'Old (I);

   procedure Bubble (T : in out Table; I : in Integer)
     with
       Depends => (T => (T, I)),
       Pre => T'Length > 0 and then I in T'Range and then T'First > Integer'First and then T'Last < Integer'Last,
     Post =>
       (for all J in T'First .. I => T(J) <= T(I)) and then
       (for all J in I + 1 .. T'Last => T (J) = T'Old (J));

   procedure Sort (T : in out Table)
     with
       Depends => (T => T),
     Pre =>
       T'Length >= 1 and then
       T'Last > Integer'First and then
       T'Last < Integer'Last - 1  and then
       T'First > Integer'First and then
       T'First < Integer'Last - 1,
       Post =>
         Is_Sorted (T);

end Bubbles;
