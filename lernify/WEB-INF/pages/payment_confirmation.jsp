<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Payment Confirmation</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <script src="https://kit.fontawesome.com/your-fontawesome-kit.js" crossorigin="anonymous"></script>
    <style>
        body {
            background-color: #f8f9fa;
        }
        .confirmation-box {
            max-width: 500px;
            background: #fff;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.1);
            text-align: center;
        }
        .success-icon {
            font-size: 60px;
            color: #28a745;
        }
    </style>
</head>
<body>
    <div class="container d-flex justify-content-center align-items-center vh-100">
        <div class="confirmation-box">
            <i class="fas fa-check-circle success-icon"></i>
            <h2 class="mt-3">Payment Confirmed!</h2>
            <p>Your payment has been successfully processed.</p>
            <hr>
            <p><strong>Transaction ID:</strong> #${transectionId}</p>
            <p><strong>Amount Paid:</strong> &#8377; ${amount}</p>
            <p><strong>Date:</strong> ${time}</p>
            <button class="btn btn-success mt-3" onclick="downloadReceipt()">
                <i class="fas fa-download"></i> Download Receipt
            </button>
        </div>
    </div>

    <script>
        function downloadReceipt() {
            alert("Downloading Receipt...");
            // Yaha par actual PDF generate karne ka logic add kar sakte ho
        }
    </script>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
