select 'alter system kill session ' || Chr(39) || s.Sid || ',' || s.Serial# || ',@' ||
       s.Inst_Id || Chr(39) || ';' Kill_On_Db,
       'kill -9 ' || p.Spid Kill_On_Os,
       i.Host_Name,
       i.Instance_Name
  from Gv$process p, Gv$session s, Gv$instance i
 where s.Sid = :Sid
   and s.Serial# = :Serial#
   and s.Inst_Id = :Inst_Id
   and p.Inst_Id = :Inst_Id
   and s.Inst_Id = i.Inst_Id
   and p.Addr = s.Paddr
