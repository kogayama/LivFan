
$(function() {
  $(document).on('turbolinks:load', () => {
    $('#host_host_profile_postal_code').jpostal({
      postcode : [
        '#host_host_profile_postal_code'
      ],
      address: {
        "#host_host_profile_prefecture_code": "%3", 
        "#host_host_profile_city"           : "%4%5",
        "#host_host_profile_street"         : "%6%7"
      }
    });
  });
});
// host_host_profile_attributes_postcode