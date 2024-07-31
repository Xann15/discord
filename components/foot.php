</div>
<script src="<?= BASEURL ?>/assets/js/bootstrap.bundle.min.js"></script>
<script>
    $(document).ready(function() {
        // Fungsi untuk mengirim permintaan ke server PHP
        function updateStatusActivity() {
            $.ajax({
                url: 'Controller/activityController/updateStatusActivity.php',
                type: 'POST',
                data: {
                    userId: $('#uid').val(),
                    status: 'online'
                },
                success: function(response) {
                    console.log('Status updated: ' + response);
                },
                error: function(jqXHR, textStatus, errorThrown) {
                    console.error('Error updating status: ' + textStatus);
                }
            });
        }

        function checkStatusActivity() {
            $.ajax({
                url: 'Controller/activityController/checkStatusActivity.php',
                type: 'POST',
                data: {
                    userId: $('#ppl').val(),
                },
                success: function(response) {
                    // Update the HTML element with the id 'status' with the response
                    $('#status').text(response);

                    // Update the class based on the response
                    if (response === 'online') {
                        $('#status').removeClass('text-danger').addClass('text-success');
                    } else {
                        $('#status').removeClass('text-success').addClass('text-danger');
                    }
                },
                error: function(jqXHR, textStatus, errorThrown) {
                    console.error('Error: ' + textStatus);
                }
            });
        }


        // Set interval to check status every 2 seconds
        setInterval(checkStatusActivity, 2000); // 2000 milliseconds = 2 seconds

        // Mengirim permintaan pertama saat halaman dimuat
        updateStatusActivity();

        // Mengatur interval untuk mengirim permintaan setiap 10 detik
        setInterval(updateStatusActivity, 2000); // 10000 milidetik = 10 detik
    });

    document.addEventListener("DOMContentLoaded", function(event) {

        function OTPInput() {
            const inputs = document.querySelectorAll('#otp > *[id]');
            for (let i = 0; i < inputs.length; i++) {
                inputs[i].addEventListener('keydown', function(event) {
                    if (event.key === "Backspace") {
                        inputs[i].value = '';
                        if (i !== 0) inputs[i - 1].focus();
                    } else {
                        if (i === inputs.length - 1 && inputs[i].value !== '') {
                            return true;
                        } else if (event.keyCode > 47 && event.keyCode < 58) {
                            inputs[i].value = event.key;
                            if (i !== inputs.length - 1) inputs[i + 1].focus();
                            event.preventDefault();
                        } else if (event.keyCode > 64 && event.keyCode < 91) {
                            inputs[i].value = String.fromCharCode(event.keyCode);
                            if (i !== inputs.length - 1) inputs[i + 1].focus();
                            event.preventDefault();
                        }
                    }
                });
            }
        }
        OTPInput();
    });
</script>
</body>

</html>