<%@page import=" java.io.File"%>
<%@page import=" java.io.IOException"%>
<%@page import=" java.io.PrintWriter"%>
<%@page import=" java.util.Iterator"%>
<%@page import=" java.util.List"%>
<%@page import=" org.apache.commons.fileupload.FileItem"%>
<%@page import=" org.apache.commons.fileupload.FileItemFactory"%>
<%@page import=" org.apache.commons.fileupload.disk.DiskFileItemFactory"%>
<%@page import=" org.apache.commons.fileupload.servlet.ServletFileUpload"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="javax.servlet.annotation.MultipartConfig"%>
<%@page isELIgnored="false" %>
<%@page import="javax.xml.bind.DatatypeConverter"%>

<html>
<head>
</head>

<body>
<%String sub[]=request.getParameterValues("data");%>
<h2><u>Your Response</h2></u>
        <form name="regd" action="./b.jsp">
            <div class="box">
            <div class="container">
            <hr>
            <h2><u>User Details</u></h2>
            <b><label>Name: </label></b>
            <input type="text" name="data" value= "<%out.println(sub[0]);%>" >
            <br>
            <b><label>Contact Number :</label></b>
            <input type="text" name="data" value= "<%out.println(sub[1]);%>" >
            <br>
            <b><label for="email">Email :</label></b>
            <input type="text" name="data" value= "<%out.println(sub[2]);%>" >
            <br>
            <b><label for="dob">Date of Birth :</label></b>&nbsp;&nbsp;
            <input type="text" name="data" value= "<%out.println(sub[3]);%>" >
            <br>
            <div>
            <b><label>Gender :</label></b>
            <input type="text" name="data" value= "<%out.println(sub[4]);%>" >
            </div>
            <br>
            <h2><u>Address Details</u></h2>
            <b><label for="paddress">Present Address :</label></b>
            <table class="addr">
            <tr>
            <td>
            <input id="at" type="text" name="data" value= "<%out.println(sub[5]);%>">
            </td>
            <td>
            <input id="post" type="text" name="data" value= "<%out.println(sub[6]);%>">
            </td>
            <td>
            <input id="dist" type="text" name="data" value= "<%out.println(sub[7]);%>">
            </td>
            </tr>
            <tr>
            <td>
            <input id="st" type="text" name="data" value= "<%out.println(sub[8]);%>">
            </td>
            <td>
            <input id="pin" type="text" name="data" value= "<%out.println(sub[9]);%>">
            </td>
            <td>
            <input id="ph" type="text" name="data" value= "<%out.println(sub[10]);%>">
            </td>
            </tr>
            </table>
            <b><label for="caddress">Communication Address :</label></b>
            <table class="addr">
            <tr>
            <td>
            <input id="cat" type="text" name="data" value= "<%out.println(sub[11]);%>">
            </td>
            <td>
            <input id="cpost" type="text" name="data" value= "<%out.println(sub[12]);%>">
            </td>
            <td>
            <input id="cdist" type="text" name="data" value= "<%out.println(sub[13]);%>">
            </td>
            </tr>
            <tr>
            <td>
            <input id="cst" type="text" name="data" value= "<%out.println(sub[14]);%>">
            </td>
            <td>
            <input id="cpin" type="text"name="data" value= "<%out.println(sub[15]);%>">
            </td>
            <td>
            <input id="cph" type="text" name="data" value= "<%out.println(sub[16]);%>">
            </td>
            </tr>
            </table>
            <h2><u>Educational Details</u></h2>

            <table>
            <tr>
            <td>
            <b><label for="exam">Exam</label></b>
            </td>
            <td>
            <b><center><label for="board">Board/University</label></center></b>
            </td>
            <td>
            <b><center><label for="per">Percentage/CGPA</label></center></b>
            </td>
            <td>
            <b><center><label for="divs">Division</label></center></b>
            </td>
            </tr>
            <tr>
            <td>
            <b><label for="exam1">Matriculation(10th)</label></b>
            </td>
            <td>
            <input id="board1" type="text" name="data" value= "<%out.println(sub[17]);%>">
            </td>
            <td>
            <input id="per1" type="text" name="data" value= "<%out.println(sub[18]);%>">
            </td>
            <td>
            <input id="divs1" type="text" name="data" value= "<%out.println(sub[19]);%>">
            </td>
            </tr>
            <tr>
            <td>
            <b><label for="exam2">Intermediate(12th)</label></b>
            </td>
            <td>
            <input id="board2" type="text" name="data" value= "<%out.println(sub[20]);%>">
            </td>
            <td>
            <input id="per2" type="text" name="data" value= "<%out.println(sub[21]);%>">
            </td>
            <td>
            <input id="divs2" type="text" name="data" value= "<%out.println(sub[22]);%>">
            </td>
            </tr>
            <tr>
            <td>
            <b><label for="exam3">BTech</label></b>
            </td>
            <td>
            <input id="board3" type="text" name="data" value= "<%out.println(sub[23]);%>">
            </td>
            <td>
            <input id="per3" type="text" name="data" value= "<%out.println(sub[24]);%>">
            </td>
            <td>
            <input id="divs3" type="text" name="data" value= "<%out.println(sub[25]);%>">
            </td>
            </tr>
            </table>
            <br>
            <div>
            <label for="dec">I hereby declare that the above particulars of facts and information stated are correct to the best of my belief and knowledge. All the facts in this resume are correct and truthful. I hereby declare that all the facts mentioned above are accurate, and I take full responsibility for their accuracy.</label>
            </div>
            <button onclick="window.print()">Print</button>
            </div>
            </div>
        </form>
<%
	boolean isMultipartContent = ServletFileUpload.isMultipartContent(request);
        if (!isMultipartContent) {
            return;
        }
	FileItemFactory factory = new DiskFileItemFactory();
    ServletFileUpload upload = new ServletFileUpload(factory);
	try {
            List < FileItem > fields = upload.parseRequest(request);
            Iterator < FileItem > it = fields.iterator();
                  
            while (it.hasNext()) {
                FileItem fileItem = it.next();
               out.println(fileItem.getName());
						byte[] imageInByteArray = fileItem.get();
						String b64 = DatatypeConverter.printBase64Binary(imageInByteArray);
						%>
						<img  class="img-responsive" src="data:image/jpg;base64, <%=b64%>"/>                            
						<% 
                     }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
	out.print("File Uploaded Successfully");	
%>
</body>
</html>