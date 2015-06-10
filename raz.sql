Begin
For c in (select type_name from user_types) loop
  execute immediate ('drop type ' || c.type_name || ' force');
End loop;
For c in (select object_name from user_objects where object_type='TABLE') loop
  execute immediate ('drop table ' || c.object_name || ' cascade constraints');
End loop;
For c in (select object_name from user_objects where object_type='VIEW') loop
  execute immediate ('drop view ' || c.object_name);
End loop;
End;
