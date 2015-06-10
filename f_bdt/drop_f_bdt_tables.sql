DROP TABLE exceptions;

DROP TABLE f_bdt_labels;
DROP TABLE f_bdt_set;
DROP TABLE f_bdt_pool;
DROP TABLE f_bdt_tags;
DROP TABLE f_bdt_galleries;

DROP TABLE f_bdt_photos;

DROP TABLE f_bdt_date;
DROP TABLE f_bdt_location;
DROP TABLE f_bdt_server;
DROP TABLE f_bdt_user;

Begin
For c in (select type_name from user_types) loop
  execute immediate ('drop type ' || c.type_name || ' force');
End loop;
End;