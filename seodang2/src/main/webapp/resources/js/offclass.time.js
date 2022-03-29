$(function(){
	
	//배열 선언
	let timetable=[];
	
	//Time 값을 넣었는지 안 넣었는지 확인용
	let checkTime =false;

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
		let time_start =$('#time_start').val();
		let time_end = $('#time_end').val();
		
		let data = {time_date:time_date, time_start:time_start, time_end:time_end};
		
		let timeUI;
		$.ajax({
			type:'post',
			data:data,
			url:'offTimetableAjax.do',
			dataType:'json',
			cache:false,
			timeout:30000,
			success:function(param){
				timetable.push(JSON.stringify(data));
				if(param.result=='timeDuplicated'){
					alert('클래스 시간이 중복됩니다.다시 확인해주세요');
				}else if(param.result=='success'){
				timeUI  = '<div class="timetable">';
				timeUI += '<div class="align-right">';
				timeUI += '	<input type="button" value="X" id="delete-btn" class="btn-nopadding">';
				timeUI += '</div>'
				timeUI += '	<div id="time_date" value="'+time_date+'">'+time_date+'</div>';
				timeUI += '	<div id="time_start" value="'+time_start+'">'+time_start+'</div>';
				timeUI += '	<div>~</div>'
				timeUI += '	<div id="time_end" value="'+time_end+'">'+time_end+'</div>';
				timeUI += '</div>';
		
				$('#time-item').append(timeUI);
				initRegister();
				checkTime=true;
				}else{
					alert('추가 중 오류 발생');
				}
			},
			error:function(){
				alert('네트워크 오류');
			}
		})
	})
	
	//등록 버튼 클릭시 날짜, 시간 초기화
	function initRegister(){
		$('#time_start').val('');
		$('#time_end').val('');
	}
	
	//삭제 버튼 클릭시 지우기
	$(document).on('click','#delete-btn',function(){
		let time_date=$(this).parents(".timetable").find('#time_date').attr('value');
		let time_start=$(this).parents(".timetable").find('#time_start').attr('value');
		let time_end=$(this).parents(".timetable").find('#time_end').attr('value');

		let data = {time_date:time_date, time_start:time_start, time_end:time_end};
		
		//alert(timetable.indexOf(JSON.stringify(data)));
		let index=timetable.indexOf(JSON.stringify(data));
		
		$(this).parents('.timetable').remove();
		
		$.ajax({
			type:'post',
			data:{index:index},
			url:'offTimetableDeleteAjax.do',
			dataType:'json',
			cache:false,
			timeout:30000,
			success:function(param){
				if(param.result=='noClass'){
					timetable.splice(index,1);
					//alert(JSON.stringify(timetable));
					alert('등록된 클래스가 없습니다.');
					checkTime=false;
				}else if(param.result=='success'){
					timetable.splice(index,1);
				}else{
					alert('삭제 시 오류 발생');
					checkTime=false;
				}
			},
			error:function(){
				alert('네크워크 오류');
			}
		});
	});
	
	//submit 버튼 클릭시
	$('#open_form').submit(function(){
		if(!checkTime){
			alert('수업 일정을 입력하세요');
			$('#time_date').val('').focus();
			return false;
		}
	});
});