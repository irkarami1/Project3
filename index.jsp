<%-- 
    Document   : index
    Created on : 14 Δεκ 2011, 1:08:10 μμ
    Author     : irkarami
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
	<title>Project 3</title>
	</head>
	<body>

        <% String qucof="0";
        String qusug="0";
        String quwat="0";
        int flag=0;
       
        
        String prcof,prsug,prwat, totcof,totsug,totwat;;
        double qucofd,qusugd,quwatd, totcofd,totsugd,totwatd,total; 
        

        
        //quantities       

       

       
 
       
        //prices
        prcof=getServletConfig().getInitParameter("prcafe");
        prsug=getServletConfig().getInitParameter("prsugar");
        prwat=getServletConfig().getInitParameter("prwater");
        
        
        double prcofd = Double.parseDouble(prcof);
        double prsugd= Double.parseDouble(prsug);
        double prwatd = Double.parseDouble(prwat);
        
        //totcof=prcofd*qucofd;
       // if(flag==1){
            
 
        qucof=request.getParameter("cafe");
        qusug=request.getParameter("sugar");
        quwat=request.getParameter("water");
        /*
                if((quwat==null)||(qusug.equals(""))){qusug="0";}
        if((qucof.equals(""))||(quwat.equals(""))){quwat="0";}  
        */
        if((qucof==null)&&(quwat==null)&&(quwat==null)){
           Cookie[] cookies = request.getCookies(); 
               
           int i;
           if (cookies != null) {
                for (i=0; i<cookies.length; i++) {
                       if (cookies[i].getName().equals("cafeq")) {
                           qucof = cookies[i].getValue();
                           if(qucof.equals("")||qucof.equals("NULL")){
                               qucof="0";
                           }
                      }
                       if (cookies[i].getName().equals("sugarq")) {
                           qusug = cookies[i].getValue();
                           if(qusug.equals("")||qusug.equals("NULL")){
                               qusug="0";
                           }
                      }

                    
                        if (cookies[i].getName().equals("waterq")) {
                           quwat = cookies[i].getValue();
                           if(quwat.equals("")||quwat.equals("NULL")){
                               quwat="0";
                           }
                      }

             }       
        }else if(qucof.equals("")){qucof="0";           
        }else if(qusug.equals("")){qusug="0";
        }else if(quwat.equals("")){quwat="0";}
           
        } 
                       
       qucofd = Double.parseDouble(qucof);
       qusugd = Double.parseDouble(qusug);
       quwatd = Double.parseDouble(quwat);
       

        
       totcofd=prcofd*qucofd;
       totsugd=prsugd*qusugd;
       totwatd=prwatd*quwatd;
        
       total=totcofd+totsugd+totwatd;
        

        
     
       
        
       Cookie cookie1 = new Cookie ("cafeq",qucof);
       cookie1.setMaxAge(365 * 24 * 60 * 60);
       response.addCookie(cookie1);
       
       Cookie cookie2 = new Cookie ("sugarq",qusug);
       cookie2.setMaxAge(365 * 24 * 60 * 60);
       response.addCookie(cookie2);
       
       Cookie cookie3 = new Cookie ("waterq",quwat);
       cookie3.setMaxAge(365 * 24 * 60 * 60);
       response.addCookie(cookie3);



       
        
        
        
        
        
        /*
        }else{
            totcofd=0;
            totsugd=0;
            totwatd=0;
        }
        */

        
        
        
        
        
        
        
        %>
		<h1 align="center">Shopping Cart</h1>
		<br><br>
		<form name="myForm"  method="POST" action="index.jsp" >
		     <table align="center" border=1>

			<tr>
				<td><b>ITEM<b></td>
				<td><b>PRICE<b></td>
				<td><b>QUANTITY<b></td>
				<td><b>TOTAL<b></td>
			</tr>

			<tr>
				<td>Cafe</td>
				<td> <%out.print(prcof); %>  </td>
				<td><input type=text name="cafe" value= <%=qucof%>></td>
				<td><%out.print(totcofd); %></td>
			</tr>

			<tr>
				<td>Sugar</td>
				<td><%out.print(prsug); %> </td>
				<td><input type=text name="sugar" value= <%=qusug%>></td>
				<td><%out.print(totsugd); %></td>
			</tr>

			<tr>
				<td>Water</td>
				<td><%out.print(prwat); %> </td>
				<td><input type=text name="water" value= <%=quwat%>></td>
				<td><%out.print(totwatd); %></td>
			</tr>
                        
                        <tr>
				<td>Total</td>
				<td></td>
				<td></td>
				<td><%out.print(total); %></td>
			</tr>

		     </table>
		<br>
                        <center>
			<input type="submit" value="submit" />
                        </center>
		</form>
                <center>
		<br><br>

			<button type="button" title="Get info" onClick="parent.location='http://irkarami.wordpress.com/2011/12/14/3%CE%B7-%CE%B5%CF%81%CE%B3%CE%B1%CF%83%CE%AF%CE%B1/'">?</button> 
			<button type="button" title="Download the code" onClick="parent.location='https://github.com/irkarami1/Project3'"> !</button> 
		</center>
	</body>
</html>
