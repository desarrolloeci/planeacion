/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package www;

import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.mail.*;
import javax.mail.internet.*;
import java.util.*;
import java.util.logging.Level;
import java.util.logging.Logger;
import org.json.JSONObject;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;

/**
 *
 * @author Paulina Alvarado
 */
public class correo extends HttpServlet {

    private static final String AUTHORITY = "https://login.microsoftonline.com/";
    private static final String CLIENT_ID = "1a3e1a8a-fef6-4b0b-8221-3e91da84a0fc";
    private static final String CLIENT_SECRET = "K3X8Q~-1Hz4zu8BxrHqQ9eRnqQVFcv4hhagJkcNc";
    private static final String SCOPE = "https://outlook.office365.com/.default";
    private static final String GRANT_TYPE = "password";

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=iso-8859-1");
        // response.setContentType("text/html;charset=iso-8859-1");

        PrintWriter out = response.getWriter();
        try {
            /* TODO output your page here
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet correo</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet correo at " + request.getContextPath () + "</h1>");
            out.println("</body>");
            out.println("</html>");
             */
        } finally {
            out.close();
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        processRequest(request, response);

    }

    

    public String ecorreo(Vector sol, String idev, final String usr, final String pas, String dest, String depend, String ind, HttpServletResponse response) {
        response.setContentType("text/html;charset=UTF-8");
        String usu = (String) sol.elementAt(5);
        String bloque = (String) sol.elementAt(3);
        String ext = (String) sol.elementAt(4);
        String asunto = (String) sol.elementAt(1);
        String solu = (String) sol.elementAt(7);
        String fsol = (String) sol.elementAt(8);
        String resp = (String) sol.elementAt(9);
        String obs = (String) sol.elementAt(10);
        String as = "", texto = "";
        //String destino =  "paulina.alvarado@escuelaing.edu.co"; //dest+"@escuelaing.edu.co"
        String destino = dest; //+"@escuelaing.edu.co"; //dest+"@escuelaing.edu.co"
        String blext = "Bloque: " + bloque + " - Extensión: " + ext;

        String smtp, mensaje = "";
        try {
            smtp = "smtp.office365.com";
            // MimeMultipart multipart = new MimeMultipart();
            Properties properties = new Properties();
            properties.put("mail.smtp.auth", "true");
            properties.put("mail.smtp.starttls.enable", "true");
            properties.put("mail.smtp.host", smtp);
            properties.put("mail.smtp.port", "587");
            Session session = Session.getInstance(properties, new javax.mail.Authenticator() {

                protected PasswordAuthentication getPasswordAuthentication() {
                    return new PasswordAuthentication(usr, pas);
                }
            });
            session.setDebug(true);
            MimeMessage msg = new MimeMessage(session);
            msg.setFrom(new InternetAddress(usr));
            msg.setRecipients(Message.RecipientType.BCC, usr);

            msg.setRecipients(Message.RecipientType.BCC, destino);
            if (ind.equals("0")) {
                as = "Creación de Servicio OSIRIS";
                texto = "Le fue Asignada la solicitud No. " + idev + " \n \n Nombre del Solicitante: " + usu + " \n \n Dependencia: " + depend + " \n \n Descripción de la solicitud: " + asunto + " \n \n " + blext + "";
            } else if (ind.equals("1")) {
                as = "Asignación de Solicitud";
                texto = "Se le ha asignado el registro No. " + idev + " \n \n Nombre del Usuario: " + usu + " \n \n Dependencia: " + depend + " \n \n Descripci�n de la solicitud: " + asunto + "\n \n " + blext + "";
            } else if (ind.equals("2")) {
                as = "Cierre de Solicitud";
                texto = "Se ha tramitado la solicitud No. " + idev + " \n \n Nombre del Usuario: " + usu + " \n \n  Descripción de la solicitud: " + asunto + "\n \n " + blext + ""
                        + " \n \n Responsable: " + dest + ""
                        + " \n \n Nota** Favor validar solución y finalizar o reasignar Solicitud";
            } else if (ind.equals("3")) {
                as = "Solicitud para Reasignar";
                texto = "Se solicita reasignar la solicitud No. " + idev + " \n \n Nombre del Usuario: " + usu + " \n \n  Descripción de la solicitud: " + asunto + "\n \n " + blext + ""
                        + " \n \n Responsable: " + dest + ""
                        + " \n \n Nota**  Favor validar y reasignar Solicitud";
            } else if (ind.equals("5")) {
                as = "Reasignación de Servicio OSIRIS";
                texto = "Se le ha reasignado la Solicitud No. " + idev + " \n \n Nombre del Usuario que solicita: " + usu + " \n \n Descripción de la solicitud: " + asunto + "\n \n " + blext + "";
            } else if (ind.equals("6")) {
                as = "Finalización Solicitud";
                texto = "Se le informa el Cierre de la Solicitud No. " + idev + " \n \n Nombre del Usuario que solicita: " + usu + " \n \n Descripción de la solicitud: " + asunto + "\n \n " + blext + "";
            }
            msg.setSubject(as);
            //msg.setSubject(as, "UTF-8"); //Nuevo tycho
            msg.setSentDate(new Date());
            BodyPart msgBP = new MimeBodyPart();
            msgBP.setText(texto);
            Multipart mpart = new MimeMultipart();
            mpart.addBodyPart(msgBP);
            msg.setText(texto);
            //msg.setText(texto, "UTF-8"); //Nuevo tycho
            Transport.send(msg);
            mensaje = "ok";
        } catch (Exception e) {
            mensaje = "error:" + usr + "/" + " ---- " + e.getMessage();
        }
        return mensaje;
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
