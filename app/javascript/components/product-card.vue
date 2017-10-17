<template>
  <div id="product-card">
    <md-card>
      <md-card-media>
        <img :src='image' :alt='seo'>
      </md-card-media>
      <md-card-header>
        <div class="md-title">{{ title }}</div>
        <div class="md-subhead">{{ price }}</div>
      </md-card-header>
      <md-card-content>{{ desc }}</md-card-content>
      <md-card-actions>
        <md-button class="" :href='view'>{{viewmore}}</md-button>
        <md-button class="md-warn" :href='shop'>{{buynow}}</md-button>
      </md-card-actions>
    </md-card>
  </div>
</template>

<script>
  export default {
    props: ['title','price','desc','image','seo','view','shop'],
    data: function () {
      return {
        buynow: "Mua ngay",
        viewmore: 'Xem thêm'
      }
    }
  }
</script>

<style>
  #product-card {
    margin-top: 16px;
  }
</style>