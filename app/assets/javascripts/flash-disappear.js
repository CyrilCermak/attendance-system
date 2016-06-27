/**
 * Created by cyril on 25/06/16.
 */

$(document).ready(function () {
    setTimeout(function () {
        $('#flash').fadeOut(300, function () {
            $this.remove()
        });
    }, 3000);
})

