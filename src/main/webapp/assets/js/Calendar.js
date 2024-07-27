 document.addEventListener("DOMContentLoaded", function() {
        buildCalendar();
        document.getElementById("btnPrevCalendar").addEventListener("click", function(event) {
            prevCalendar();
        });
        document.getElementById("nextNextCalendar").addEventListener("click", function(event) {
            nextCalendar();
        });
    });
    var toDay = new Date();
    var nowDate = new Date();
    function prevCalendar() {
        this.toDay = new Date(toDay.getFullYear(), toDay.getMonth() - 1, toDay.getDate());
        buildCalendar();
    }
    function nextCalendar() {
        this.toDay = new Date(toDay.getFullYear(), toDay.getMonth() + 1, toDay.getDate());
        buildCalendar();
    }
    function buildCalendar() {
        let doMonth = new Date(toDay.getFullYear(), toDay.getMonth(), 1);
        let lastDate = new Date(toDay.getFullYear(), toDay.getMonth() + 1, 0);
        let tbCalendar = document.querySelector(".scriptCalendar > tbody");
        document.getElementById("calYear").innerText = toDay.getFullYear();
        document.getElementById("calMonth").innerText = autoLeftPad((toDay.getMonth() + 1), 2);
        while(tbCalendar.rows.length > 0) {
            tbCalendar.deleteRow(tbCalendar.rows.length - 1);
        }
        let row = tbCalendar.insertRow();
        let dom = 1;
        let daysLength = (Math.ceil((doMonth.getDay() + lastDate.getDate()) / 7) * 7) - doMonth.getDay();
        for(let day = 1 - doMonth.getDay(); daysLength >= day; day++) {
            let column = row.insertCell();
            if(Math.sign(day) == 1 && lastDate.getDate() >= day) {
                column.innerText = autoLeftPad(day, 2);
                if(dom % 7 == 1) {
                    column.style.color = "#FF4D4D";
                }
                if(dom % 7 == 0) {
                    column.style.color = "#4D4DFF";
                    row = tbCalendar.insertRow();
                }

            }
            else {
                let exceptDay = new Date(doMonth.getFullYear(), doMonth.getMonth(), day);
                column.innerText = autoLeftPad(exceptDay.getDate(), 2);
                column.style.color = "#A9A9A9";
            }
            if(toDay.getFullYear() == nowDate.getFullYear()) {
                if(toDay.getMonth() == nowDate.getMonth()) {
                    if(nowDate.getDate() > day && Math.sign(day) == 1) {
                        column.style.backgroundColor = "#E5E5E5";
                    }
                    else if(nowDate.getDate() < day && lastDate.getDate() >= day) {
                        column.style.backgroundColor = "#FFFFFF";
                        column.style.cursor = "pointer";
                        column.onclick = function(){ calendarChoiceDay(this); }
                    }
                    else if(nowDate.getDate() == day) {
                        column.style.backgroundColor = "#FFFFE6";
                        column.style.cursor = "pointer";
                        column.onclick = function(){ calendarChoiceDay(this); }
                    }
                } else if(toDay.getMonth() < nowDate.getMonth()) {
                    if(Math.sign(day) == 1 && day <= lastDate.getDate()) {
                        column.style.backgroundColor = "#E5E5E5";
                    }
                }
                else {
                    if(Math.sign(day) == 1 && day <= lastDate.getDate()) {
                        column.style.backgroundColor = "#FFFFFF";
                        column.style.cursor = "pointer";
                        column.onclick = function(){ calendarChoiceDay(this); }
                    }
                }
            }
            else if(toDay.getFullYear() < nowDate.getFullYear()) {
                if(Math.sign(day) == 1 && day <= lastDate.getDate()) {
                    column.style.backgroundColor = "#E5E5E5";
                }
            }
            else {
                if(Math.sign(day) == 1 && day <= lastDate.getDate()) {
                    column.style.backgroundColor = "#FFFFFF";
                    column.style.cursor = "pointer";
                    column.onclick = function(){ calendarChoiceDay(this); }
                }
            }
            dom++;
        }
    }
    function calendarChoiceDay(column) {
      var choiceDay = document.querySelector(".choiceDay");
        if (choiceDay) {
          choiceDay.classList.remove("choiceDay");
          choiceDay.style.backgroundColor = "#FFF";
          choiceDay.style.borderRadius = "0";
          choiceDay.style.color = ""; 
        }
        column.classList.add("choiceDay");
        column.style.backgroundColor = "#000";
        column.style.borderRadius = "50%";
        column.style.color = "#fff";
      }
    function autoLeftPad(num, digit) {
        if(String(num).length < digit) {
            num = new Array(digit - String(num).length + 1).join("0") + num;
        }
        return num;
    }

    const tabList = document.querySelectorAll('.common_tab_list .common_tab_item button');
  const contents = document.querySelectorAll('#detail_tabcontent .section_detail')
  let activeCont = ''; // 현재 활성화 된 컨텐츠 (기본:#tab1 활성화)

  for(var i = 0; i < tabList.length; i++){
    tabList[i].querySelector('.common_tab_btn').addEventListener('click', function(e){
      e.preventDefault();
      for(var j = 0; j < tabList.length; j++){
        // 나머지 버튼 클래스 제거
        tabList[j].classList.remove('common_tab_item');

        // 나머지 컨텐츠 display:none 처리
        contents[j].style.display = 'none';
      }

      // 버튼 관련 이벤트
      this.parentNode.classList.add('common_tab_item');

      // 버튼 클릭시 컨텐츠 전환
      activeCont = this.getAttribute('button');
      document.querySelector(activeCont).style.display = 'block';
    });
  }
  
 
  
 