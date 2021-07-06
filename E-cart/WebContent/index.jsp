<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>E-cart</title>
<script src="Js/main.js" type=module></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<style type="text/css">

 .card-img-top {
    height: 286px;
    width: 286px;
  }

  .cardhover {
    background-color: var(--teal);
  }	
</style>

</head>
<body>
<header-h></header-h>
<div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
  <ol class="carousel-indicators">
    <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
    <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
    <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
  </ol>
  <div class="carousel-inner">
    <div class="carousel-item active">
      <img class="d-block w-100" src="https://blog.hubspot.com/hubfs/GettyImages-1165073587.jpg" alt="First slide">
    </div>
    <div class="carousel-item">
      <img class="d-block w-100" src="https://www.selleractive.com/hubfs/Ecommerce%20Tools%201.png" alt="Second slide">
    </div>
    <div class="carousel-item">
      <img class="d-block w-100" src="https://salestechstar.com/wp-content/uploads/2021/02/STS-PARTNERSHIP_3.jpg" alt="Third slide">
    </div>
  </div>
  <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
    <span class="sr-only">Previous</span>
  </a>
  <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
    <span class="carousel-control-next-icon" aria-hidden="true"></span>
    <span class="sr-only">Next</span>
  </a>
</div>

<br>
<center><h2>Popular products</h2></center>
<div class="row">
  
  <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12 p-4 pl-3">
    <div class="card" style="width: 18rem;">
      <img class="card-img-top img-thumbnail" src="https://i.guim.co.uk/img/media/d305370075686a053b46f5c0e6384e32b3c00f97/0_50_5231_3138/master/5231.jpg?width=1200&height=1200&quality=85&auto=format&fit=crop&s=878208abf6d919b7ca9948a523d9ff4e" alt="Books">
      <div class="card-body">
        <h5 class="card-title">Books</h5>
        <p class="card-text">Collection of used books </p>
        
      </div>
    </div>
  </div>
  <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12 p-4 pl-3">
    <div class="card" style="width: 18rem;">
      <img class="card-img-top img-thumbnail" src="https://static01.nyt.com/images/2019/09/25/world/25cli-clothes-still-promo/25cli-clothes-still-promo-videoSixteenByNineJumbo1600-v3.jpg" alt="Clothing">
      <div class="card-body">
        <h5 class="card-title">Clothing</h5>
        <p class="card-text">Hand-made cloth</p>
        
      </div>
    </div>
  </div>
  
  <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12 p-4 pl-3">
    <div class="card" style="width: 18rem;">
      <img class="card-img-top img-thumbnail" src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR4yXMvRg_ptwxMhuiWLTxvtp0ybCgE-tKhEQQVxou80PxYeQjw_DoACsxZiR2Ev8nKGk8&usqp=CAU" alt="Cosmetics">
      <div class="card-body">
        <h5 class="card-title">Cosmetics</h5>
        <p class="card-text">Home made ayurvedic products</p>
      </div>
    </div>
  </div>
 


  <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12 p-4 pl-3">
    <div class="card" style="width: 18rem;">
      <img class="card-img-top img-thumbnail" src="https://images-eu.ssl-images-amazon.com/images/I/31NAQirJ%2BsL._SY300_SX300_QL70_FMwebp_.jpg" alt="Miscellaneous accessories">
      <div class="card-body">
        <h5 class="card-title">Miscellaneous Accessories</h5>
        <p class="card-text">Possibly everything you need everyday</p>
      </div>
    </div>
  </div>
  
  
  
</div>



<footer-f></footer-f>

<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>


<script type="text/javascript">
  const hovered = document.getElementsByClassName("card");
  
  for(let i=0;i<hovered.length;i++) {
    hovered[i].addEventListener("mouseover", function(e) {
      hovered[i].classList.toggle("cardhover");
    })
    hovered[i].addEventListener("mouseout", function(e) {
      hovered[i].classList.toggle("cardhover");
    })
  }
</script>


</body>
</html>