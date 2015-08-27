select 'Tempseg Usage(blocks): ' || sum(u.Blocks)
  from V$session s, V$tempseg_Usage u
 where s.Saddr = u.Session_Addr
   and s.Sid = 12353
