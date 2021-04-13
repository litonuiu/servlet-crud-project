<%-- 
    Document   : AllPost
    Created on : Jul 16, 2016, 12:01:51 AM
    Author     : Liton Miah
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>All Post</title>
        <style>
            body{font-family: Arial;}
            table{border-collapse: collapse; width: 100%;}
            table, th, td{border: 1px #666666 solid; padding: 5px 7px; font-size: 13px;}
            table th{padding: 6px 8px; background: #cccccc;}
            /*table tr td {font-size: 12px;}*/
            table a{text-decoration: none;}
        </style>
        <script src="assets/jquery.min.js"></script>
        <script>              
            function checkEdit(){
                if(confirm("Are you sure to edit?")){
                    return true;
                }else{
                    return false;
                }
            }
            function checkDelete(){
                if(confirm("Are you sure to delete?")){
                    return true;
                }else{
                    return false;
                }
            }
        </script>
    </head>
    <body>
        <div style="width: 1200px; margin-left: auto; margin-right: auto;">
            <div style="border: 1px #999999 solid; padding: 10px; margin-bottom: 5px; padding-bottom: 0px;">
                <h2 align="center" style="margin-bottom: 5px;">News Flash Online</h2>
                <h4 align="left" style="border-bottom: 1px #666666 dotted; margin-top: 5px; margin-bottom: 2px;">All News</h4>
                <div style="float: right; text-align: right; padding: 0 0 5px 5px; display: inline-block; font-family: Arial; font-size: 12px;">
                    <a style="text-decoration: none;" href="AddNew.jsp"><button style="cursor: pointer;"> + Add News </button></a>
                </div>
                <div style="clear: both;"></div>
            </div>
            <table border="0">
                <tr>
                    <th>Id</th>
                    <th>Title</th>
                    <th>Description</th>
                    <th>Detail</th>
                    <th>Category</th>
                    <th>Date</th>
                    <th>Image</th>
                    <th></th>
                </tr>
                <c:forEach items="${AllPost}" var="p">                   
                    <tr>
                        <td>${p.id}</td>
                        <td>${fn:substring(p.title, 0, 20)}...</td>
                        <td>${fn:substring(p.description,0,20)}...</td>
                        <td>${fn:substring(p.detail,0,30)}..</td>
                        <td>${p.category}</td>
                        <td>${p.date}</td>
                        <td>${fn:substring(p.image,0,20)}...</td>
                        <td width="100">
                            <a href="edit?id=${p.id}" onclick="return checkEdit();">Edit</a> |
                            <a href="delete?id=${p.id}" onclick="return checkDelete();">Delete</a>
                        </td>
                    </tr>
                </c:forEach>
            </table>
            <div id="confirmDelete" title="Delete News?"></div> 
        </div>
    </body>
</html>
