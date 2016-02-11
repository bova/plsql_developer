SELECT lpad(' ', 2 * level) || pt.operation || ' ' || pt.options || ' ' ||
       pt.object_name "Query Plan",
       pt.cost,
       pt.cardinality,
       pt.bytes,
       pt.cpu_cost,
       pt.io_cost,
       pt.access_predicates,
       pt.filter_predicates,
       pt.qblock_name,
       pt.temp_space
FROM (select *
from v$sql_plan
where sql_id = :sql_id and child_number = :sql_child_number) pt
CONNECT BY PRIOR pt.id = pt.parent_id
START WITH pt.id = 0;