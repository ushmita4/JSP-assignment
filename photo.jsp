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
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>JSP Page</title>
  </head>
<%!
	String file_name = null;
    String file_name2="";
%>
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
            if (!it.hasNext()) {
                return;
            }
            
            while (it.hasNext()) {
                FileItem fileItem = it.next();
                boolean isFormField = fileItem.isFormField();
                if (isFormField) {
                    if (file_name == null) {
                        if (fileItem.getFieldName().equals("ImgFile")) {
                        	file_name = fileItem.getString();
							out.print(file_name);
                        }
                    }
                } else {
                    if (fileItem.getSize() > 0) {
						file_name2=fileItem.getName();
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
