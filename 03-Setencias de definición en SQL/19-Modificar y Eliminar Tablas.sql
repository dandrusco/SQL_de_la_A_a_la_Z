/*
Modificar Tablas
================
ALTER TABLE nombreTabla
	{AccionDeModificarColumna | AccionDeModificarRestriccionDeLaTabla}
    
- AccionDeModificarColumna :=
	{ADD [COLUMN] nombreColumna definicionColumna |
     ADD [COLUMN] nombreColumna {SET DEFAULT valorPorDefecto | DROP DEFAULT} |
     DROP [COLUMN] nombreColumna {RESTRICT | CASCADE} 
    }
    
- AccionDeModificarRestriccionDeLaTabla :=
	{ADD restriccion |
     DROP CONSTRAINT nombreRestriccion {RESTRICT | CASCADE} 
    }
*/

/*
Borrar Tablas
================
DROP nombreTabla {RESTRICT | CASCADE};
*/