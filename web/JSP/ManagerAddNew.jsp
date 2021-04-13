<%-- 
    Document   : ManagerAddNew
    Created on : Jul 15, 2016, 11:41:09 PM
    Author     : Liton Miah
--%>

<%@page import="dao.DataAccess"%>
<%@page import="model.News"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.awt.image.SampleModel"%>
<%@page import="java.sql.Date"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            String idTemp = "";
            idTemp = request.getParameter("id");
            String title = request.getParameter("title");
            
            Date dateTemp = new Date(System.currentTimeMillis());
            SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd");
            String date = dateFormat.format(dateTemp.getTime());
            
            String description = request.getParameter("description");
            String detail = request.getParameter("detail");
            String category = request.getParameter("category");
            String image = request.getParameter("image");
            
            if(idTemp == ""){
                News n = new News(0, title, date, description, detail, category, image);
                DataAccess da = new DataAccess();
                da.addNew(n);
            }else{
                int id = Integer.parseInt(idTemp);
                DataAccess da = new DataAccess();
                da.edit(id, title, description, detail, category, image);
            }
            
            response.sendRedirect("/CRUD_News/AllPost");
        %>
    </body>
</html>
