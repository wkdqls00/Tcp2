document.addEventListener("DOMContentLoaded", function() {
	
document.getElementById("terms1").addEventListener('click', function(event) {
	event.preventDefault();
	
	const existingPopup = document.querySelector('.popup');
	if (existingPopup) {
	    existingPopup.remove();
	}
	
	const popup = document.createElement('div');
	popup.classList.add('popup');

	const content = document.createElement('div');
	content.classList.add('popup-content');
	popup.appendChild(content);

	popup.style.position = 'fixed';
	popup.style.top = '50%';
	popup.style.left = '50%';
	popup.style.transform = 'translate(-50%, -50%)';
	popup.style.backgroundColor = '#fff';
	popup.style.padding = '10px';
	popup.style.boxShadow = '0 0 10px rgba(0,0,0,0.5)';
	document.body.appendChild(popup);
	
	// Fetch API를 사용하여 외부 파일에서 콘텐츠 가져오기
   const filePath = event.target.getAttribute('data-file-path');
   fetch(filePath)
       .then(response => response.text())
       .then(text => {
           content.innerHTML = text;
       })
       .catch(error => {
           content.textContent = '이용약관을 불러오는 데 실패했습니다.';
           console.error('Error fetching terms:', error);
       });
	
});

document.getElementById("terms2").addEventListener('click', function(event) {
	event.preventDefault();
	
	const existingPopup = document.querySelector('.popup');
	if (existingPopup) {
	    existingPopup.remove();
	}
	
	const popup = document.createElement('div');
	popup.classList.add('popup');

	const content = document.createElement('div');
	content.classList.add('popup-content');
	popup.appendChild(content);

	popup.style.position = 'fixed';
	popup.style.top = '50%';
	popup.style.left = '50%';
	popup.style.transform = 'translate(-50%, -50%)';
	popup.style.backgroundColor = '#fff';
	popup.style.padding = '10px';
	popup.style.boxShadow = '0 0 10px rgba(0,0,0,0.5)';
	document.body.appendChild(popup);
	
	
	// Fetch API를 사용하여 외부 파일에서 콘텐츠 가져오기
	   const filePath = event.target.getAttribute('data-file-path');
	   fetch(filePath)
	       .then(response => response.text())
	       .then(text => {
	           content.innerHTML = text;
	       })
	       .catch(error => {
	           content.textContent = '이용약관을 불러오는 데 실패했습니다.';
	           console.error('Error fetching terms:', error);
	       });
});

document.getElementById("terms3").addEventListener('click', function(event) {
	event.preventDefault();
	const existingPopup = document.querySelector('.popup');
	
		if (existingPopup) {
		    existingPopup.remove();
		}
		
		const popup = document.createElement('div');
		popup.classList.add('popup');

		const content = document.createElement('div');
		content.classList.add('popup-content');
		popup.appendChild(content);

		popup.style.position = 'fixed';
		popup.style.top = '50%';
		popup.style.left = '50%';
		popup.style.transform = 'translate(-50%, -50%)';
		popup.style.backgroundColor = '#fff';
		popup.style.padding = '10px';
		popup.style.boxShadow = '0 0 10px rgba(0,0,0,0.5)';
		document.body.appendChild(popup);
		
		// Fetch API를 사용하여 외부 파일에서 콘텐츠 가져오기
		   const filePath = event.target.getAttribute('data-file-path');
		   fetch(filePath)
		       .then(response => response.text())
		       .then(text => {
		           content.innerHTML = text;
		       })
		       .catch(error => {
		           content.textContent = '이용약관을 불러오는 데 실패했습니다.';
		           console.error('Error fetching terms:', error);
		       });
});

document.getElementById("terms4").addEventListener('click', function(event) {
	event.preventDefault();
	const existingPopup = document.querySelector('.popup');
		if (existingPopup) {
		    existingPopup.remove();
		}
		
		const popup = document.createElement('div');
		popup.classList.add('popup');

		const content = document.createElement('div');
		content.classList.add('popup-content');
		popup.appendChild(content);

		popup.style.position = 'fixed';
		popup.style.top = '50%';
		popup.style.left = '50%';
		popup.style.transform = 'translate(-50%, -50%)';
		popup.style.backgroundColor = '#fff';
		popup.style.padding = '10px';
		popup.style.boxShadow = '0 0 10px rgba(0,0,0,0.5)';
		document.body.appendChild(popup);
		
		// Fetch API를 사용하여 외부 파일에서 콘텐츠 가져오기
		   const filePath = event.target.getAttribute('data-file-path');
		   fetch(filePath)
		       .then(response => response.text())
		       .then(text => {
		           content.innerHTML = text;
		       })
		       .catch(error => {
		           content.textContent = '이용약관을 불러오는 데 실패했습니다.';
		           console.error('Error fetching terms:', error);
		       });
});

document.getElementById("terms5").addEventListener('click', function(event) {
	event.preventDefault();
	const existingPopup = document.querySelector('.popup');
		if (existingPopup) {
		    existingPopup.remove();
		}
		
		const popup = document.createElement('div');
		popup.classList.add('popup');

		const content = document.createElement('div');
		content.classList.add('popup-content');
		popup.appendChild(content);

		popup.style.position = 'fixed';
		popup.style.top = '50%';
		popup.style.left = '50%';
		popup.style.transform = 'translate(-50%, -50%)';
		popup.style.backgroundColor = '#fff';
		popup.style.padding = '10px';
		popup.style.boxShadow = '0 0 10px rgba(0,0,0,0.5)';
		document.body.appendChild(popup);
		
		// Fetch API를 사용하여 외부 파일에서 콘텐츠 가져오기
		   const filePath = event.target.getAttribute('data-file-path');
		   fetch(filePath)
		       .then(response => response.text())
		       .then(text => {
		           content.innerHTML = text;
		       })
		       .catch(error => {
		           content.textContent = '이용약관을 불러오는 데 실패했습니다.';
		           console.error('Error fetching terms:', error);
		       });
});

// 팝업 말고 딴 곳 누르면 팝업 없애기
document.addEventListener('click', function(event) {
	const popup = document.querySelector('.popup');
	if (popup && !popup.contains(event.target) && !event.target.matches('[id^="terms"]')) {
		popup.remove();
	}
});	

});

