select 'Undo change vector size(Mb): ' ||
       Round(St.Value / (1024 * 1024), 2)
  from V$sesstat St, V$session Ss, V$statname Sn
 where St.Sid = Ss.Sid
   and St.Statistic# = Sn.Statistic#
   and Sn.Name = 'undo change vector size'
   and Ss.Sid =  :sid
