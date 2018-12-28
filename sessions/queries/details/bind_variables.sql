select b.Name, b.Datatype_String, b.Value_String, b.POSITION
  from Gv$sql_Bind_Capture b, Gv$session s
 where s.Sql_Id = :sql_id and s.sid=:sid and s.INST_ID=:inst_id
   and b.Address = s.Sql_Address

