<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<!DOCTYPE html>
<html lang="en">
<head>
  <title>AboutUs Page</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <link href="https://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet" type="text/css">
  <link href="https://fonts.googleapis.com/css?family=Lato" rel="stylesheet" type="text/css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  <style>
  body {
    font: 400 15px Lato, sans-serif;
    line-height: 1.5;
    color: #818181;
  }
  h2, h4 {
    color: #303030;
  }
  h2 {
    font-size: 24px;
    text-transform: uppercase;
    font-weight: 600;
    margin-bottom: 30px;
  }
  h4 {
    font-size: 19px;
    line-height: 1.375em;
    font-weight: 400;
    margin-bottom: 30px;
  }
  .jumbotron {
    background-color: rgb(25, 40, 89);
    color: #fff;
    padding: 50px 25px;
    font-family: Montserrat, sans-serif;
  }
  .container-fluid {
    padding: 30px 30px;
  }
  .bg-grey {
    background-color: #f6f6f6;
  }
  .logo {
    color: rgb(224, 25, 51);
    font-size: 200px;
  }
  .carousel-control.right, .carousel-control.left {
    background-image: none;
    color: rgb(224, 25, 51);
  }
  .carousel-indicators li {
    border-color: rgb(224, 25, 51);
  }
  .carousel-indicators li.active {
    background-color: rgb(224, 25, 51);
  }
  .item h4 {
    font-size: 19px;
    line-height: 1.375em;
    font-weight: 400;
    font-style: italic;
    margin: 70px 0;
  }
  .panel {
    border: 1px solid rgb(25, 40, 89); 
    border-radius: 0 !important;
    transition: box-shadow 0.5s;
  }
  .panel:hover {
    box-shadow: 5px 0px 40px rgba(0,0,0, 0.2);
  }
  .panel-footer .btn:hover {
    border: 1px solid rgb(25, 40, 89);
    background-color: #fff !important;
    color: rgb(25, 40, 89);
  }
  .panel-heading {
    color: #fff !important;
    background-color: rgb(25, 40, 89) !important;
    padding: 25px;
  }
  .panel-footer .btn {
    margin: 15px 0;
    background-color: rgb(25, 40, 89);
    color: #fff;
  }
  .navbar {
    margin-bottom: 0;
    background-color: rgb(25, 40, 89);
    z-index: 9999;
    border: 0;
    font-size: 12px !important;
    line-height: 1.42857143 !important;
    letter-spacing: 4px;
    border-radius: 0;
    font-family: Montserrat, sans-serif;
  }
  .navbar li a, .navbar .navbar-brand {
    color: #fff !important;
  }
  .navbar-nav li a:hover, .navbar-nav li.active a {
    color: rgb(25, 40, 89) !important;
    background-color: #fff !important;
  }
  .navbar-default .navbar-toggle {
    border-color: transparent;
    color: #fff !important;
  }
  footer {
    background-color: rgb(25, 40, 89);
    padding: 25px;
  }
  footer .glyphicon {
    font-size: 20px;
    margin-bottom: 10px;
    color: rgb(224, 25, 51);
  }
  </style>
</head>
<body id="myPage" data-spy="scroll" data-target=".navbar" data-offset="60">

<nav class="navbar navbar-default navbar-fixed-top">
  <div class="container">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>                        
      </button>
    </div>
    <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav navbar-right">
        <li><a href="/index">HOME</a></li>
        <li><a href="#about">ABOUT</a></li>
        <li><a href="#portfolio">PORTFOLIO</a></li>
        <li><a href="#contact">CONTACT</a></li>
      </ul>
    </div>
  </div>
</nav>

<div class="jumbotron text-center">
  <h1>Flight Management System</h1> 
  <p>We specialize in flying you</p> 
</div>

