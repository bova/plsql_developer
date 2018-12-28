select 'Tempseg Usage(blocks): ' || sum(u.Blocks)
  from gV$session s, gV$tempseg_Usage u
 where s.Saddr = u.Session_Addr
   and s.Sid =  :sid
