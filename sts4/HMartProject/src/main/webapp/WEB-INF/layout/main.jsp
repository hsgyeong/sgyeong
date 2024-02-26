<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Dongle:wght@300&family=Gaegu:wght@300&family=Nanum+Pen+Script&family=Sunflower:wght@300&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Gugi&display=swap" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<title>Insert title here</title>
<style type="text/css">
.imgs
{
	height:50vh;
	margin:0;
	padding:0;
	transition: transform 0.5s ease-in-out;
	overflow: hidden;
	display: flex;
	position: absolute;
	margin: auto;
	z-index: 1;
	width:2400px;
}

.img
{
	width:800px; 
	height:420px; 
} 

.main
{
	flex-direction: column;
	align-items: center;
	width:100%;
	height: 50vh;
	top:200px;/**/
}

#main{
	margin-top:100px;	
}

#imgholder
{
	list-style: none;
	display: flex;
	height: 550px;
}

.mainbox{
	width:800px; 
	height:420px; 
	border:1px solid red;
	margin: 50px auto 0 auto;
	position: relative;
	overflow: hidden;
	top: 135px;/**/
}

.bt
{
	z-index: 2;
	width:40px;
	height:40px;
	position:absolute;
	transform: translateY(-50%);
}

.img .active{
	display:block;
}

#changeleft{
	top:50%;
	left:0;
	margin-top: 28%;
}

#changeright{
	top:50%;
	right:0;
	margin-top: 28%;
}

.slider{
	position: absolute;
}
.hotitem{ 
	margin-top: 200px;
	text-align: center;
	font-size: 30px;
	font-weight: bold;
	margin-bottom: 40px;
}

.mainList {
	margin-top:0px;
	margin-bottom: 250px;
	align-content: center;
	justify-content: center;
	z-index: 2;
}

.infopage{
	width: 100%;
	align-content: center;
	justify-content: center;
}


</style>
<script type="text/javascript">
$(document).ready(function(){
	let currentIndex = 0;
	const totalImages = $(".img").length;
	const imgWidth = $(".img").width();
	
	$(".img:first-child").addClass("active");
	
	$("#changeleft").click(function(){
		currentIndex = (currentIndex-1+totalImages)%totalImages;
		updateSlider();
	});
	
	$("#changeright").click(function(){
		currentIndex = (currentIndex+1)%totalImages;
		updateSlider();
	});
	
	setInterval(function(){
		currentIndex = (currentIndex+1)%totalImages;
		updateSlider();
	},4000);
	
	
	function updateSlider(){
		const translateValue = -currentIndex*imgWidth+"px";
	
		$(".imgs").css("transform","translateX("+translateValue+")");
	}
})

	
</script>
</head>
<body>
<c:set var="root" value="<%=request.getContextPath() %>"/>
<div id="main">
	<div class="mainbox">
	<div class="slider" style="position:relative;">
	<img alt="" src="${root }/mainimage/left-arrow.png" class="bt" id="changeleft" >
	<img alt="" src="${root }/mainimage/right-arroww.png" class="bt" id="changeright">
		<ul id="imgholder" class="imgs">
			<li><img src="${root }/mainimage/메인1.png" class="img img1" id="mainimg1"></li>
			<li><img src="${root }/mainimage/메인2.png" class="img img2" id="mainimg2"></li>
			<li><img src="${root }/mainimage/메인3.png" class="img img3" id="mainimg3"></li>
		</ul>
	</div>
	</div>
		<div class="hotitem">현재 인기상품</div>
		<div style="position:relative;">
		<div class="layout mainList" id="mainList">
			<jsp:include page="../layout/mainList.jsp"/>
		</div>
		</div>
		<div  class="infopage">
		<jsp:include page="info.jsp"/>
		</div>
</div>
</body>
</html>