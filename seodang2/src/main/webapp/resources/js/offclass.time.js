$(function(){
	//이 페이지에 진입시 무조건 스토리지 초기화
	init();
	
	//로컬스토리지 저장할 배열
	let timetable=[];
	//로컬스토리지에 저장
	function savetimetable(){
		localStorage.setItem("timetable",JSON.stringify(timetable));
	}
	//로컬스토리지 초기화
	function init(){
		localStorage.removeItem("timetable");
	}
	
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
		
		let data = {time_date:time_date, time_start:time_start, time_end:time_end};
		timetable.push(data);
		savetimetable();
		let id = timetable.length-1;
		
		let timeUI  = '<div class="timetable" id="'+id+'">';
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
	//삭제 버튼 클릭시 지우기
	$(document).on('click','#delete-btn',function(){
		divId = JSON.stringify($(this).parents('.timetable').attr('id'));
		$(this).parents('.timetable').remove();
		timetable.splice(divId,1);
		alert(JSON.stringify(timetable));
		localStorage.setItem("timetable",JSON.stringify(timetable));
	})
	
/*	//submit 버튼 클릭시
	$('#open_form').submit(function(){
		let time = localStorage.getItem("timetable");
		let data = $(this).serialize();
		alert(time);
		
		$.ajax({
			type:'post',
			data:{time:timtable,data:data},
			url:'offclassOpen.do',
			dataType:'json',
			cache:false,
			timeout:30000,
			success:function(param){
				
			},
			error:function(){
				alert('네트워크 오류 발생');
			}
		});
	});*/
	
})