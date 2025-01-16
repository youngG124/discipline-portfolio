<template>
    <div class="blog-post">
        <div class="Discipline">
            <h2>Disciplines</h2>
            <br>
            <div id="discipline" class="discipline-container">
                <div class="discipline-header">
                    <h3>run</h3>
                    <button class="align-right">record today</button>
                </div>
                <div id="annual_calendar_1"></div>
            </div>
            <br>
            <div id="discipline" class="discipline-container">
                <div class="discipline-header">
                    <h3>read</h3>
                    <button class="align-right">record today</button>
                </div>
                <div id="annual_calendar_2"></div>
            </div>
        </div>
    </div>    
</template>

<script>
export default {
    name: 'MyDiscipline',
};

console.log("console.log test");

// const disciplineList = [data1, data2, data3, andOrSo, "..."];
// we need to make annual calendar via this list
// and get annual data with the discipline name from DB
// and paint the calendar green with the data
/*
const today = new Date();
const dayIndex = today.getDay() + 1;

console.log("dayIndex : " + dayIndex);

function createCalendar(elementId) {   const tbody = document.createElement('table');
    tbody.style = 'border-spacing:4px;';
}


createCalendar('annual_calendar_1')
createCalendar('annual_calendar_2')

    const week_arr = [];

    // add just 52 week, and add additional days at last
    for(let i=0; i<52; i++) {
        week_arr.push(i);
    }

    const dayNames = ['mon', 'tue', 'wed', 'thu', 'fri', 'sat', 'sun'];
    const day_arr = [];

    const originalDisciplineRecord = [0, 1, 0, 1]; // get this from database
    const defaultDisciplineRecord = [];

    let disciplineRecord;

    // 기본 설정
    for(let i=0; i<364; i++) {
        defaultDisciplineRecord.push(0);
    }
    for(let i=0; i<dayIndex; i++) {
        defaultDisciplineRecord.push(0);
    }
    // 기본 설정 날보다 작다면
    if(originalDisciplineRecord.length < defaultDisciplineRecord.length) {
        // 저장 된 날 만큼 pop 후 data를 채우기
        for(let i=0; i<originalDisciplineRecord.length; i++) {
            defaultDisciplineRecord.pop();
        }
        disciplineRecord = defaultDisciplineRecord.concat(originalDisciplineRecord);
    } else { // 기본 설정 일자 수 보다 크다면
        // discipline 
    }

    dayNames.forEach(dayName => {
        let day = document.createElement('tr'); // Create a new row element
        day.className = dayName; // Optionally add a class with the day's name
        day_arr.push(day); // Add the created row to the array
    });

    day_arr.forEach(function(day) {
        tbody.appendChild(day);
    });

    let dayNumber = 0;
    week_arr.forEach(function() {
        day_arr.forEach(function(day) {
            let row = createRow(disciplineRecord[dayNumber], dayNumber);
            dayNumber++;
            day.appendChild(row);
        });
    });

    // 마지막 주는 요일에 대해 동적으로 처리
    dayNumber = 364;
    day_arr.forEach(function(day, index) {
        if(index < dayIndex) {
            let row = createRow(disciplineRecord[dayNumber], dayNumber);
            dayNumber++;
            day.appendChild(row);
        }
    });

    document.getElementById(elementId).appendChild(tbody);
}

function createRow(recordType, dayNumber) {
    let row = document.createElement('td');
    let styleString = 'width:15px; height:10px; border-radius:2px;';
    if(recordType == 1) {
        styleString += 'background-Color:green;'
    } else {
        styleString += 'background-Color:lightgrey;'
    }

    // 마지막 주 직전 날이 day 363, 마지막 주에 추가 된 day 수가 dayIndex(목요일이면 4)
    // 둘의 합에서 dayNumber를 빼면 거슬러 가야 하는 날짜가 나옴. dayNumber가 0일 경우
    // 목요일이라면 today - 367(363에 4를 더함)을 한 날짜가 day 0.
    // 오늘을 구한다면 363 + dayIndex 가 dayNumber와 같으므로, 결국 today - 0 이므로 오늘이 됨.
    let day_data_string = "date : " + subtractDays(today, 363 + dayIndex - dayNumber);

    row.setAttribute('data-info', day_data_string);
    row.className = 'day';
    row.style = styleString;
    row.id = dayNumber;

    return row;
}

// Function to subtract days from a date
function subtractDays(date, days) {
    const result = new Date(date); // Create a copy of the date
    result.setDate(result.getDate() - days); // Subtract days
    return result.toDateString();
}*/

</script>



<style>
</style>