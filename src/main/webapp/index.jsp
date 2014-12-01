<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*, java.io.*" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Phunware Test</title>

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

.weather{background:#CCC;border:1px solid #999;width:250px;border-radius:2px;margin-top:50px;padding:10px;float:left; margin-right: 10px}
.row{height:30px;,margin:0;margin-left:20px;}	
.icon{height:75px;padding:10px;}
</style>
<!-- include Google hosted jQuery Library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>

<!-- Latest compiled and minified JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/js/bootstrap.min.js"></script>
<!-- Start jQuery code -->
<script type="text/javascript">

$(document).ready(function(){
	$('#forecast').on('click',function(){
		var city = $('#city').val();
		$.ajax({
			type: 'POST',
			url: '/forecast?city='+city,
			dataType: "json",
			crossDomain: true,
			success: function (data){
				
				var parent = document.getElementById('weatherforecast');
				while(parent.firstChild)
				{
					parent.removeChild(parent.firstChild);
				}
				
				var container = document.createElement('div');
				container.className = 'container';
				
				for(var i = 0; i < data.cnt; i++)
					{
					 	var div = document.createElement('div');
					 	div.className = 'weather';
					 	var divId = 'f'+i;
					 	div.setAttribute("id",divId);
					 	

					 	
					 	var icon_src = 'http://openweathermap.org/img/w/'+data.list[i].weather[0].icon+'.png';
					 	var img = document.createElement("IMG");
					 	img.setAttribute('src',icon_src);
					 	img.id = 'i'+i;
					 	img.className = 'row icon';
					 	div.appendChild(img);
					 	
					 	
					 	var innerDiv = document.createElement('div');
					 	innerDiv.className = 'row';
					 	
					 	var lableDiv = document.createElement('div');
					 	lableDiv.className = 'label';
					 	lableDiv.innerHTML = 'Date'
					 	
					 	var valueDiv = document.createElement('div');
					 	valueDiv.className = 'left';
					 	
					 	var date = new Date((data.list[i].dt)*1000);
					 	var day=date.getDate();
					 	var month=date.getMonth()+1;
					 	var year=date.getFullYear();
					 	valueDiv.innerHTML = month+'-'+day+'-'+year;
					 	
					 	innerDiv.appendChild(lableDiv);
					 	innerDiv.appendChild(valueDiv);
					 	
					 	div.appendChild(innerDiv);
					 	
					 	var innerDiv = document.createElement('div');
					 	innerDiv.className = 'row';
					 	
					 	var lableDiv = document.createElement('div');
					 	lableDiv.className = 'label';
					 	lableDiv.innerHTML = 'Max Temp'
					 	
					 	var valueDiv = document.createElement('div');
					 	valueDiv.className = 'left';
					 	valueDiv.innerHTML = data.list[i].temp.max+' C';					 	
					 	
					 	innerDiv.appendChild(lableDiv);
					 	innerDiv.appendChild(valueDiv);
					 	
					 	div.appendChild(innerDiv);
					 	
					 	var innerDiv = document.createElement('div');
					 	innerDiv.className = 'row';
					 	
					 	var lableDiv = document.createElement('div');
					 	lableDiv.className = 'label';
					 	lableDiv.innerHTML = 'Min Temp'
					 	
					 	var valueDiv = document.createElement('div');
					 	valueDiv.className = 'left';
					 	valueDiv.innerHTML = data.list[i].temp.min+' C';					 	
					 	
					 	innerDiv.appendChild(lableDiv);
					 	innerDiv.appendChild(valueDiv);
					 	
					 	div.appendChild(innerDiv);
					 	container.appendChild(div);
					}
				parent.appendChild(container);
			},
			error: function (request, status, error) {
                alert(error);
            }
		});
	});
});

$(document).ready(function() {
	$('#city').on('change', function() {
	var parent = document.getElementById('weatherforecast');
	while(parent.firstChild)
	{
		parent.removeChild(parent.firstChild);
	}

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
				var temp=data.main.temp+' C';
				$("#temp").text(temp);
				var speed=data.wind.speed + ' kmph';
				$("#wind").text(speed);
				$("#country").text(data.sys.country);
				$("#description").text(data.weather[0].description);
				
				var icon_src = "http://openweathermap.org/img/w/"+data.weather[0].icon+".png";
				$("#icon").attr("src",icon_src);
            },
            error: function (request, status, error) {

                alert('Could not get weather......');
            }
        });
	 
	});
});
</script>
</head>
<body>

    <div class="container">
	<h1>Phunware Weather Center</h1>
	<div id="wrapper">
		<div class="container">
    		<div class="col-lg-1">
        	<select id="city" class="dropdown">
            	<option value="Austin,tx">Select City</option>
            	<option value="Austin,tx">Austin,TX</option>
            	<option value="Dallas,tx">Dallas,TX</option>
            	<option value="London,uk">London,Uk</option>
            </select>
        </div>
    </div>
    	
    	<div id="weather">
        	<div class="row icon"><img src="" id="icon"/></div>
            <div class="row"><div class="label">City</div><div class="left" id="city_name"></div></div>
            <div class="row"><div class="label">Description</div><div class="left" id="description"></div></div>
            <div class="row"><div class="label">Latitude</div><div class="left" id="lati"></div></div>
            <div class="row"><div class="label">Longitude</div><div class="left" id="longi"></div></div>
            <div class="row"><div class="label">Temperature</div><div class="left" id="temp"></div></div>
            <div class="row"><div class="label">Wind</div><div class="left" id="wind"></div></div>
            <div class="row"><div class="label">Country</div><div class="left" id="country"></div></div>
    	</div>
    	
    	<a href="#" id="forecast" title="5 Day forecast">Click here for 5 day forecast</a>
    	
    	<div id="weatherforecast"></div>
        
</div>
</body>
 </html>