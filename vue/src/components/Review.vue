<template>
<h3>Reviews</h3>
<section class="reviews">
 <p>{{ item.title }}</p>
 <p>{{ item.description }}</p>
 <p>{{ item.rating }}</p>
 
</section>
</template>

<script>
export default {
    name: "review",
    props: ["item"]
}


</script>