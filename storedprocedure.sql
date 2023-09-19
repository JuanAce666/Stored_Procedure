create database storedprocedure;
use storedprocedure;

CREATE TABLE profesor (
    id_prof INT AUTO_INCREMENT,
    nombre_prof VARCHAR(55) NOT NULL,
    apellido_prof VARCHAR(55) NOT NULL,
    especialidad VARCHAR(55) NOT NULL,
    CONSTRAINT pk_profesor PRIMARY KEY (id_prof)
);

CREATE TABLE curso (
    id_curso INT AUTO_INCREMENT,
    nombre_curso VARCHAR(55) NOT NULL,
    aula VARCHAR(55) NOT NULL,
	id_profesor INT,
    CONSTRAINT pk_curso PRIMARY KEY (id_curso),
    FOREIGN KEY (id_profesor) REFERENCES profesor(id_prof)
);

drop table curso;
select * from curso;
select * from profesor;

/*crear un stored procedure que haga un select en una tabla*/
DELIMITER //
CREATE PROCEDURE seleccionarProfesor()
BEGIN
	SELECT id_prof, nombre_prof, apellido_prof, especialidad FROM profesor;
END; //   
DELIMITER ; 
CALL seleccionarProfesor();


/*crear un stored procedure que genere un join entre tablas*/
DELIMITER //
CREATE PROCEDURE ObtenerCursosYProfesores()
BEGIN
    SELECT c.nombre_curso, p.nombre_prof, p.apellido_prof
    FROM curso c
    INNER JOIN profesor p ON c.id_profesor = p.id_prof;
END //
DELIMITER ;
CALL ObtenerCursosYProfesores();
DROP PROCEDURE IF EXISTS ObtenerCursosYProfesores;

/*crear un stored procedure donde se consulte usando la condicion where*/
DELIMITER //
CREATE PROCEDURE SeleccionarProfesores(IN especialidad VARCHAR(55))
BEGIN
    SELECT nombre_prof, apellido_prof
    FROM profesor
    WHERE especialidad = especialidad;
END //
DELIMITER ;
CALL SeleccionarProfesores('JAVA');
DROP PROCEDURE IF EXISTS  SeleccionarProfesoresPorEspecialidad;

/*consultar un procedimiento que ordene los datos consultados*/
DELIMITER //
CREATE PROCEDURE ConsultarProfesoresOrdenadosPorNombre()
BEGIN
    SELECT nombre_prof, apellido_prof, especialidad
    FROM profesor
    ORDER BY nombre_prof;
END //
DELIMITER ;
CALL ConsultarProfesoresOrdenadosPorNombre();

DELIMITER //
CREATE PROCEDURE ConsultarProfesoresOrdenadosPorEspecialidad()
BEGIN
    SELECT nombre_prof, apellido_prof, especialidad
    FROM profesor
    ORDER BY especialidad;
END //
DELIMITER ;
CALL ConsultarProfesoresOrdenadosPorEspecialidad();

