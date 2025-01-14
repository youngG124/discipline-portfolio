<template>
    <nav class="menu-bar">
        <a href="index.html">Home</a>
        <a href="about.html">About</a>
        <a href="images.html">Image</a>
        <a href="discipline.html">Discipline</a>
    </nav>
</template>
  
<script>
    export default {
        name: 'MenuBar',
    };
</script>

<style>
/* Menu Bar */
.menu-bar {
    min-width: 640px;
    max-width: 860px; /* Set the maximum width */
    display: flex;
    justify-content: flex-start;
    background-color: #333;
    padding-left: 20px;
    border-bottom: 2px solid #222;
    margin: 0 auto; /* Center the menu bar */
}

.menu-bar a {
    color: #eee;
    padding: 15px 25px;
    text-decoration: none;
    font-size: 1rem;
    font-family: Arial, sans-serif;
    transition: background-color 0.3s ease;
}

.menu-bar a:hover {
    background-color: #444;
}
</style>