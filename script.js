document.addEventListener('DOMContentLoaded', () => {
  // Mobile Menu Toggle
  const mobileMenuBtn = document.querySelector('.mobile-menu-btn');
  const navList = document.querySelector('nav ul');

  if (mobileMenuBtn) {
    mobileMenuBtn.addEventListener('click', () => {
      navList.classList.toggle('active');
      mobileMenuBtn.classList.toggle('active');

      // Change icon
      const icon = mobileMenuBtn.querySelector('i');
      if (navList.classList.contains('active')) {
        icon.classList.remove('fa-bars');
        icon.classList.add('fa-times');
      } else {
        icon.classList.remove('fa-times');
        icon.classList.add('fa-bars');
      }
    });

    // Close menu when clicking a link
    const navLinks = document.querySelectorAll('nav ul li a');
    navLinks.forEach(link => {
      link.addEventListener('click', () => {
        navList.classList.remove('active');
        mobileMenuBtn.classList.remove('active');
        const icon = mobileMenuBtn.querySelector('i');
        icon.classList.remove('fa-times');
        icon.classList.add('fa-bars');
      });
    });
  }

  // Smooth Scroll for Anchor Links
  document.querySelectorAll('a[href^="#"]').forEach(anchor => {
    anchor.addEventListener('click', function (e) {
      e.preventDefault();
      document.querySelector(this.getAttribute('href')).scrollIntoView({
        behavior: 'smooth'
      });
    });
  });

  // Reveal Animations on Scroll
  const observerOptions = {
    threshold: 0.1
  };

  const observer = new IntersectionObserver((entries) => {
    entries.forEach(entry => {
      if (entry.isIntersecting) {
        entry.target.classList.add('fade-in-up');
        observer.unobserve(entry.target);
      }
    });
  }, observerOptions);

  const animatedElements = document.querySelectorAll('.card, .service-card, .section-title, .about-content, .about-image');
  animatedElements.forEach(el => {
    el.style.opacity = '0'; // Initial state
    observer.observe(el);
  });

  // Hero Background Slideshow
  const slides = document.querySelectorAll('.hero-slider .slide');
  if (slides.length > 0) {
    let currentSlide = 0;
    const intervalTime = 5000; // Change every 5 seconds

    setInterval(() => {
      // Remove active class from current slide
      slides[currentSlide].classList.remove('active');

      // Move to next slide
      currentSlide = (currentSlide + 1) % slides.length;

      // Add active class to new slide
      slides[currentSlide].classList.add('active');
    }, intervalTime);
  }


  // Header Scroll Effect
  const header = document.querySelector('header');
  window.addEventListener('scroll', () => {
    if (window.scrollY > 50) {
      header.classList.add('scrolled');
    } else {
      header.classList.remove('scrolled');
    }
  });
});

// WhatsApp Booking Function
function sendToWhatsapp(e) {
  e.preventDefault();
  const name = document.getElementById('name').value;
  const destination = document.getElementById('destination').value;
  const guests = document.getElementById('guests').value;
  const message = document.getElementById('message').value;

  const text = `*New Booking Inquiry*%0A%0AName: ${name}%0ADestination: ${destination}%0AGuests: ${guests}%0AMessage: ${message}`;
  const phoneNumber = "94777841845";

  window.open(`https://wa.me/${phoneNumber}?text=${text}`, '_blank');
}
