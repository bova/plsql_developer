select p.Tracefile
  from V$session s, V$process p
 where s.Sid = :Sid
   and p.Addr = s.Paddr
