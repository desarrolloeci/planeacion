<%-- 
    Document   : seguimiento
    Created on : 02/02/2017, 04:00:00 PM
    Author     : Juan Vanzina
--%>
<%@page import="java.util.Vector"%>
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
        
        BDServicios bd = new BDServicios();
        
        Vector proyectos = new Vector();
        Vector proyectosinvol = new Vector();
        Vector aux = new Vector();
        
             proyectos = bd.ConsultarProyectosUsuarioEJEC(ccemp);
        proyectosinvol = bd.ConsultarProyectosUsuarioEJECINVOL(ccemp);
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
            <div class="col-md-12 franjaColor">
                    <center><h4>.:: Plataforma de seguimiento a la planeaci�n ::.</h4><div align="right">
                            <form action="salir">
                        <input type="submit" class="btn-danger" value="Cerrar sesion">
                    </form>
                            
                    </center></div>
            </div>
            <center> <img src="img/img-seguimiento.jpg" alt="portada" class="img-responsive"></center>
        </div>
    </header>

    <nav>
        <div class="container">
        <ul class="nav nav-pills nav-justified">
          <li role="presentation"><a href="/planeacion/home"><span class="glyphicon glyphicon-home"></span> Inicio</a></li>
          <li role="presentation"><a href="/planeacion/proyectosact"><span class="glyphicon glyphicon-duplicate"></span> Proyectos activos</a></li>
          <li role="presentation" class="active"><a href="/planeacion/seguimiento"><span class="glyphicon glyphicon-eye-open"></span> Seguimiento</a></li>
          <li role="presentation"><a href="/planeacion/historial"><span class="glyphicon glyphicon-list-alt"></span> Historial</a></li>
          <li role="presentation"><a href="/planeacion/reportes"><span class="glyphicon glyphicon-file"></span> Reportes</a></li>
        </ul>
        </div>
    </nav>

