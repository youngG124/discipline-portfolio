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
      originalDisciplineRecord: [0, 1, 0, 1], // Example record from the database
      defaultDisciplineRecord: Array(364).fill(0), // Default empty record
    };
  },
  mounted() {
    this.createCalendar("annual_calendar_1");
    this.createCalendar("annual_calendar_2");
  },
  methods: {
    createCalendar(elementId) {
      const tbody = document.createElement("table");
      tbody.style = "border-spacing:4px;";

      const dayNames = ["mon", "tue", "wed", "thu", "fri", "sat", "sun"];
      const week_arr = Array.from({ length: 52 }, (_, i) => i);
      const disciplineRecord = this.getDisciplineRecord();

      const day_arr = dayNames.map((dayName) => {
        const day = document.createElement("tr");
        day.className = dayName;
        return day;
      });

      day_arr.forEach((day) => {
        tbody.appendChild(day);
      });

      let dayNumber = 0;
      week_arr.forEach(() => {
        day_arr.forEach((day) => {
          const row = this.createRow(disciplineRecord[dayNumber], dayNumber);
          dayNumber++;
          day.appendChild(row);
        });
      });

      dayNumber = 364;
      day_arr.forEach((day, index) => {
        if (index < this.dayIndex) {
          const row = this.createRow(disciplineRecord[dayNumber], dayNumber);
          dayNumber++;
          day.appendChild(row);
        }
      });

      document.getElementById(elementId).appendChild(tbody);
    },
    createRow(recordType, dayNumber) {
      const row = document.createElement("td");
      let styleString = "width:15px; height:10px; border-radius:2px;";
      styleString += recordType === 1 ? "background-color:green;" : "background-color:lightgrey;";

      const today = new Date();
      const dayDataString = "date: " + this.subtractDays(today, 363 + this.dayIndex - dayNumber);

      row.setAttribute("data-info", dayDataString);
      row.className = "day";
      row.style = styleString;
      row.id = dayNumber;

      return row;
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
  content: attr(data-info);
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