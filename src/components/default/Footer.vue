<template>
    <footer class="footer">
        <p>Contact me at: <a href="mailto:newyoung124@naver.com">newyoung124@naver.com</a></p>
        <p>"Everyday is important day"</p>
    </footer>
</template>

<script>
export default {
  name: 'MyFooter',
};
</script>

<style>
/* Footer */
.footer {
    min-width:640px;
    max-width: 860px; /* Set the maximum width */
    background-color: #333;
    color: #eee;
    text-align: center;
    padding: 10px;
    font-size: 0.9rem;
    font-family: Arial, sans-serif;
    margin: 0 auto; /* Center the menu bar */
}

.footer p {
    margin: 5px 0;
}

.footer a {
    color: #ffb3b3;
    text-decoration: none;
}

.footer a:hover {
    text-decoration: underline;
}
</style>