<!--CONTENIDOS-->
    <section>
        <div class="container">
            <div class="row">
                
                <%
                Vector ultfecha = bd.ConsultarUltFechaSeg();
                if(ultfecha.elementAt(2).toString().equals("1")){
                %>
                <%if(proyectos.size()>0){%>   
                <div class="col-md-12 filaCompleta">
                    <h3>A continuaci�n se presentan <strong>los proyectos bajo su responsabilidad con seguimiento  a la fecha:</strong></h3><br>
                    
                    <script language="javascript">
                        function doSearch() {
                            var tableReg = document.getElementById('regTable');
                            var searchText = document.getElementById('searchTerm').value.toLowerCase();
                            for (var i = 1; i < tableReg.rows.length; i++) {
                                var cellsOfRow = tableReg.rows[i].getElementsByTagName('td');
                                var found = false;
                                for (var j = 0; j < cellsOfRow.length && !found; j++) {
                                    var compareWith = cellsOfRow[j].innerHTML.toLowerCase();
                                    if (searchText.length == 0 || (compareWith.indexOf(searchText) > -1)) {
                                        found = true;
                                    }
                                }
                                if (found) {
                                    tableReg.rows[i].style.display = '';
                                } else {
                                    tableReg.rows[i].style.display = 'none';
                                }
                            }
                        }
                    </script>
                           
                    <div class="filaCompleta">Filtrar por: <input id="searchTerm" type="text" onkeyup="doSearch()" class="input-sm  text-center col-md-12"/></div>
                    <br> 
                    
                    <p>
                    Para ordenar, clic sobre el titulo de la columna. <img src="img/order.png" alt="Smiley face" height="30" width="30">.
                    <table class="table table-hover" id="regTable">
                      <thead>
                        <tr>
                          <th>Id. Proyecto</th>
                          <th>Nombre</th>
                          <th>Plan</th>
                          <th>Estado</th>
                          <th>Fecha Creaci�n</th>
                          <th>Tipo</th>
                          <th>Detalle</th>
                          <th>Seguimiento</th>
                        </tr>
                      </thead>
                      <tbody>
                      <% for ( int m = 0 ; m < proyectos.size() ; m++ ){
                        aux = (Vector)proyectos.elementAt(m);
                        
                        //borrar esto
                            int tamanio = 0;
                            tamanio = proyectos.size();
                            System.out.println(tamanio);
                        //borrar esto
                        
                        
                        String estadoseg = "";
                        String segver = "";
                                
                        //borrar esto
                            int xx = 0;
                            String zz = "";
                            zz = aux.elementAt(0).toString();
                            xx = bd.ConsultarEstadoSeg(aux.elementAt(0).toString()).size();
                        //borrar esto
                        
                        if( bd.ConsultarEstadoSeg( aux.elementAt(0).toString()).size() > 0 ) {
                            
                            Vector TMP = new Vector();
                            TMP = bd.ConsultarEstadoSeg(aux.elementAt(0).toString()); 
                            
                            estadoseg = TMP.elementAt(0).toString();
                            segver    = TMP.elementAt(1).toString();
                        }
                        
                      %>
                      <tr>
                        <td><%=aux.elementAt(0)%></td>
                        <td><u><%=aux.elementAt(1)%></u></td>
                        <td><%=aux.elementAt(2)%></td>
                        <td><font color="Blue"><strong><%=aux.elementAt(3)%></strong></font></td>
                        <td><%=aux.elementAt(4)%></td>                        
                        <td><%=aux.elementAt(5)%></td>
                        <td><a href="verproyecto?idp=<%=aux.elementAt(0)%>"><img src="img/detalle.png" width="20" height="22" border="0"></a></td>
                        <!--<td align="center"><a href="seguimientoPR?idp=<%=aux.elementAt(0)%>"><img src="img/seguim.png" width="25" height="25" border="0"></a></td>-->
                        <%if(segver.equals("1")){%>
                        <td><a href="seguimientoPR?idp=<%=aux.elementAt(0)%>&seg=<%=estadoseg%>"><b><font color="Orange">Continuar Seguimiento</font></b></a></td>
                        <%}else if(segver.equals("")){%>
                        <td><a href="InicarSeguimiento?idp=<%=aux.elementAt(0)%>"><b><font color="Red">Iniciar Seguimiento</font></b></a></td>
                        <%}else{%>
                        <td><b><a href="seguimientoPR?idp=<%=aux.elementAt(0)%>&seg=<%=estadoseg%>"><font color="Green">Seguimiento Realizado</font></a></b></td>
                        <%}%>
                      </tr>
                      <%}%>
                      </tbody>
                    </table>
                    </p>
                </div>
                <!-- --------------------------------------------------------------------------------------------------------------------------------------------------- -->      
                <%}   if(proyectosinvol.size()>0){%>    
                <div class="col-md-12 filaCompleta">
                    <h3>Proyectos en ejecuci�n y en los que usted es <strong>responsable de alguna actividad y requiere seguimiento a la fecha:</strong></h3><br>
                    <p>
                    Para ordenar, clic sobre el titulo de la columna. <img src="img/order.png" alt="Smiley face" height="30" width="30">.
                    <table class="table table-hover">
                      <thead>
                      <tr>
                        <th>Id. Proyecto</th>
                        <th>Nombre</th>
                        <th>Plan</th>
                        <th>Estado</th>
                        <th>Fecha Creaci�n</th>
                      
                        <th>Seguimiento</th>
                      </tr>
                      </thead>
                      <tbody>
                      <% for ( int m = 0 ; m < proyectosinvol.size() ; m++ ){
                        aux = (Vector)proyectosinvol.elementAt(m);
                        
                        String estadoseg = "";
                        String segver = "";
                                
                        if(bd.ConsultarEstadoSeg(aux.elementAt(0).toString()).size() > 0){
                            
                            Vector TMP = new Vector();
                            TMP = bd.ConsultarEstadoSeg(aux.elementAt(0).toString()); 
                            
                            estadoseg = TMP.elementAt(0).toString();
                            segver    = TMP.elementAt(1).toString();
                        }
                        
                      %>
                      <tr>
                        <td><%=aux.elementAt(0)%></td>
                        <td><u><%=aux.elementAt(1)%></u></td>
                        <td><%=aux.elementAt(2)%></td>
                        <td><font color="Blue"><strong><%=aux.elementAt(3)%></strong></font></td>
                        <td><%=aux.elementAt(4)%></td>                        
                        
                        <!--<td align="center"><a href="seguimientoAC?idp=<%=aux.elementAt(0)%>"><img src="img/seguim.png" width="25" height="25" border="0"></a></td>-->
                        <%if(segver.equals("1")){%>
                        <td><a href="seguimientoAC?idp=<%=aux.elementAt(0)%>&seg=<%=estadoseg%>"><b><font color="Orange">Continuar Seguimiento</font></b></a></td>
                        <%}else if(segver.equals("")){%>
                        <td><a ><b><font color="Red">Sin Iniciar Seguimiento</font></b></a></td>
                        <%}else{%>
                        <td><b><a href="seguimientoAC?idp=<%=aux.elementAt(0)%>&seg=<%=estadoseg%>"><font color="Green">Seguimiento Realizado</font></a></b></td>
                        <%}%>
                      </tr>
                      <%}%>
                      </tbody>
                    </table>
                    </p>
                </div>
                    <!-- ---------------------------------------------------------------------------------------------------------------------------------------------------- -->
                    <%}}  else{%>
                    
                    <br>
                    <center>
                    <h3>Seguimiento no se encuentra habilitado a la fecha</h3>
                    <br>
                    </center>
                    <%}%>
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
    <script language="javascript" type="text/javascript" src="js/sorter/jquery-latest.js"></script>
    <script language="javascript" type="text/javascript" src="js/sorter/jquery.tablesorter.js" ></script>

	
	<script type="text/javascript">
	$(function() {
		$("table")
			.tablesorter({debug: true})
			//.tablesorterPager({container: $("#pager")});
	});
	</script>
</body>
</html>
