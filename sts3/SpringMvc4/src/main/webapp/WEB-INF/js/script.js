/**
 * 
 */
 $(function(){
 
 	$("#myimg").attr("src","../image/whale.png");  
 	
 	$("#myimg").hover(function(){
 	
 	$(this).attr("src","../image/b1.png");
 	
 	},function(){
 	
 	$(this).attr("src","../image/b3.png");
 	
 	});
 });