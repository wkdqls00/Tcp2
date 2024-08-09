	//월별 검색 기능 
	document.getElementById("searchMonth").addEventListener("click", function(event){
		event.preventDefault();
		let viOrRe = document.getElementById("viOrRe").innerText;
		let year = document.getElementById("year").innerText;
		if(year !== "연도")
		year = document.getElementById("year").innerText.match(/\d{4}/);
		let month = document.getElementById("month").innerText;
		if(month !== "월")
		month = document.getElementById("month").innerText.replace(/(\d+)월/, function(match, p1) {
	        return p1.padStart(2, '0');
		});
		if(year != "연도" && month != "월")
		window.location.href = `/Tcp2/Controller?command=ticket_checkMonthY&viOrRe=${viOrRe}&year=${year}&month=${month}`;
		else 
		window.location.href ="#"
	});