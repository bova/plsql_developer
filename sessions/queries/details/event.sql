select :Event || '(' || :Seq# || ') ' --|| :Client_Info Sql_Text
  from Dual
union all
select  'Client Info: ' || :Client_Info Sql_Text from dual
union all
select Lower(a.Owner || '.' || a.Object_Name ||
             Decode(a.Subobject_Name,
                    null,
                    '',
                    '(' || a.Subobject_Name || ')')) Sql_Text
  from All_Objects a
 where a.Object_Id = :Row_Wait_Obj#
union all
select *
  from (select a.Message || '    Elapsed (sec):' || a.Elapsed_Seconds ||
               '   Remaining(sec):' || a.Time_Remaining
          from V$session_Longops a
         where a.Sid = :Sid
           and a.Serial# = :Serial#
         order by Last_Update_Time desc)
 where Rownum = 1
union all
select *
  from (select Sql_Text
          from V$sqltext_With_Newlines
         where Sql_Id = :Sql_Id
         order by Piece)
