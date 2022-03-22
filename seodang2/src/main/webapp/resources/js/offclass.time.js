$(function(){
	
	
	
	//등록 버튼을 눌렀을 때 목록이 출력이 되도록
	$('#time_register').click(function(){
		
		if($('#time_date').val().trim()==''){
			alert('날짜를 입력하세요.');
			$('#time_date').val('').focus();
			return false;
		}
		if($('#time_start').val().trim()==''){
			alert('시작 시간을 입력을 확인해주세요.');
			$('#time_start').val('').focus();
			return false;
		}
		
		if($('#time_end').val().trim()=='' || $('#time_end').val()<$('#time_start').val()){
			alert('끝나는 시간을 입력을 확인해주세요.');
			$('#time_end').val('').focus();
			return false;
		}
		
		let time_date = $('#time_date').val();
		let time_start = $('#time_start').val();
		let time_end = $('#time_end').val();
		
		let timeUI  = '<div class="timetable">';
			timeUI += '<div class="align-right">';
			timeUI += '	<input type="button" value="X" id="delete-btn" class="btn-nopadding">';
			timeUI += '</div>'
			timeUI += '	<div id="time_date" value="'+time_date+'">'+time_date+'</div>';
			timeUI += '	<div id="time_start" value="'+time_start+'">'+time_start+'</div>';
			timeUI += '	<div>~</div>'
			timeUI += '	<div id="time_end" value="'+time_end+'">'+time_end+'</div>';
			timeUI += '</div>';
			
		initRegister();
			
		$(this).parents('.items').find('#time-item').append(timeUI);
	})
	
	//등록 버튼 클릭시 날짜, 시간 초기화
	function initRegister(){
		$('#time_start').val('');
		$('#time_end').val('');
	}
	$(document).on('click','#delete-btn',function(){
		$(this).parents('.timetable').remove();
	})
	
	
})