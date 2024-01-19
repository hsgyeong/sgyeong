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
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<title>Insert title here</title>
<style type="text/css">
.imgs
{
height:80vh;
margin:0;
padding:0;
transition: transform 0.5s ease-in-out;
overflow: hidden;
display: flex;
position: absolute;
margin: auto;
z-index: 1;
width:2700px;

}

.img
{
width:900px;
height:550px;

} 

.main
{
flex-direction: column;
align-items: center;
width:100%;
}

#imgholder
{
list-style: none;
display: flex;

}

.mainbox{
width:900px; 
height:550px; 
border:1px solid red;
margin: 50px auto 0 auto;
position: relative;
overflow: hidden;
}

.bt
{
z-index: 2;
width:40px;
height:40px;
position:absolute;
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
margin-top: 100px;
text-align: center;
font-size: 30px;
font-weight: bold;
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
	
	function updateSlider(){
		const translateValue = -currentIndex*imgWidth+"px";
		
	/*	$(".img").each(function(index){
			if(index===currentIndex){
				$(this).addClass("active");
			}else{
				$(this).removeClass("active");
			}
		} */
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
</div>
</body>
</html>