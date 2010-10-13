$(document).ready(functin() {
  hostname = window.location.hostname
  $("a[href^=http]")
      .not("a[hre*='"+hostname+"']")
      .addClass('link external')
      .attr('target', '_blank');
});
