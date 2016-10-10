select 'alter system kill session ' || Chr(39) || s.Sid || ',' ||
       s.Serial# || Chr(39) || ';',
       'kill -9 ' || p.Spid
  from V$process p, V$session s
 where s.Sid = :sid
   and p.Addr = s.Paddr
