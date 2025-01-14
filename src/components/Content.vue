<template>
    <main class="blog-content">
        <!-- Example Blog Post with Text -->
        <div class="blog-post">
            <h2>This blog is...</h2>
            <p>
                For tracking disciplines, curating some of saved images.
                <br>Blog's server is on EC2(AWS), made of SpringBoot(Java),
                <br>Images are on local SSD and fastAPI(python) is serving it.
                <br>Visit 'about' and check more information.
                <br>You can contact me at: newyoung124@naver.com
            </p>
        </div>

        <!-- Example Blog Post with Image Grid -->
        <div class="blog-post">
            <MyDiscipline />
        </div>

        <!-- Box to display on hover -->
        <div id="infoBox" class="info-box">
            <h4 id="infoBoxTitle"></h4>
        </div>

        <!-- Example Blog Post with Image Grid -->
        <div class="blog-post">
            <h2>Images</h2>
            <div class="image-grid">
                <img src="https://via.placeholder.com/400x400" alt="Image 1">
                <img src="https://via.placeholder.com/400x400" alt="Image 2">
                <img src="https://via.placeholder.com/400x400" alt="Image 3">
                <img src="https://via.placeholder.com/400x400" alt="Image 4">
                <img src="https://via.placeholder.com/400x400" alt="Image 5">
                <img src="https://via.placeholder.com/400x400" alt="Image 6">
            </div>
        </div>

        <!-- Example Blog Post with Special HTML Content -->
        <div class="blog-post">
            <h2>Music</h2>
            <div class="video-container">
                <iframe 
                    width="560" 
                    height="315" 
                    src="https://www.youtube.com/embed/3uiUHvET_jg?si=BAYiqlXBfI_vJscw&autoplay=1&mute=1" 
                    title="YouTube video player" 
                    frameborder="0" 
                    allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" 
                    referrerpolicy="strict-origin-when-cross-origin" 
                    allowfullscreen>
                </iframe>
            </div>
        </div>
    </main>
</template>

<script>
import MyDiscipline from './Discipline.vue';

export default {
  name: 'MyContent',
  components: {
    MyDiscipline,
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