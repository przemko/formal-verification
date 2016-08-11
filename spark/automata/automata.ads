package Automata with SPARK_Mode is

  type Trans_Table is array (Natural range <>, Character range <>) of Natural;

  function Automaton (W : String; T : Trans_Table) return Natural
  with
    Pre => 0 in T'Range (1) 
    and (for all I in T'Range (1) => (for all J in T'Range (2) => T (I, J) in T'Range (1)))
    and (for all I in W'Range => W (I) in T'Range (2)),
    Post => Automaton'Result in T'Range (1);

end Automata;

