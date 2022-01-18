/**
 * 
 */
$(document).ready(function() {
		//textarea크기 스크롤 없이 글자에따른 크기 자동 조정
	  $('textarea').keyup(function(e){
		$(this).css('height', 'auto');
		$(this).height(this.scrollHeight);
	  });
	  
	  $('#summernote').summernote({
		  codeviewFilter: true,
		  codeviewIframeFilter: true,
		  height: 390,                 // set editor height
		  minHeight: 370,             // set minimum height of editor
		  maxHeight: null,             // set maximum height of editor
		  focus: true,                  // set focus to editable area after initializing summernote
		  lang: 'ko-KR', // default: 'en-US'
	
		  toolbar: [
			    // [groupName, [list of button]]
			    ['fontname', ['fontname']],
			    ['fontsize', ['fontsize']],
			    ['style', ['bold', 'italic', 'underline','strikethrough', 'clear']],
			    ['color', ['forecolor','color']],
			    ['table', ['table']],
			    ['para', ['ul', 'ol', 'paragraph']],
			    ['height', ['height']],
			    ['insert',['picture','link','video']],
			    ['view', ['fullscreen', 'help']]
			  ],
			fontNames: ['Arial', 'Arial Black', 'Comic Sans MS', 'Courier New','맑은 고딕','궁서','굴림체','굴림','돋움체','바탕체'],
			fontSizes: ['8','9','10','11','12','14','16','18','20','22','24','28','30','36','50','72']
			

        });
        
	  });
	  var value = $("input[name='isPublic']:checked").val();
	  
	  //글자수 제한
	  $('.post-title').on('keyup', function() {
	        $('#post_cnt').html("("+$(this).val().length+" / 100)");
	 
	        if($(this).val().length > 100) {
	            $(this).val($(this).val().substring(0, 100));
	            $('#post_cnt').html("(100 / 100)");
	        }
	});
	// enter방지
	$(document).keypress(function(e) { 
		if (e.keyCode == 13) e.preventDefault(); 
	});