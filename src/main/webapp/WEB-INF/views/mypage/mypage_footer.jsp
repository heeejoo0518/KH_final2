<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 			</div><!-- page-content-wrapper -->
		</div><!-- .container-fluid -->
	</div><!-- #wrapper -->
</section>

<%@ include file="/WEB-INF/views/common/footer.jsp"%>
<script>
	var element = document.querySelector('#wrapper');
	const menuIcon = "${ path }/images/menu.png";
	const xIcon = "${ path }/images/close.png";
	
	if(localStorage.getItem('sb|sidebar-toggle') === 'true') document.body.classList.add('sb-sidenav-toggled');
	else {
		document.body.classList.remove('sb-sidenav-toggled');
		toggles();
	}
	
	$(window).resize(function(){
		if(element.offsetWidth <= element.scrollWidth){
			//오버플로우
			document.body.classList.add('sb-sidenav-toggled');
			document.getElementById('img_sidebar').src = menuIcon;
		}
	});
	
	window.addEventListener('DOMContentLoaded', event => {
	    const sidebarToggle = document.body.querySelector('#sidebarToggle');
	    toggles();
	    
	    sidebarToggle.addEventListener('click', event => {
	        event.preventDefault();
	        document.body.classList.toggle('sb-sidenav-toggled');
	        toggles();
	    }); 
	});
 	
 	function toggles(){
        localStorage.setItem('sb|sidebar-toggle', document.body.classList.contains('sb-sidenav-toggled'));
        var src = document.body.classList.contains('sb-sidenav-toggled')? menuIcon:xIcon;
	    document.getElementById('img_sidebar').src = src;
 	}
</script>

<script>
	var url = window.location.href;
	var activeItem = '';
	
	if(url.includes("myreview")) activeItem = 'review-list-item';
	else if(url.includes("mylike")) activeItem = 'like-list-item';
	else activeItem = 'update-list-item';
	
	document.getElementById(activeItem).classList.add("active");
	
	function activeFnc(type){
		var src = "#";
		
		switch(type){
		case 1:
			src = "${path}/mypage";
			break;
		case 2:
			src = "${path}/mypage/myreview";
			break;
		case 3:
			src = "${path}/mypage/mylike";
		}
		
		window.location.replace(src);
	}
</script>