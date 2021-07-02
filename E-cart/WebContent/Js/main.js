
class Header extends HTMLElement {
	
  connectedCallback() {
	  
    this.innerHTML = `<nav class="navbar navbar-expand-lg navbar-light bg-light">
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarToggler" aria-controls="navbarTogglerDemo03" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>
  <a class="navbar-brand">E-cart</a>

  <div class="collapse navbar-collapse" id="navbarToggler">
    <ul class="navbar-nav mr-auto mt-2 mt-lg-0">
      <li class="nav-item">
        <a class="nav-link" href="/E-cart/">Home <span class="sr-only">(current)</span></a>
      </li>
      <li class="nav-item" id="about">
        <a class="nav-link" href="about.html">About Us</a>
      </li>
      <li class="nav-item" id="contact">
        <a class="nav-link" href="contact.html">Contact Us</a>
      </li>
    </ul>        
     <a href="SellerHome.jsp"> <button class="btn btn-outline-success my-2 my-sm-0">Become a seller</button></a>
     <a href="login.jsp" style="text-decoration:none;padding-left:20px">Login</a>
     

  </div>
</nav>`;
  }
} 
customElements.define('header-h', Header);

class Footer extends HTMLElement{
	connectedCallback(){
		this.innerHTML=`<footer class="page-footer font-small">

  <div class="footer-copyright text-center py-3">© 2020 Copyright:
    <a href="https://mdbootstrap.com/">E-cart</a>
  </div>
  

</footer>`;
	}
}
customElements.define('footer-f',Footer);
