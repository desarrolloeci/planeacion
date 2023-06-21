<%-- 
    Document   : index
    Created on : 02/02/2017, 04:00:00 PM
    Author     : Juan Vanzina
--%>

<%@page import="BDatos.BDServicios"%>
<%@ include file="secure.jsp" %>
<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<%response.setHeader("Cache-Control", "no-cache");
        String ccemp = session.getAttribute("cod_emp").toString();
        String nomus = session.getAttribute("nom_emp").toString(); 
        String apus1 = session.getAttribute("ap1_emp").toString();
        String apus2 = session.getAttribute("ap2_emp").toString();
        String mailus = session.getAttribute("e_mail").toString();
%>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>SEGUIMIENTO A LA PLANEACI�N - ESCUELA COLOMBIANA DE INGENIER�A JULIO GARAVITO</title>
    <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="Content-Language" content="ES" />
    <meta name="language" content="spanish" />
    <meta name="author" content="Escuela Colombiana de Ingenieria Julio Garavito - Julio Garavito" />
    <meta name="copyright" content="Copyright (c) 2017" />
    <meta name="description" content="Escuela Colombiana de Ingenieria Julio Garavito - Julio Garavito" />
    <meta name="abstract" content="Escuela Colombiana de Ingenieria Julio Garavito - Julio Garavito" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge">     
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
    <link rel="shortcut icon" type="image/x-icon" href="img/favicon.ico">
    <link href="https://fonts.googleapis.com/css?family=Arsenal" rel="stylesheet">
    <link rel="stylesheet" href="css/seguimiento.css"> 

</head>
<body>

    <header>
        <div class="container-fluid">
            <div class="row">
                <div class="col-md-12">
                    <center><img src="img/img-header-2.jpg" class="img-responsive"></center>
                </div>
            </div>
            <div class="row">
                <div class="col-md-12 franjaColor">
                    <center><h4>.:: Plataforma de seguimiento a la planeaci�n ::.</h4><div align="right">
                            <form action="salir">
                        <input type="submit" class="btn-danger" value="Cerrar sesion">
                    </form>
                            
                    </center></div>
                </div>
            </div>
            </div>
            <center><img src="img/img-inicio.jpg" alt="portada" class="img-responsive"></center>
        </div>
    </header>

    <nav>
        <div class="container">
        <ul class="nav nav-pills nav-justified">
          <li role="presentation" class="active"><a href="/planeacion/home"><span class="glyphicon glyphicon-home"></span> Inicio</a></li>
          <li role="presentation"><a href="/planeacion/proyectosact"><span class="glyphicon glyphicon-duplicate"></span> Proyectos activos</a></li>
          <li role="presentation"><a href="/planeacion/seguimiento"><span class="glyphicon glyphicon-eye-open"></span> Seguimiento</a></li>
          <li role="presentation"><a href="/planeacion/historial"><span class="glyphicon glyphicon-list-alt"></span> Historial</a></li>
          <li role="presentation"><a href="/planeacion/reportes"><span class="glyphicon glyphicon-file"></span> Reportes</a></li>
        </ul>
        </div>
    </nav>

<!--CONTENIDOS-->
    <section>
        <div class="container">
            <div class="row">
                <div class="col-md-6 colIzquierda">
                    <h3>Bienvenido(a) <%=nomus%></h3>
                    <p><br><a target="_blank" href="http://tycho.escuelaing.edu.co/contenido/documentos/2016_2025_Plan_Desarrollo.pdf"> Plan de desarrollo 2016 - 2025</a></p>
                    <p align="justify">Todos los planes formulados tanto de desarrollo institucional como los planes de mejoramiento, son elaborados de manera participativa y de acuerdo con los resultados de los procesos de autoevaluaci�n con fines de registro calificado y acreditaci�n as� como de las necesidades de las unidades acad�micas y administrativas, todos alineados con los ejes de desarrollo establecidos por la instituci�n. Estos proyectos son presentados al Consejo Directivo, instancia que aprueba su realizaci�n, presupuesto y alcance.</p><br>
                    <p>
                    <img src="img/img-inicio-1.jpg" alt="" class="img-responsive"></p>
                    <br>
                    <p align="justify">Durante su desarrollo, desde la Oficina de Desarrollo Institucional se tiene establecido realizar un seguimiento de todos los planes tres veces al a�o (30 abril, 31 agosto y diciembre); proceso que permite registrar los resultados de los proyectos y acciones en curso, convirti�ndose as� en el insumo para la toma oportuna de decisiones institucionales.</p><br>
 
                    
                </div>
                <div class="col-md-6 colDerecha">

                    <p align="justify">La Escuela reconoce como �mbitos estrat�gicos para el logro de sus objetivos, la formaci�n de excelencia, el desarrollo de la investigaci�n y la innovaci�n, el fortalecimiento de la relaci�n con el entorno, el aseguramiento de la calidad, el desarrollo de la comunidad universitaria, la eficiencia y sostenibilidad institucional y la infraestructura sostenible, por medio de los cuales es posible dirigirse a la b�squeda de la excelencia que la ha caracterizado desde su creaci�n.</p>
                    <br>
                    <p><h4>Calendario Seguimiento</h4>
                    <img src="img/img-calendario.jpg" alt="espacio para calendario" class="img-responsive"></p>
                </div>
            </div>
        </div>
    </section>



<!--FOOTER-->
<footer class="footerContainer">
    <div class="container">        
        <div class="row">
            <article class="col-sm-7 col-md-5">
                <p>                    
                    <strong>ESCUELA COLOMBIANA DE INGENIER�A JULIO GARAVITO</strong><br/>
                    AK.45 No.205-59 (Autopista Norte)<br/>
                    <i>Contact center</i>: +57(1) 668 3600<br/>
                    L�nea Nacional Gratuita: 018000112668<br/>
                    Informaci�n detallada en: www.escuelaing.edu.co<br/><br/>
                    <small>Personer�a Jur�dica 086 de enero 19 de 1973. Acreditaci�n Institucional de Alta Calidad Res. 002710 del 18 de marzo de 2019. (Vigencia 6 a�os).<br>
                    Vigilada Mineducaci�n.</small><br><br>
                    Bogot�, D.C. - Colombia<br/>

                    <p class="cym">&copy; 2017 Escuela Colombiana de Ingenier&iacute;a Julio Garavito</p>
                
            </article>
            <article class="col-sm-5 col-md-7">
                <p>
                    <iframe src="https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d1987.9617427360993!2d-74.04338482936627!3d4.783148717834411!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x8e3f85e374627fe5%3A0x540783a0b074c84d!2sEscuela+Colombiana+de+Ingenier%C3%ADa!5e0!3m2!1ses!2ses!4v1424190444206" width="100%" height="280" frameborder="0" style="border:0"></iframe>
                </p>
            </article>
        </div> 
    </div>       
</footer>




    






























    <!--SCRIPT BOOTSTRAP-->
    <script src="js/jquery.js"></script>
    <script src="https://code.jquery.com/jquery-latest.jS"></script>
    <script src="js/bootstrap.min.js"></script>
</body>
</html>
