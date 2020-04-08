<template>
  <div id="bHeader">
    <header>
      <nav class="navbar is-fixed-top" role="navigation" aria-label="main navigation">
        <div class="navbar-brand">
          <div class="left-side">
            <i class="fas fa-bars"></i>
            <input placeholder="Fast Search" class="input input-search">
          </div>
          <div class="right-side">
            <div class="item is-size-5">
              <a href="#">
                <i class="fas fa-cog"></i>
              </a>
            </div>
            <div class="item is-size-5">
              <a href="#">
                <i class="fas fa-bell"></i>
              </a>
            </div>
            <div class="item is-size-5">
              <a href="">
                <i class="fas fa-chart-line"></i>
                <span class="is-size-6">
                  0/5
                </span>
              </a>
            </div>
            <div class="item is-size-5">
              <a href="#">
                <i class="fas fa-plus"></i>
              </a>
            </div>
          </div>
        </div>
      </nav>
    </header>
  </div>
</template>

<script>
  export default {
    data: function () {
      return {
      }
    }
  }
</script>

