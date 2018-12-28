select p.Tracefile
  from gV$session s, gV$process p
 where s.Sid = :Sid
   and p.Addr = s.Paddr
