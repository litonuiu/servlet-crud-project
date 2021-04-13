<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
<html>
    <head>
        <title>
            <c:choose>
                <c:when test="${getNewsById.size()>0}">Edit</c:when> 
                <c:otherwise>Add</c:otherwise>
            </c:choose>
            News
        </title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <style>
            body{font-family: Arial;}
        </style>
        <script src="assets/jquery.min.js"></script>
    </head>
    <body>
        <div style="width: 900px; margin-left: auto; margin-right: auto; border: 1px #999999 solid; padding: 10px;">
            <h2 align="center" style="margin-bottom: 5px;">News Flash Online</h2>
            <h4 align="left" style="border-bottom: 1px #666666 dotted; margin-top: 5px; margin-bottom: 2px;">
                <c:choose>
                    <c:when test="${getNewsById.size()>0}"><span>Edit</span></c:when> 
                <c:otherwise><span>Add</span></c:otherwise>
                </c:choose>                
                <span>News</span>
            </h4>
            <div style="float: right; text-align: right; padding: 0px; display: inline-block; font-family: Arial; font-size: 12px;">
                <a style="text-decoration: none;" href="AllPost"><button style="cursor: pointer;"> = All News </button></a>
            </div>
            <c:choose>
                <c:when test="${getNewsById.size()>0}">
                    <c:forEach items="${getNewsById}" var="p">
                        <form action="JSP/ManagerAddNew.jsp" method="post">
                            <input type="hidden" name="id" value="${p.id}">
                            <table cellspacing="10" border="0">
                                <tr>
                                    <td>Title:</td>
                                    <td><input type="text" name="title" value="${p.title}" style="width: 200px;"></td>
                                </tr>
                                <tr>
                                    <td>Description:</td>
                                    <td><input type="text" name="description" value="${p.description}" style="width: 200px;"></td>
                                </tr>
                                <tr>
                                    <td>Detail:</td>
                                    <td><textarea name="detail" style="width: 400px; height: 200px;">${p.detail}</textarea></td>
                                </tr>
                                <tr>
                                    <td>Category:</td>
                                    <td>
                                        <select name="category" style="width: 200px;">
                                            <option value="${p.category}">${p.category}</option>
                                            <option value="World">World</option>
                                            <option value="Tech">Tech</option>
                                            <option value="Support">Support</option>
                                        </select>
                                    </td>
                                </tr>
                                <tr>
                                    <td>Image:</td>
                                    <td><input type="text" name="image" value="${p.image}" style="width: 200px;"></td>
                                </tr>
                                <tr>
                                    <td>&nbsp;</td>
                                    <td>
                                        <input type="submit" value="Save">&nbsp;&nbsp;&nbsp;
                                        <a href="AddNew.jsp"><input type="button" value="Cancle"></a>
                                    </td>
                                </tr>
                            </table>
                        </form>                        
                    </c:forEach>
                </c:when>
                <c:otherwise>
                    <form action="JSP/ManagerAddNew.jsp" method="post" enctype="multipart/form-data">
                        <input type="hidden" name="id" value="">
                        <table cellspacing="10" border="0">
                            <tr>
                                <td>Title:</td>
                                <td><input type="text" name="title" style="width: 200px;"></td>
                            </tr>
                            <tr>
                                <td>Description:</td>
                                <td><input type="text" name="description" style="width: 200px;"></td>
                            </tr>
                            <tr>
                                <td>Detail:</td>
                                <td><textarea name="detail" style="width: 400px; height: 200px;"></textarea></td>
                            </tr>
                            <tr>
                                <td>Category:</td>
                                <td>
                                    <select name="category" style="width: 200px;">
                                        <option value="World">World</option>
                                        <option value="Tech">Tech</option>
                                        <option value="Support">Support</option>
                                    </select>
                                </td>
                            </tr>
                            <tr>
                                <td>Image:</td>
                                <td><input type="file" name="image" style="width: 200px;"></td>
                            </tr>
                            <tr>
                                <td>&nbsp;</td>
                                <td><input type="submit" value="Save"></td>
                            </tr>
                        </table>
                    </form>
                </c:otherwise>
            </c:choose>                    
        </div>
    </body>
</html>
