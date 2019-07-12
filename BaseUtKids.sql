CREATE DATABASE ut_kids;
USE ut_kids;
drop database ut_kids;

create table TblUser(
id int not null identity(1,1),
strusuario varchar(200),
strpass varchar(200),
strtipoUsuario varchar(150)
constraint pk_UserLoggin
primary key(id)
);

create table TblTelefono(
id int not null identity(1,1),
strcelular varchar(50),
strtelCasa varchar(50),
strotro varchar(50)
constraint pk_Telefono
primary key (id)
);

create table TblDireccion(
id int not null identity(1,1),
strestado varchar(150),
strmunicipio varchar(150),
strcolonia varchar(150),
strcalle varchar(150),
intcodpost int,
strnumInt varchar(50),
strnumExt varchar(50),
strreferencias varchar(400),
constraint pk_Direccion
primary key (id)
);

create table TblTaller(
id int not null identity(1,1),
strNombre varchar(250),
strDescripcion varchar(500),
strStatus varchar(50),
constraint pk_Taller
primary key (id)
);

create table TblPadre(
id int not null identity(1,1),
strNombre varchar(200),
strApellidoP varchar(200),
strApellidoM varchar(200),
intEdad int,
strSexo varchar(100),
strCorreo varchar(200),
bitFoto varchar(max),
idDireccion int,
idTelefono int,
idUser int,
constraint pk_Padre primary key (Id),
constraint fkIdDireccion_Padre foreign key(idDireccion) references TblDireccion(id),
constraint fkIdTelefono_Padre foreign key(idTelefono) references TblTelefono(id),
constraint fkIdUser_Padre foreign key(idUser) references TblUser(id)
);

create table TblNino(
id int not null identity(1,1),
strNombre varchar(200),
strApellidoP varchar(200),
strApellidoM varchar(200),
intEdad	int,
strSexo	varchar(200),
strAlergia	varchar(500),
idPadre	int,
idUser	int,
idTaller int,
constraint pk_Nino primary key (Id),
constraint fkIdPadre_Nino foreign key(idPadre) references TblPadre(id),
constraint fkIdUser_Nino foreign key(idUser) references TblUser(id)
);

create table TblProfesor(
id int not null identity(1,1),
strNombre varchar(200),
strApellidoP varchar(200),
strApellidoM varchar(200),
intEdad int,
strSexo varchar(100),
strCorreo varchar(200),
bitFoto varchar(max),
strCedula varchar(200),
idDireccion int,
idTelefono int,
idUser int,
idTaller int,
constraint pk_Profesor primary key (Id),
constraint fkIdDireccion_Profesor foreign key(idDireccion) references TblDireccion(id),
constraint fkIdTelefono_Profesor foreign key(idTelefono) references TblTelefono(id),
constraint fkIdUser_Profesor foreign key(idUser) references TblUser(id),
constraint fkIdTaller_Profesor foreign key(idTaller) references TblTaller(id)
);

create table TblAsignacionProfesor(
id int not null identity(1,1),
idProfesor int,
idTaller int,
constraint pk_Asignacion primary key (Id),
constraint fkIdProfesor_Asignacion foreign key(idProfesor) references TblProfesor(id),
constraint fkIdTaller_Asignacion foreign key(idTaller) references TblTaller(id)
);

create table TblAsignacionNino(
id int not null identity(1,1),
idNino int,
idAsignacionProfesor int,
constraint pk_AsignacionNino primary key (Id),
constraint fkIdNino_AsigNino foreign key(idNino) references TblNino(id),
constraint fkIdAsignacionProfesor_AsigNino foreign key(idAsignacionProfesor) references TblAsignacionProfesor(id)
);


use ut_kids;
select * from TblPadre;
select * from TblDireccion;
select * from TblTelefono;
select * from TblProfesor;
select * from TblUser;
select * from TblTaller;
select * from TblAsignacionNino;
select * from TblNino;


/*Consulta para mostrar la asignacion de profesores*/
  select  
  AP.id,
  P.strNombre as 'Nombre Profe',
  T.strNombre as 'Nombre Taller'
  from 
  TblAsignacionProfesor as AP left join TblProfesor as P
  ON AP.idProfesor = P.id
  left join TblTaller as T
  ON AP.idTaller = T.id 
  group by P.strNombre, T.strNombre, AP.id;

  /*Consulta para mostrar los hijos asignados de cada papá*/
  select  
  N.strNombre as 'Nombre Niño',
  P.strNombre as 'Nombre Padre'
  from 
  TblNino as N left join TblPadre as P 
  ON N.idPadre = P.id 
  where  P.id = 1 
  group by N.strNombre, P.strNombre;