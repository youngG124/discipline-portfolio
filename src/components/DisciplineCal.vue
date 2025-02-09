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

<script setup>
import { ref, onMounted } from 'vue';
import axios from 'axios';

const dayIndex = ref(new Date().getDay() + 1);
const originalDisciplineRecord = ref([0, 1, 1, 1]); // Example record from the database
const defaultDisciplineRecord = ref(Array(364).fill(0)); // Default empty record

const createRow = (recordType, dayNumber) => {
  const row = document.createElement("td");
  let styleString = "width:15px; height:10px; border-radius:2px; background-color:";
  styleString += recordType === 1 ? "green;" : "lightgrey;";

  const today = new Date();
  const dayDataString = "date: " + subtractDays(today, 363 + dayIndex.value - dayNumber);

  row.setAttribute("date", dayDataString);
  row.className = "day";
  row.style = styleString;
  row.id = dayNumber;

  return row;
};

const createCalendar = (elementId) => {
  const today = new Date();
  const dayIndexValue = today.getDay();

  const tbody = document.createElement("table");
  tbody.style = "border-spacing:4px;";

  const dayNames = ["mon", "tue", "wed", "thu", "fri", "sat", "sun"];
  const week_arr = Array.from({ length: 52 }, (_, i) => i);
  const day_arr = [];
  let disciplineRecord = getDisciplineRecord();

  dayNames.forEach((dayName) => {
    let day = document.createElement("tr");
    day.className = dayName;
    day_arr.push(day);
  });

  day_arr.forEach((day) => tbody.appendChild(day));

  let dayNumber = 0;
  week_arr.forEach(() => {
    day_arr.forEach((day) => {
      const row = createRow(disciplineRecord[dayNumber], dayNumber);
      dayNumber++;
      day.appendChild(row);
    });
  });

  dayNumber = 365;
  day_arr.forEach((day, index) => {
    if (index < dayIndexValue) {
      const row = createRow(disciplineRecord[dayNumber], dayNumber);
      dayNumber++;
      day.appendChild(row);
    }
  });

  document.getElementById(elementId).appendChild(tbody);
};

const subtractDays = (date, days) => {
  const result = new Date(date);
  result.setDate(result.getDate() - days);
  return result.toDateString();
};

const getDisciplineRecord = () => {
  const disciplineRecord = [...defaultDisciplineRecord.value];
  const additionalRecords = originalDisciplineRecord.value;

  if (additionalRecords.length < disciplineRecord.length) {
    disciplineRecord.splice(-additionalRecords.length, additionalRecords.length, ...additionalRecords);
  }

  return disciplineRecord;
};

const recordToday = async (discipline) => {
  console.log(discipline);

  try {
    const response = await axios.post('http://15.164.146.64:3000/insert', {
      discipline: 'discipline_' + discipline,
      text : 'sample text from vue axios',
    }, {
      headers : {"Content-Type" : "application/json"},
    });
    console.log('server response : ', response.data.message);
  } catch (error) {
    console.error('error : ', error);
  }
};

onMounted(() => {
  createCalendar("annual_calendar_1");
  createCalendar("annual_calendar_2");
});
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