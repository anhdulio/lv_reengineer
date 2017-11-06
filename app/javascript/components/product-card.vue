<template>
  <div id="product-card">
    <md-card>
      <md-card-media>
        <img :src='image' :alt='seo'>
      </md-card-media>
      <md-card-header>
        <div class="md-title">{{ title }}</div>
        <div class="md-subhead">
          <span class="oldprice">{{ price }}</span>
          <span class="newprice">{{ saleprice }}</span>
        </div>
      </md-card-header>
      <md-card-content>{{ desc }}</md-card-content>
      <md-card-actions>
        <md-button :href='view'>{{viewmore}}</md-button>
        <md-button class="md-warn" :href='shop' :onclick='buygcc'>{{buynow}}</md-button>
      </md-card-actions>
    </md-card>
  </div>
</template>

<script>
  export default {
    props: ['title','price','saleprice','desc','image','seo','view','shop'],
    data: function () {
      return {
        buynow: "Mua ngay",
        viewmore: 'Xem thêm'
      }
    },
    computed: {
      buygcc: function () {
        return "return gtag_report_conversion_buygcc('" + this.shop + "');"
      }
    }
  }
</script>

<style>
  #product-card {
    margin-top: 16px;
  }
  .oldprice {
    text-decoration: line-through;
  }
  .newprice {
    color: #ff5722;
  }
</style>