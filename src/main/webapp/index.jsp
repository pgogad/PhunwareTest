<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*, java.io.*" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Weather API example</title>

<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap.min.css">

<!-- Optional theme -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap-theme.min.css">
<style>
.label{
color:#000;float:left;font-size:100%;	
	}
	.left{float:left;}
#weather{
background:#CCC;
border:1px solid #999;
width:350px;
border-radius:2px;
margin-top:50px;
padding:10px;	
}
.row{height:30px;,margin:0;margin-left:20px;}	
.icon{height:50px;padding:10px;}
</style>
<!-- include Google hosted jQuery Library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>

<!-- Latest compiled and minified JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/js/bootstrap.min.js"></script>
<!-- Start jQuery code -->
<script type="text/javascript">
$(document).ready(function() {
	$('#city').on('change', function() {
 	 var city = this.value;
	 $.ajax({
            type: 'POST',
            url: '/weather?city='+city,
            dataType: "json",
            crossDomain: true,
            success: function (data) {
               
				$("#city_name").text(data.name);
				$("#lati").text(data.coord.lat);
				$("#longi").text(data.coord.lon);
				$("#temp").text(data.main.temp);
				$("#wind").text(data.wind.speed);
				$("#country").text(data.sys.country);
				
				var icon_src = "http://openweathermap.org/img/w/"+data.weather[0].icon+".png";
				$("#icon").attr("src",icon_src);
            },
            error: function (request, status, error) {

                alert(error);
            }
        });
	 
	});
});
</script>
</head>
<body>
<div id="wrapper">
	<div class="container">
    	<div class="col-lg-1">
        	<select id="city" class="dropdown">
            <option>Select City</option>
            <option value="Dallas,tx">Dallax,TX</option>
            <option value="London,uk">London,Uk</option>
            </select>
        </div>
    </div>
    <div class="container">
    	<h1>Weather Information</h1>
    	<div id="weather">
        	<div class="row icon"><img src="" id="icon"/></div>
            <div class="row"><div class="label">City</div><div class="left" id="city_name"></div></div>
            <div class="row"><div class="label">Latitude</div><div class="left" id="lati"></div></div>
            <div class="row"><div class="label">Longitude</div><div class="left" id="longi"></div></div>
            <div class="row"><div class="label">Temperature</div><div class="left" id="temp"></div></div>
            <div class="row"><div class="label">Wind</div><div class="left" id="wind"></div></div>
            <div class="row"><div class="label">Country</div><div class="left" id="country"></div></div>
    	</div>
        
</div>
</body>
 </html>