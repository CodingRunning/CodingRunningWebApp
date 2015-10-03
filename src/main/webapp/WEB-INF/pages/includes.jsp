<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<link href="<c:url value="/resources/css/jquery-ui.min.css" />" rel="stylesheet">
<link href="<c:url value="/resources/css/jquery-ui.structure.min.css" />" rel="stylesheet">
<link href="<c:url value="/resources/css/jquery-ui.theme.min.css" />" rel="stylesheet">
<link href="<c:url value="/resources/css/bootstrap.min.css" />" rel="stylesheet">
<link href="<c:url value="/resources/css/bootstrap-theme.min.css" />" rel="stylesheet">
<script src="<c:url value="/resources/js/jquery-1.11.3.min.js" />"></script>
<script src="<c:url value="/resources/js/jquery-ui.min.js" />"></script>
<script src="<c:url value="/resources/js/bootstrap.min.js" />"></script>


<!-- This contains the most used tag libraries -->

<script type="text/javascript">
$( document ).ready(function() {
	jQuery('#langEn').click(function(){
		$.ajax ({ 
			type: "POST",
			url: "ajax/changelanguage.do", 
			data: { new_lang: "en"},
			async: false, 
			traditional : true,
			error: function (data, error) {alert ("change language error!");}, 
			success: function (data) 
			{ 
			window.location.reload (); 
			} 
	});
	});
	
	jQuery('#langTh').click(function(){
		$.ajax ({
			type: "POST",
			headers : {
				Accept : "application/json; charset=utf-8",
				"Content-Type" : "application/json; charset=utf-8"
			},
			url: "ajax/test", 
		    success: function(data) { 
		        alert(data.firstName +" " + data.lastName);
		    },
		    error:function(data,status,er) { 
		        alert("Error.");
		    }
	});
	});
});
	


</script>

<span style="float: right;">  
    <a href="#" id="langEn">en</a>  
    |  
    <a href="#" id="langTh">th</a>  
</span>  
