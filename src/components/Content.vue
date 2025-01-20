<template>
    <main class="blog-content">
        <!-- Example Blog Post with Image Grid -->        
        <Discipline />

        <!-- Box to display on hover -->
        <div id="infoBox" class="info-box">
            <h4 id="infoBoxTitle"></h4>
        </div>

        <!-- Example Blog Post with Image Grid -->        
        <ImageGrid />
        
        <!-- Example Blog Post with Text -->
        <About />
        
        <!-- Example Blog Post with Special HTML Content -->
        <Music />
    </main>
</template>

<script>
import Discipline from './Discipline.vue';
import About from './About.vue';
import ImageGrid from './ImageGrid.vue';
import Music from './Music.vue';

export default {
  name: 'MyContent',
  components: {
    Discipline,
    About,
    ImageGrid,
    Music,
  },
};
</script>

<style>
/* Blog Content Area */
.blog-content {
    display: flex;
    flex-direction: column;
    /* gap: 30px; */
    min-width: 640px;
    max-width: 860px;
    margin:  auto;
    padding: 20px;
    background-color: #fff;
}

.blog-post {
    padding: 20px;
    border-bottom: 1px solid #ddd;
    color: #333;
}

.blog-post h2 {
    margin: 10px;
    font-size: 1.8rem;
    font-family: 'Times New Roman', Times, serif;
    font-weight: bold;
}

.blog-post p {
    font-size: 1.1rem;
    margin-bottom: 15px;
}

.blog-post img {
    width: 100%;
    height: auto;
    margin-bottom: 15px;
    border: 1px solid #ccc;
}

.discipline-container {
    margin-bottom: 10px;
}

.discipline-header {
    display: flex;
    align-items: center;
    justify-content: space-between; /* Aligns h3 to the left and button to the right */
    margin-bottom: 5px;
}

.align-right {
    padding: 3px 10px; /* Compact padding */
    font-size: 0.8rem; /* Smaller font size */
    font-family: Arial, sans-serif;
    text-transform: uppercase;
    color: #333;
    background-color: transparent;
    border: 1px solid #333;
    border-radius: 3px;
    cursor: pointer;
    transition: background-color 0.3s, color 0.3s;
}

.align-right:hover {
    background-color: #333;
    color: #fff;
}

/* Image Grid Styles */
.image-grid {
    display: grid;
    grid-template-columns: repeat(3, 1fr); /* 3 columns */
    grid-template-rows: repeat(2, auto);   /* 2 rows */
    gap: 10px;
    margin-top: 10px;
}

.image-grid img {
    width: 100%;
    height: auto;
    border: 1px solid #ccc;
    border-radius: 5px;
}
</style>