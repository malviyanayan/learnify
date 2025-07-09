<%@ page import="models.User" %>
<% User user=(User)session.getAttribute("user"); %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Payment Gateway</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome Icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        .payment-card {
            border-radius: 20px;
            box-shadow: 0 10px 30px rgba(0,0,0,0.1);
            transition: all 0.3s ease;
        }
        
        .payment-option {
            cursor: pointer;
            border: 2px solid transparent;
            transition: all 0.3s ease;
        }
        
        .payment-option.active {
            border-color: #0d6efd;
            background-color: #f8f9fa;
        }
        
        .payment-form {
            display: none;
        }
        
        .payment-form.active {
            display: block;
        }
        
        .card-icon {
            font-size: 2rem;
            color: #6c757d;
        }
        
        .form-control:focus {
            box-shadow: none;
            border-color: #0d6efd;
        }
    </style>
</head>
<body class="bg-light">

    <%@ include file="navbar.jsp" %>

    <div class="container py-5" style="margin-top: 50px;">
        <div class="row justify-content-center">
            <div class="col-lg-8">
                <div class="payment-card bg-white p-4 mb-4">
                    <h3 class="mb-4 fw-bold">Payment Details</h3>
                    <div class="d-flex justify-content-between mb-4">
                        <div>
                            <span class="text-muted">Payment ID:</span>
                            <strong>#${transectionId}</strong>
                        </div>
                        <div>
                            <span class="text-muted">Amount:</span>
                            <strong class="text-success">&#8377; ${amount}</strong>
                        </div>
                    </div>
                    
                    <div class="row g-4">
                        <!-- Payment Options -->
                        <div class="col-md-6">
                            <div class="payment-option active p-3 rounded-3 mb-3" onclick="showForm('card')">
                                <div class="d-flex align-items-center">
                                    <i class="fab fa-cc-visa card-icon me-3"></i>
                                    <div>
                                        <h5 class="mb-0">Credit/Debit Card</h5>
                                        <small class="text-muted">Visa, Mastercard, Rupay</small>
                                    </div>
                                </div>
                            </div>
                            
                            <div class="payment-option p-3 rounded-3" onclick="showForm('upi')">
                                <div class="d-flex align-items-center">
                                    <i class="fas fa-wallet card-icon me-3"></i>
                                    <div>
                                        <h5 class="mb-0">UPI Payment</h5>
                                        <small class="text-muted">GPay, PhonePe, Paytm</small>
                                    </div>
                                </div>
                            </div>
                        </div>
                        
                        <!-- Payment Forms -->
                        <div class="col-md-6">
                            <!-- Card Payment Form -->
                            <form id="cardForm" action="payment_confirm.do" method="post" class="payment-form active">
                                <input type="number" name="cart-id" value="${cartId}" class="d-none">
                                <input type="number" name="user-id" value="${user.userId}" class="d-none">
                                <div class="mb-3">
                                    <label class="form-label">Card Number</label>
                                    <input type="text" class="d-none" name="payment-type" value="card">
                                    <div class="input-group">
                                        <input type="text" name="cart-number" class="form-control" placeholder="1234 5678 9012 3456" required>
                                        <span class="input-group-text"><i class="fab fa-cc-visa"></i></span>
                                    </div>
                                </div>
                                
                                <div class="mb-3">
                                    <label class="form-label">Card Holder Name</label>
                                    <input type="text" name="card-holder-name" class="form-control" placeholder="John Doe" required>
                                </div>
                                
                                <div class="row g-2 mb-3">
                                    <div class="col-6">
                                        <label class="form-label">Expiry Date</label>
                                        <input type="text" name="expiry-date" class="form-control" placeholder="MM/YY" required>
                                    </div>
                                    <div class="col-6">
                                        <label class="form-label">CVV</label>
                                        <input type="password" name="cvv" class="form-control" placeholder="123" required>
                                    </div>
                                </div>
                                
                                <button type="submit" class="btn btn-primary w-100 py-2">
                                    <i class="fas fa-lock me-2"></i>Pay Now
                                </button>
                            </form>
                            
                            <!-- UPI Payment Form -->
                            <form id="upiForm" action="payment_confirm.do" method="post" class="payment-form">
                                <input type="text" name="payment-type" value="upi" class="d-none">
                                <input type="number" name="cart-id" value="${cartId}" class="d-none">
                                <input type="number" name="user-id" value="${user.userId}" class="d-none">
                                <div class="mb-3">
                                    <label class="form-label">UPI ID</label>
                                    <input type="text" class="form-control" placeholder="example@upi" required>
                                </div>
                                
                                <div class="mb-4">
                                    <p class="text-muted small">Popular UPI Apps:</p>
                                    <div class="d-flex gap-2">
                                        <button type="button" class="btn btn-outline-primary flex-fill">
                                            <i class="fab fa-google-pay"></i>
                                        </button>
                                        <button type="button" class="btn btn-outline-primary flex-fill">
                                            <i class="fas fa-wallet"></i>
                                        </button>
                                        <button type="button" class="btn btn-outline-primary flex-fill">
                                            <i class="fab fa-amazon-pay"></i>
                                        </button>
                                    </div>
                                </div>
                                
                                <button type="submit" class="btn btn-primary w-100 py-2">
                                    <i class="fas fa-check-circle me-2"></i>Verify & Pay
                                </button>
                            </form>
                        </div>
                    </div>
                </div>
                
                <div class="text-center text-muted small">
                    <i class="fas fa-lock me-2"></i>Secure payment processing
                </div>
            </div>
        </div>
    </div>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        function showForm(formType) {
            // Remove active class from all options
            document.querySelectorAll('.payment-option').forEach(option => {
                option.classList.remove('active');
            });
            
            // Add active class to selected option
            event.currentTarget.classList.add('active');
            
            // Hide all forms
            document.querySelectorAll('.payment-form').forEach(form => {
                form.classList.remove('active');
            });
            
            // Show selected form
            document.getElementById(formType + 'Form').classList.add('active');
        }
    </script>
</body>
</html>