	//월별 검색 기능 
	document.getElementById("searchMonth").addEventListener("click", function(){
		event.preventDefault();
		let year = document.getElementById("year").innerText.match(/\d{4}/);
		let month = document.getElementById("month").innerText.replace(/(\d+)월/, function(match, p1) {
	        return p1.padStart(2, '0');
		});
		window.location.href = `/Tcp2/Ticket_checkMonthRServlet?year=${year}&month=${month}`;
	});