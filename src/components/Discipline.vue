<template>
  <div class="blog-post">
    <div class="Discipline">
      <h2>Disciplines</h2>
      <div id="discipline" class="discipline-container">
        <div class="discipline-header">
          <h3>Run</h3>
          <button @click="recordToday('run')">Record Today</button>
        </div>
        <div id="annual_calendar_1"></div>
      </div>
      <div id="discipline" class="discipline-container">
        <div class="discipline-header">
          <h3>Read</h3>
          <button @click="recordToday('read')">Record Today</button>
        </div>
        <div id="annual_calendar_2"></div>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  name : 'MyDiscipline',
  data() {
    return {
      dayIndex: new Date().getDay() + 1,
      originalDisciplineRecord: [0, 1, 1, 1], // Example record from the database
      defaultDisciplineRecord: Array(364).fill(0), // Default empty record
    };
  },
  mounted() {
    this.createCalendar("annual_calendar_1");
    this.createCalendar("annual_calendar_2");
  },
  methods: {
  createRow(recordType, dayNumber) {
    const row = document.createElement("td");
    let styleString = "width:15px; height:10px; border-radius:2px; background-color:";
    styleString += recordType === 1 ? "green;" : "lightgrey;";

    const today = new Date();
    const dayDataString = "date: " + this.subtractDays(today, 363 + this.dayIndex - dayNumber);

    row.setAttribute("date", dayDataString);
    row.className = "day";
    row.style = styleString;
    row.id = dayNumber;

    return row;
  },
  createCalendar(elementId) {
    const today = new Date();
    const dayIndex = today.getDay();

    const tbody = document.createElement("table");
    tbody.style = "border-spacing:4px;";

    const dayNames = ["mon", "tue", "wed", "thu", "fri", "sat", "sun"];
    const week_arr = Array.from({ length: 52 }, (_, i) => i);
    const day_arr = [];
    
    const originalDisciplineRecord = [0, 1, 0, 1]; // get this from database
    const defaultDisciplineRecord = [];
    let disciplineRecord;

    // 기본 설정
    for (let i = 0; i < 364; i++) {
      defaultDisciplineRecord.push(0);
    }
    for (let i = 0; i < dayIndex; i++) {
      defaultDisciplineRecord.push(0);
    }

    // 기본 설정 날보다 작다면
    if (originalDisciplineRecord.length < defaultDisciplineRecord.length) {
      // 저장 된 날 만큼 pop 후 data를 채우기
      for (let i = 0; i < originalDisciplineRecord.length; i++) {
        defaultDisciplineRecord.pop();
      }
      disciplineRecord = defaultDisciplineRecord.concat(originalDisciplineRecord);
    } else {
      // discipline 
    }

    dayNames.forEach((dayName) => {
      let day = document.createElement('tr'); // Create a new row element
      day.className = dayName; // Optionally add a class with the day's name
      day_arr.push(day); // Add the created row to the array
    });

    day_arr.forEach((day) => {
      tbody.appendChild(day);
    });

    let dayNumber = 0;
    week_arr.forEach(() => {
      day_arr.forEach((day) => {
        const row = this.createRow(disciplineRecord[dayNumber], dayNumber); // Use `this` correctly here
        dayNumber++;
        day.appendChild(row);
      });
    });

    // 마지막 주는 요일에 대해 동적으로 처리
    dayNumber = 365;
    day_arr.forEach((day, index) => {
      if (index < dayIndex) {
        const row = this.createRow(disciplineRecord[dayNumber], dayNumber); // Again, `this` is used correctly
        dayNumber++;
        day.appendChild(row);
      }
    });

    document.getElementById(elementId).appendChild(tbody);
  },
  subtractDays(date, days) {
    const result = new Date(date);
    result.setDate(result.getDate() - days);
    return result.toDateString();
  },
  getDisciplineRecord() {
    const disciplineRecord = [...this.defaultDisciplineRecord];
    const additionalRecords = this.originalDisciplineRecord;

    if (additionalRecords.length < disciplineRecord.length) {
      disciplineRecord.splice(-additionalRecords.length, additionalRecords.length, ...additionalRecords);
    }

    console.log(disciplineRecord);

    return disciplineRecord;
  },
  recordToday(activity) {
    alert(`Recording activity for today: ${activity}`);
    // Add functionality to update the record for the current day
  },
},
};
</script>
  
<style>

.day {
  position:relative;
}

.day:hover::after {
  content: attr(date);
  position: absolute;
  top: -25px;
  left: 50%;
  transform: translateX(-50%);
  background-color: black;
  color: white;
  padding: 5px;
  border-radius: 3px;
  font-size: 10px;
  white-space: nowrap;
  z-index: 10;
}
</style>  