<!-- Container (About Section) -->
<div id="about" class="container-fluid bg-grey">
    <div class="row">
      <div class="col-sm-4">
        <span class="glyphicon glyphicon-signal logo"></span>
      </div>
      <div class="col-sm-8">
        <h2>About Company Page</h2><br>
        <p>Our company has been at the forefront of the industry for over a decade, delivering top-notch services and products to our clients worldwide. We pride ourselves on our commitment to excellence, innovation, and customer satisfaction. Our dedicated team of professionals works tirelessly to ensure that we meet and exceed the expectations of our clients.</p>
        <p>We believe in fostering a culture of continuous improvement and innovation. By staying ahead of industry trends and embracing new technologies, we are able to provide our clients with cutting-edge solutions that drive their success. Our core values of integrity, respect, and excellence guide everything we do, ensuring that we build strong, lasting relationships with our clients and partners.</p>
      </div>
    </div>
  </div>
  
  <div class="container-fluid bg-grey">
    <div class="row">
      <div class="col-sm-4">
        <span class="glyphicon glyphicon-globe logo"></span>
      </div>
      <div class="col-sm-8">
        <h2>Our Values</h2><br>
        <h4><strong>MISSION:</strong> Our mission is to deliver exceptional value to our customers through innovative solutions and unparalleled service. We strive to achieve excellence in every aspect of our business, from product development to customer support, ensuring that we meet and exceed our clients' expectations.</h4><br>
        <h4><strong>VISION:</strong> Our vision is to be a global leader in our industry, recognized for our commitment to quality, innovation, and customer satisfaction. We aim to create a sustainable future by continuously improving our processes, embracing new technologies, and fostering a culture of excellence and collaboration. By doing so, we aspire to make a positive impact on our clients, our employees, and the communities we serve.</h4>
      </div>
    </div>
  </div>  

<!-- Container (Portfolio Section) -->
<div id="portfolio" class="container-fluid text-center bg-grey">
  <h2>Portfolio</h2>
  <div class="row text-center" style="display: flex; justify-content: center;">
    <div class="col-sm-4">
      <div class="thumbnail">
        <img src="/images/profile2.png" alt="Profile" width="400" height="300">
        <p><strong>info Flight</strong></p>
        <p>Aspiring Java Developers</p>
      </div>
    </div>
  </div>
  <h2>What our customers say</h2>
  <div id="myCarousel" class="carousel slide text-center" data-ride="carousel">
    <!-- Indicators -->
    <ol class="carousel-indicators">
      <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
      <li data-target="#myCarousel" data-slide-to="1"></li>
      <li data-target="#myCarousel" data-slide-to="2"></li>
    </ol>

    <!-- Wrapper for slides -->
    <div class="carousel-inner" role="listbox">
      <div class="item active">
        <h4>"This company is the best. I am so happy with the result!"<br><span>Michael Roe, Vice President, Comment Box</span></h4>
      </div>
      <div class="item">
        <h4>"One word... WOW!!"<br><span>John Doe, Salesman, Rep Inc</span></h4>
      </div>
      <div class="item">
        <h4>"Could I... BE any more happy with this company?"<br><span>Chandler Bing, Actor, FriendsAlot</span></h4>
      </div>
    </div>

    <!-- Left and right controls -->
    <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
      <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
      <span class="sr-only">Previous</span>
    </a>
    <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
      <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
      <span class="sr-only">Next</span>
    </a>
  </div>
</div>

<!-- Container (Contact Section) -->
<div id="contact" class="container-fluid bg-grey">
  <h2 class="text-center">CONTACT</h2>
  <div class="row">
    <div class="col-sm-5">
      <p>Contact us and we'll get back to you within 24 hours.</p>
      <p><span class="glyphicon glyphicon-map-marker"></span> Bengaluru, INDIA</p>
      <p><span class="glyphicon glyphicon-phone"></span> +00 1010101010</p>
      <p><span class="glyphicon glyphicon-envelope"></span> myemail@something.com</p>
    </div>

    <form action="/about" method="post">
    <div class="col-sm-7">
      <div class="row">
        <div class="col-sm-6 form-group">
          <input class="form-control" id="name" name="name" placeholder="Name" type="text" required>
        </div>
        <div class="col-sm-6 form-group">
          <input class="form-control" id="email" name="email" placeholder="Email" type="email" required>
        </div>
      </div>
      <textarea class="form-control" id="comment" name="comment" placeholder="Comment" rows="5"></textarea><br>
      <div class="row">
        <div class="col-sm-12 form-group">
          <button class="btn btn-default pull-right" type="submit">Send</button>
        </div>
      </div>
    </div>
    </form>
  </div>
</div>

<footer class="container-fluid text-center">
  <a href="#myPage" title="To Top">
    <span class="glyphicon glyphicon-chevron-up"></span>
  </a>
</footer>

<script>
$(document).ready(function(){
  // Smooth scrolling for navbar and footer links
  $(".navbar a, footer a[href='#myPage']").on('click', function(event) {
    if (this.hash !== "") {
      event.preventDefault();
      var hash = this.hash;
      $('html, body').animate({
        scrollTop: $(hash).offset().top
      }, 900, function(){
        window.location.hash = hash;
      });
    }
  });
});
</script>

</body>
</html>