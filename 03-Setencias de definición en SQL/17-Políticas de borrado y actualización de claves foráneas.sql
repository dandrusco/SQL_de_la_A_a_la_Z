/*
Politicas de borrado de las Claves Foraneas
-------------------------------------------
FOREIGN KEY claveSecundaria
	REFERENCE table [(claveSecundaria)]
    [ON DELETE {NO ACTION | CASCADE | SET DEFAULT | SET NULL}]
    [ON UPDATE {NO ACTION | CASCADE | SET DEFAULT | SET NULL}]
*/