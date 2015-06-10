SET ECHO OFF
/*
@raz.sql
*/
PROMPT '************************************************************'
PROMPT 'creation des directories'
PROMPT '************************************************************'

alter session disable parallel ddl;
alter session disable parallel dml;
alter session disable parallel query;

@f_bde/f_bde_directories.sql

@f_bde/drop_f_bde_tables.sql

@f_bde/PASCAL/f_bde_Pascal.sql
@f_bde/MIR/f_bde_Mir.sql
@f_bde/CLEF/f_bde_Clef.sql

@f_bde/UNION/f_bde_union.sql
