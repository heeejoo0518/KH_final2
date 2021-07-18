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
	
	
	document.body.classList.add('sb-sidenav-toggled');
	
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