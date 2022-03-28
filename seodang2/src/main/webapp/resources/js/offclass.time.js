$(function(){
	let editor;
		 function MyCustomUploadAdapterPlugin(editor) {
			    editor.plugins.get('FileRepository').createUploadAdapter = (loader) => {
			        return new UploadAdapter(loader);
			    }
			}
		 ClassicEditor
            .create( document.querySelector( '#off_content' ),{
            	fontFamily: {
            		options: [
            			'default',
            			'Arial',
            			'궁서체',
            			'바탕',
            			'돋움',
            			'나눔고딕'
            		],
            		supportAllValues: true
            	},
            	fontSize: {
                    options: [
                        9,
                        11,
                        13,
                        'default',
                        17,
                        19,
                        21
                    ],
            		supportAllValues: true
                },
                fontColor: {
                	columns: 10,
                	documentColors: 200,
                	colors: [
                	{color: 'hsl(6, 54%, 95%)', label:' '}, {color: 'hsl(6, 54%, 89%)', label:' '}, {color: 'hsl(6, 54%, 78%)', label:' '}, {color: 'hsl(6, 54%, 68%)', label:' '}, {color: 'hsl(6, 54%, 57%)', label:' '}, {color: 'hsl(6, 63%, 46%)', label:' '}, {color: 'hsl(6, 63%, 41%)', label:' '}, {color: 'hsl(6, 63%, 35%)', label:' '}, {color: 'hsl(6, 63%, 29%)', label:' '}, {color: 'hsl(6, 63%, 24%)', label:' '}, {color: 'hsl(6, 78%, 96%)', label:' '}, {color: 'hsl(6, 78%, 91%)', label:' '}, {color: 'hsl(6, 78%, 83%)', label:' '}, {color: 'hsl(6, 78%, 74%)', label:' '}, {color: 'hsl(6, 78%, 66%)', label:' '}, {color: 'hsl(6, 78%, 57%)', label:' '}, {color: 'hsl(6, 59%, 50%)', label:' '}, {color: 'hsl(6, 59%, 43%)', label:' '}, {color: 'hsl(6, 59%, 37%)', label:' '}, {color: 'hsl(6, 59%, 30%)', label:' '}, {color: 'hsl(283, 39%, 95%)', label:' '}, {color: 'hsl(283, 39%, 91%)', label:' '}, {color: 'hsl(283, 39%, 81%)', label:' '}, {color: 'hsl(283, 39%, 72%)', label:' '}, {color: 'hsl(283, 39%, 63%)', label:' '}, {color: 'hsl(283, 39%, 53%)', label:' '}, {color: 'hsl(283, 34%, 47%)', label:' '}, {color: 'hsl(283, 34%, 40%)', label:' '}, {color: 'hsl(283, 34%, 34%)', label:' '}, {color: 'hsl(283, 34%, 28%)', label:' '}, {color: 'hsl(282, 39%, 95%)', label:' '}, {color: 'hsl(282, 39%, 89%)', label:' '}, {color: 'hsl(282, 39%, 79%)', label:' '}, {color: 'hsl(282, 39%, 68%)', label:' '}, {color: 'hsl(282, 39%, 58%)', label:' '}, {color: 'hsl(282, 44%, 47%)', label:' '}, {color: 'hsl(282, 44%, 42%)', label:' '}, {color: 'hsl(282, 44%, 36%)', label:' '}, {color: 'hsl(282, 44%, 30%)', label:' '}, {color: 'hsl(282, 44%, 25%)', label:' '}, {color: 'hsl(204, 51%, 94%)', label:' '}, {color: 'hsl(204, 51%, 89%)', label:' '}, {color: 'hsl(204, 51%, 78%)', label:' '}, {color: 'hsl(204, 51%, 67%)', label:' '}, {color: 'hsl(204, 51%, 55%)', label:' '}, {color: 'hsl(204, 64%, 44%)', label:' '}, {color: 'hsl(204, 64%, 39%)', label:' '}, {color: 'hsl(204, 64%, 34%)', label:' '}, {color: 'hsl(204, 64%, 28%)', label:' '}, {color: 'hsl(204, 64%, 23%)', label:' '}, {color: 'hsl(204, 70%, 95%)', label:' '}, {color: 'hsl(204, 70%, 91%)', label:' '}, {color: 'hsl(204, 70%, 81%)', label:' '}, {color: 'hsl(204, 70%, 72%)', label:' '}, {color: 'hsl(204, 70%, 63%)', label:' '}, {color: 'hsl(204, 70%, 53%)', label:' '}, {color: 'hsl(204, 62%, 47%)', label:' '}, {color: 'hsl(204, 62%, 40%)', label:' '}, {color: 'hsl(204, 62%, 34%)', label:' '}, {color: 'hsl(204, 62%, 28%)', label:' '}, {color: 'hsl(168, 55%, 94%)', label:' '}, {color: 'hsl(168, 55%, 88%)', label:' '}, {color: 'hsl(168, 55%, 77%)', label:' '}, {color: 'hsl(168, 55%, 65%)', label:' '}, {color: 'hsl(168, 55%, 54%)', label:' '}, {color: 'hsl(168, 76%, 42%)', label:' '}, {color: 'hsl(168, 76%, 37%)', label:' '}, {color: 'hsl(168, 76%, 32%)', label:' '}, {color: 'hsl(168, 76%, 27%)', label:' '}, {color: 'hsl(168, 76%, 22%)', label:' '}, {color: 'hsl(168, 42%, 94%)', label:' '}, {color: 'hsl(168, 42%, 87%)', label:' '}, {color: 'hsl(168, 42%, 74%)', label:' '}, {color: 'hsl(168, 42%, 61%)', label:' '}, {color: 'hsl(168, 45%, 49%)', label:' '}, {color: 'hsl(168, 76%, 36%)', label:' '}, {color: 'hsl(168, 76%, 31%)', label:' '}, {color: 'hsl(168, 76%, 27%)', label:' '}, {color: 'hsl(168, 76%, 23%)', label:' '}, {color: 'hsl(168, 76%, 19%)', label:' '}, {color: 'hsl(145, 45%, 94%)', label:' '}, {color: 'hsl(145, 45%, 88%)', label:' '}, {color: 'hsl(145, 45%, 77%)', label:' '}, {color: 'hsl(145, 45%, 65%)', label:' '}, {color: 'hsl(145, 45%, 53%)', label:' '}, {color: 'hsl(145, 63%, 42%)', label:' '}, {color: 'hsl(145, 63%, 37%)', label:' '}, {color: 'hsl(145, 63%, 32%)', label:' '}, {color: 'hsl(145, 63%, 27%)', label:' '}, {color: 'hsl(145, 63%, 22%)', label:' '}, {color: 'hsl(145, 61%, 95%)', label:' '}, {color: 'hsl(145, 61%, 90%)', label:' '}, {color: 'hsl(145, 61%, 80%)', label:' '}, {color: 'hsl(145, 61%, 69%)', label:' '}, {color: 'hsl(145, 61%, 59%)', label:' '}, {color: 'hsl(145, 63%, 49%)', label:' '}, {color: 'hsl(145, 63%, 43%)', label:' '}, {color: 'hsl(145, 63%, 37%)', label:' '}, {color: 'hsl(145, 63%, 31%)', label:' '}, {color: 'hsl(145, 63%, 25%)', label:' '}, {color: 'hsl(48, 89%, 95%)', label:' '}, {color: 'hsl(48, 89%, 90%)', label:' '}, {color: 'hsl(48, 89%, 80%)', label:' '}, {color: 'hsl(48, 89%, 70%)', label:' '}, {color: 'hsl(48, 89%, 60%)', label:' '}, {color: 'hsl(48, 89%, 50%)', label:' '}, {color: 'hsl(48, 88%, 44%)', label:' '}, {color: 'hsl(48, 88%, 38%)', label:' '}, {color: 'hsl(48, 88%, 32%)', label:' '}, {color: 'hsl(48, 88%, 26%)', label:' '}, {color: 'hsl(37, 90%, 95%)', label:' '}, {color: 'hsl(37, 90%, 90%)', label:' '}, {color: 'hsl(37, 90%, 80%)', label:' '}, {color: 'hsl(37, 90%, 71%)', label:' '}, {color: 'hsl(37, 90%, 61%)', label:' '}, {color: 'hsl(37, 90%, 51%)', label:' '}, {color: 'hsl(37, 86%, 45%)', label:' '}, {color: 'hsl(37, 86%, 39%)', label:' '}, {color: 'hsl(37, 86%, 33%)', label:' '}, {color: 'hsl(37, 86%, 27%)', label:' '}, {color: 'hsl(28, 80%, 95%)', label:' '}, {color: 'hsl(28, 80%, 90%)', label:' '}, {color: 'hsl(28, 80%, 81%)', label:' '}, {color: 'hsl(28, 80%, 71%)', label:' '}, {color: 'hsl(28, 80%, 61%)', label:' '}, {color: 'hsl(28, 80%, 52%)', label:' '}, {color: 'hsl(28, 74%, 46%)', label:' '}, {color: 'hsl(28, 74%, 39%)', label:' '}, {color: 'hsl(28, 74%, 33%)', label:' '}, {color: 'hsl(28, 74%, 27%)', label:' '}, {color: 'hsl(24, 71%, 94%)', label:' '}, {color: 'hsl(24, 71%, 88%)', label:' '}, {color: 'hsl(24, 71%, 77%)', label:' '}, {color: 'hsl(24, 71%, 65%)', label:' '}, {color: 'hsl(24, 71%, 53%)', label:' '}, {color: 'hsl(24, 100%, 41%)', label:' '}, {color: 'hsl(24, 100%, 36%)', label:' '}, {color: 'hsl(24, 100%, 31%)', label:' '}, {color: 'hsl(24, 100%, 26%)', label:' '}, {color: 'hsl(24, 100%, 22%)', label:' '}, {color: 'hsl(192, 15%, 99%)', label:' '}, {color: 'hsl(192, 15%, 99%)', label:' '}, {color: 'hsl(192, 15%, 97%)', label:' '}, {color: 'hsl(192, 15%, 96%)', label:' '}, {color: 'hsl(192, 15%, 95%)', label:' '}, {color: 'hsl(192, 15%, 94%)', label:' '}, {color: 'hsl(192, 5%, 82%)', label:' '}, {color: 'hsl(192, 3%, 71%)', label:' '}, {color: 'hsl(192, 2%, 60%)', label:' '}, {color: 'hsl(192, 1%, 49%)', label:' '}, {color: 'hsl(204, 8%, 98%)', label:' '}, {color: 'hsl(204, 8%, 95%)', label:' '}, {color: 'hsl(204, 8%, 90%)', label:' '}, {color: 'hsl(204, 8%, 86%)', label:' '}, {color: 'hsl(204, 8%, 81%)', label:' '}, {color: 'hsl(204, 8%, 76%)', label:' '}, {color: 'hsl(204, 5%, 67%)', label:' '}, {color: 'hsl(204, 4%, 58%)', label:' '}, {color: 'hsl(204, 3%, 49%)', label:' '}, {color: 'hsl(204, 3%, 40%)', label:' '}, {color: 'hsl(184, 9%, 96%)', label:' '}, {color: 'hsl(184, 9%, 92%)', label:' '}, {color: 'hsl(184, 9%, 85%)', label:' '}, {color: 'hsl(184, 9%, 77%)', label:' '}, {color: 'hsl(184, 9%, 69%)', label:' '}, {color: 'hsl(184, 9%, 62%)', label:' '}, {color: 'hsl(184, 6%, 54%)', label:' '}, {color: 'hsl(184, 5%, 47%)', label:' '}, {color: 'hsl(184, 5%, 40%)', label:' '}, {color: 'hsl(184, 5%, 32%)', label:' '}, {color: 'hsl(184, 6%, 95%)', label:' '}, {color: 'hsl(184, 6%, 91%)', label:' '}, {color: 'hsl(184, 6%, 81%)', label:' '}, {color: 'hsl(184, 6%, 72%)', label:' '}, {color: 'hsl(184, 6%, 62%)', label:' '}, {color: 'hsl(184, 6%, 53%)', label:' '}, {color: 'hsl(184, 5%, 46%)', label:' '}, {color: 'hsl(184, 5%, 40%)', label:' '}, {color: 'hsl(184, 5%, 34%)', label:' '}, {color: 'hsl(184, 5%, 27%)', label:' '}, {color: 'hsl(210, 12%, 93%)', label:' '}, {color: 'hsl(210, 12%, 86%)', label:' '}, {color: 'hsl(210, 12%, 71%)', label:' '}, {color: 'hsl(210, 12%, 57%)', label:' '}, {color: 'hsl(210, 15%, 43%)', label:' '}, {color: 'hsl(210, 29%, 29%)', label:' '}, {color: 'hsl(210, 29%, 25%)', label:' '}, {color: 'hsl(210, 29%, 22%)', label:' '}, {color: 'hsl(210, 29%, 18%)', label:' '}, {color: 'hsl(210, 29%, 15%)', label:' '}, {color: 'hsl(210, 9%, 92%)', label:' '}, {color: 'hsl(210, 9%, 85%)', label:' '}, {color: 'hsl(210, 9%, 70%)', label:' '}, {color: 'hsl(210, 9%, 55%)', label:' '}, {color: 'hsl(210, 14%, 39%)', label:' '}, {color: 'hsl(210, 29%, 24%)', label:' '}, {color: 'hsl(210, 29%, 21%)', label:' '}, {color: 'hsl(210, 29%, 18%)', label:' '}, {color: 'hsl(210, 29%, 16%)', label:' '}, {color: 'hsl(210, 29%, 13%)', label:' '}
                	]
                },
                fontBackgroundColor: {
                	columns: 10,
                	documentColors: 200,
                	colors: [
                	{color: 'hsl(6, 54%, 95%)', label:' '}, {color: 'hsl(6, 54%, 89%)', label:' '}, {color: 'hsl(6, 54%, 78%)', label:' '}, {color: 'hsl(6, 54%, 68%)', label:' '}, {color: 'hsl(6, 54%, 57%)', label:' '}, {color: 'hsl(6, 63%, 46%)', label:' '}, {color: 'hsl(6, 63%, 41%)', label:' '}, {color: 'hsl(6, 63%, 35%)', label:' '}, {color: 'hsl(6, 63%, 29%)', label:' '}, {color: 'hsl(6, 63%, 24%)', label:' '}, {color: 'hsl(6, 78%, 96%)', label:' '}, {color: 'hsl(6, 78%, 91%)', label:' '}, {color: 'hsl(6, 78%, 83%)', label:' '}, {color: 'hsl(6, 78%, 74%)', label:' '}, {color: 'hsl(6, 78%, 66%)', label:' '}, {color: 'hsl(6, 78%, 57%)', label:' '}, {color: 'hsl(6, 59%, 50%)', label:' '}, {color: 'hsl(6, 59%, 43%)', label:' '}, {color: 'hsl(6, 59%, 37%)', label:' '}, {color: 'hsl(6, 59%, 30%)', label:' '}, {color: 'hsl(283, 39%, 95%)', label:' '}, {color: 'hsl(283, 39%, 91%)', label:' '}, {color: 'hsl(283, 39%, 81%)', label:' '}, {color: 'hsl(283, 39%, 72%)', label:' '}, {color: 'hsl(283, 39%, 63%)', label:' '}, {color: 'hsl(283, 39%, 53%)', label:' '}, {color: 'hsl(283, 34%, 47%)', label:' '}, {color: 'hsl(283, 34%, 40%)', label:' '}, {color: 'hsl(283, 34%, 34%)', label:' '}, {color: 'hsl(283, 34%, 28%)', label:' '}, {color: 'hsl(282, 39%, 95%)', label:' '}, {color: 'hsl(282, 39%, 89%)', label:' '}, {color: 'hsl(282, 39%, 79%)', label:' '}, {color: 'hsl(282, 39%, 68%)', label:' '}, {color: 'hsl(282, 39%, 58%)', label:' '}, {color: 'hsl(282, 44%, 47%)', label:' '}, {color: 'hsl(282, 44%, 42%)', label:' '}, {color: 'hsl(282, 44%, 36%)', label:' '}, {color: 'hsl(282, 44%, 30%)', label:' '}, {color: 'hsl(282, 44%, 25%)', label:' '}, {color: 'hsl(204, 51%, 94%)', label:' '}, {color: 'hsl(204, 51%, 89%)', label:' '}, {color: 'hsl(204, 51%, 78%)', label:' '}, {color: 'hsl(204, 51%, 67%)', label:' '}, {color: 'hsl(204, 51%, 55%)', label:' '}, {color: 'hsl(204, 64%, 44%)', label:' '}, {color: 'hsl(204, 64%, 39%)', label:' '}, {color: 'hsl(204, 64%, 34%)', label:' '}, {color: 'hsl(204, 64%, 28%)', label:' '}, {color: 'hsl(204, 64%, 23%)', label:' '}, {color: 'hsl(204, 70%, 95%)', label:' '}, {color: 'hsl(204, 70%, 91%)', label:' '}, {color: 'hsl(204, 70%, 81%)', label:' '}, {color: 'hsl(204, 70%, 72%)', label:' '}, {color: 'hsl(204, 70%, 63%)', label:' '}, {color: 'hsl(204, 70%, 53%)', label:' '}, {color: 'hsl(204, 62%, 47%)', label:' '}, {color: 'hsl(204, 62%, 40%)', label:' '}, {color: 'hsl(204, 62%, 34%)', label:' '}, {color: 'hsl(204, 62%, 28%)', label:' '}, {color: 'hsl(168, 55%, 94%)', label:' '}, {color: 'hsl(168, 55%, 88%)', label:' '}, {color: 'hsl(168, 55%, 77%)', label:' '}, {color: 'hsl(168, 55%, 65%)', label:' '}, {color: 'hsl(168, 55%, 54%)', label:' '}, {color: 'hsl(168, 76%, 42%)', label:' '}, {color: 'hsl(168, 76%, 37%)', label:' '}, {color: 'hsl(168, 76%, 32%)', label:' '}, {color: 'hsl(168, 76%, 27%)', label:' '}, {color: 'hsl(168, 76%, 22%)', label:' '}, {color: 'hsl(168, 42%, 94%)', label:' '}, {color: 'hsl(168, 42%, 87%)', label:' '}, {color: 'hsl(168, 42%, 74%)', label:' '}, {color: 'hsl(168, 42%, 61%)', label:' '}, {color: 'hsl(168, 45%, 49%)', label:' '}, {color: 'hsl(168, 76%, 36%)', label:' '}, {color: 'hsl(168, 76%, 31%)', label:' '}, {color: 'hsl(168, 76%, 27%)', label:' '}, {color: 'hsl(168, 76%, 23%)', label:' '}, {color: 'hsl(168, 76%, 19%)', label:' '}, {color: 'hsl(145, 45%, 94%)', label:' '}, {color: 'hsl(145, 45%, 88%)', label:' '}, {color: 'hsl(145, 45%, 77%)', label:' '}, {color: 'hsl(145, 45%, 65%)', label:' '}, {color: 'hsl(145, 45%, 53%)', label:' '}, {color: 'hsl(145, 63%, 42%)', label:' '}, {color: 'hsl(145, 63%, 37%)', label:' '}, {color: 'hsl(145, 63%, 32%)', label:' '}, {color: 'hsl(145, 63%, 27%)', label:' '}, {color: 'hsl(145, 63%, 22%)', label:' '}, {color: 'hsl(145, 61%, 95%)', label:' '}, {color: 'hsl(145, 61%, 90%)', label:' '}, {color: 'hsl(145, 61%, 80%)', label:' '}, {color: 'hsl(145, 61%, 69%)', label:' '}, {color: 'hsl(145, 61%, 59%)', label:' '}, {color: 'hsl(145, 63%, 49%)', label:' '}, {color: 'hsl(145, 63%, 43%)', label:' '}, {color: 'hsl(145, 63%, 37%)', label:' '}, {color: 'hsl(145, 63%, 31%)', label:' '}, {color: 'hsl(145, 63%, 25%)', label:' '}, {color: 'hsl(48, 89%, 95%)', label:' '}, {color: 'hsl(48, 89%, 90%)', label:' '}, {color: 'hsl(48, 89%, 80%)', label:' '}, {color: 'hsl(48, 89%, 70%)', label:' '}, {color: 'hsl(48, 89%, 60%)', label:' '}, {color: 'hsl(48, 89%, 50%)', label:' '}, {color: 'hsl(48, 88%, 44%)', label:' '}, {color: 'hsl(48, 88%, 38%)', label:' '}, {color: 'hsl(48, 88%, 32%)', label:' '}, {color: 'hsl(48, 88%, 26%)', label:' '}, {color: 'hsl(37, 90%, 95%)', label:' '}, {color: 'hsl(37, 90%, 90%)', label:' '}, {color: 'hsl(37, 90%, 80%)', label:' '}, {color: 'hsl(37, 90%, 71%)', label:' '}, {color: 'hsl(37, 90%, 61%)', label:' '}, {color: 'hsl(37, 90%, 51%)', label:' '}, {color: 'hsl(37, 86%, 45%)', label:' '}, {color: 'hsl(37, 86%, 39%)', label:' '}, {color: 'hsl(37, 86%, 33%)', label:' '}, {color: 'hsl(37, 86%, 27%)', label:' '}, {color: 'hsl(28, 80%, 95%)', label:' '}, {color: 'hsl(28, 80%, 90%)', label:' '}, {color: 'hsl(28, 80%, 81%)', label:' '}, {color: 'hsl(28, 80%, 71%)', label:' '}, {color: 'hsl(28, 80%, 61%)', label:' '}, {color: 'hsl(28, 80%, 52%)', label:' '}, {color: 'hsl(28, 74%, 46%)', label:' '}, {color: 'hsl(28, 74%, 39%)', label:' '}, {color: 'hsl(28, 74%, 33%)', label:' '}, {color: 'hsl(28, 74%, 27%)', label:' '}, {color: 'hsl(24, 71%, 94%)', label:' '}, {color: 'hsl(24, 71%, 88%)', label:' '}, {color: 'hsl(24, 71%, 77%)', label:' '}, {color: 'hsl(24, 71%, 65%)', label:' '}, {color: 'hsl(24, 71%, 53%)', label:' '}, {color: 'hsl(24, 100%, 41%)', label:' '}, {color: 'hsl(24, 100%, 36%)', label:' '}, {color: 'hsl(24, 100%, 31%)', label:' '}, {color: 'hsl(24, 100%, 26%)', label:' '}, {color: 'hsl(24, 100%, 22%)', label:' '}, {color: 'hsl(192, 15%, 99%)', label:' '}, {color: 'hsl(192, 15%, 99%)', label:' '}, {color: 'hsl(192, 15%, 97%)', label:' '}, {color: 'hsl(192, 15%, 96%)', label:' '}, {color: 'hsl(192, 15%, 95%)', label:' '}, {color: 'hsl(192, 15%, 94%)', label:' '}, {color: 'hsl(192, 5%, 82%)', label:' '}, {color: 'hsl(192, 3%, 71%)', label:' '}, {color: 'hsl(192, 2%, 60%)', label:' '}, {color: 'hsl(192, 1%, 49%)', label:' '}, {color: 'hsl(204, 8%, 98%)', label:' '}, {color: 'hsl(204, 8%, 95%)', label:' '}, {color: 'hsl(204, 8%, 90%)', label:' '}, {color: 'hsl(204, 8%, 86%)', label:' '}, {color: 'hsl(204, 8%, 81%)', label:' '}, {color: 'hsl(204, 8%, 76%)', label:' '}, {color: 'hsl(204, 5%, 67%)', label:' '}, {color: 'hsl(204, 4%, 58%)', label:' '}, {color: 'hsl(204, 3%, 49%)', label:' '}, {color: 'hsl(204, 3%, 40%)', label:' '}, {color: 'hsl(184, 9%, 96%)', label:' '}, {color: 'hsl(184, 9%, 92%)', label:' '}, {color: 'hsl(184, 9%, 85%)', label:' '}, {color: 'hsl(184, 9%, 77%)', label:' '}, {color: 'hsl(184, 9%, 69%)', label:' '}, {color: 'hsl(184, 9%, 62%)', label:' '}, {color: 'hsl(184, 6%, 54%)', label:' '}, {color: 'hsl(184, 5%, 47%)', label:' '}, {color: 'hsl(184, 5%, 40%)', label:' '}, {color: 'hsl(184, 5%, 32%)', label:' '}, {color: 'hsl(184, 6%, 95%)', label:' '}, {color: 'hsl(184, 6%, 91%)', label:' '}, {color: 'hsl(184, 6%, 81%)', label:' '}, {color: 'hsl(184, 6%, 72%)', label:' '}, {color: 'hsl(184, 6%, 62%)', label:' '}, {color: 'hsl(184, 6%, 53%)', label:' '}, {color: 'hsl(184, 5%, 46%)', label:' '}, {color: 'hsl(184, 5%, 40%)', label:' '}, {color: 'hsl(184, 5%, 34%)', label:' '}, {color: 'hsl(184, 5%, 27%)', label:' '}, {color: 'hsl(210, 12%, 93%)', label:' '}, {color: 'hsl(210, 12%, 86%)', label:' '}, {color: 'hsl(210, 12%, 71%)', label:' '}, {color: 'hsl(210, 12%, 57%)', label:' '}, {color: 'hsl(210, 15%, 43%)', label:' '}, {color: 'hsl(210, 29%, 29%)', label:' '}, {color: 'hsl(210, 29%, 25%)', label:' '}, {color: 'hsl(210, 29%, 22%)', label:' '}, {color: 'hsl(210, 29%, 18%)', label:' '}, {color: 'hsl(210, 29%, 15%)', label:' '}, {color: 'hsl(210, 9%, 92%)', label:' '}, {color: 'hsl(210, 9%, 85%)', label:' '}, {color: 'hsl(210, 9%, 70%)', label:' '}, {color: 'hsl(210, 9%, 55%)', label:' '}, {color: 'hsl(210, 14%, 39%)', label:' '}, {color: 'hsl(210, 29%, 24%)', label:' '}, {color: 'hsl(210, 29%, 21%)', label:' '}, {color: 'hsl(210, 29%, 18%)', label:' '}, {color: 'hsl(210, 29%, 16%)', label:' '}, {color: 'hsl(210, 29%, 13%)', label:' '}
                	]
                },
            	extraPlugins: [MyCustomUploadAdapterPlugin]
            })
            .then( editor => {
				window.editor = editor;
			} )
            .catch( error => {
                console.error( error );
            } );


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