// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"


/* ===================================
   NAVIGATION MENU
   =================================== */

const navMenu = document.getElementById('nav-menu');
const navToggle = document.getElementById('nav-toggle');
const navLinks = document.querySelectorAll('.nav__link');

// Toggle mobile menu
if (navToggle) {
    navToggle.addEventListener('click', () => {
        navMenu.classList.toggle('show-menu');
        navToggle.classList.toggle('active');
    });
}

// Close mobile menu when clicking on a link
navLinks.forEach(link => {
    link.addEventListener('click', () => {
        navMenu.classList.remove('show-menu');
        navToggle.classList.remove('active');
    });
});

/* ===================================
   SCROLL HEADER
   =================================== */

const header = document.getElementById('header');

function scrollHeader() {
    if (window.scrollY >= 50) {
        header.classList.add('scroll-header');
    } else {
        header.classList.remove('scroll-header');
    }
}

window.addEventListener('scroll', scrollHeader);

/* ===================================
   SCROLL TO TOP BUTTON
   =================================== */

const scrollTopBtn = document.getElementById('scroll-top');

function toggleScrollTop() {
    if (window.scrollY >= 400) {
        scrollTopBtn.classList.add('show-scroll');
    } else {
        scrollTopBtn.classList.remove('show-scroll');
    }
}

window.addEventListener('scroll', toggleScrollTop);

// Scroll to top when button is clicked
if (scrollTopBtn) {
    scrollTopBtn.addEventListener('click', () => {
        window.scrollTo({
            top: 0,
            behavior: 'smooth'
        });
    });
}

/* ===================================
   ACTIVE LINK ON SCROLL
   =================================== */

const sections = document.querySelectorAll('section[id]');

function scrollActive() {
    const scrollY = window.pageYOffset;

    sections.forEach(section => {
        const sectionHeight = section.offsetHeight;
        const sectionTop = section.offsetTop - 100;
        const sectionId = section.getAttribute('id');
        const link = document.querySelector(`.nav__link[href*="${sectionId}"]`);

        if (scrollY > sectionTop && scrollY <= sectionTop + sectionHeight) {
            link?.classList.add('active-link');
        } else {
            link?.classList.remove('active-link');
        }
    });
}

window.addEventListener('scroll', scrollActive);

/* ===================================
   SMOOTH SCROLL FOR ANCHOR LINKS
   =================================== */

document.querySelectorAll('a[href^="#"]').forEach(anchor => {
    anchor.addEventListener('click', function (e) {
        e.preventDefault();
        const targetId = this.getAttribute('href');

        if (targetId === '#') return;

        const targetSection = document.querySelector(targetId);

        if (targetSection) {
            const headerHeight = header.offsetHeight;
            const targetPosition = targetSection.offsetTop - headerHeight;

            window.scrollTo({
                top: targetPosition,
                behavior: 'smooth'
            });
        }
    });
});

/* ===================================
   INTERSECTION OBSERVER FOR ANIMATIONS
   =================================== */

const observerOptions = {
    root: null,
    rootMargin: '0px',
    threshold: 0.1
};

// Callback function for intersection observer
function handleIntersection(entries, observer) {
    entries.forEach(entry => {
        if (entry.isIntersecting) {
            entry.target.classList.add('fade-in-up');
            observer.unobserve(entry.target);
        }
    });
}

// Create observer
const observer = new IntersectionObserver(handleIntersection, observerOptions);

// Observe elements
const animateOnScroll = document.querySelectorAll(
    '.service-card, .tech-category, .differential-item, .stat, .about__text'
);

animateOnScroll.forEach(element => {
    observer.observe(element);
});

/* ===================================
   LAZY LOADING FOR IMAGES (if added)
   =================================== */

if ('loading' in HTMLImageElement.prototype) {
    const images = document.querySelectorAll('img[loading="lazy"]');
    images.forEach(img => {
        img.src = img.dataset.src;
    });
} else {
    // Fallback for browsers that don't support lazy loading
    const script = document.createElement('script');
    script.src = 'https://cdnjs.cloudflare.com/ajax/libs/lazysizes/5.3.2/lazysizes.min.js';
    document.body.appendChild(script);
}

/* ===================================
   FORM VALIDATION (if contact form is added)
   =================================== */

function validateEmail(email) {
    const regex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
    return regex.test(email);
}

function validatePhone(phone) {
    const regex = /^[\d\s\-\(\)\+]+$/;
    return regex.test(phone) && phone.replace(/\D/g, '').length >= 10;
}

/* ===================================
   PERFORMANCE OPTIMIZATION
   =================================== */

// Debounce function for scroll events
function debounce(func, wait = 10, immediate = true) {
    let timeout;
    return function() {
        const context = this;
        const args = arguments;
        const later = function() {
            timeout = null;
            if (!immediate) func.apply(context, args);
        };
        const callNow = immediate && !timeout;
        clearTimeout(timeout);
        timeout = setTimeout(later, wait);
        if (callNow) func.apply(context, args);
    };
}

// Apply debounce to scroll events
window.addEventListener('scroll', debounce(() => {
    scrollHeader();
    toggleScrollTop();
    scrollActive();
}, 10));

/* ===================================
   KEYBOARD NAVIGATION ACCESSIBILITY
   =================================== */

// Trap focus in mobile menu when open
function trapFocus(element) {
    const focusableElements = element.querySelectorAll(
        'a[href], button:not([disabled]), textarea, input, select'
    );

    const firstFocusable = focusableElements[0];
    const lastFocusable = focusableElements[focusableElements.length - 1];

    element.addEventListener('keydown', (e) => {
        if (e.key !== 'Tab') return;

        if (e.shiftKey) {
            if (document.activeElement === firstFocusable) {
                lastFocusable.focus();
                e.preventDefault();
            }
        } else {
            if (document.activeElement === lastFocusable) {
                firstFocusable.focus();
                e.preventDefault();
            }
        }
    });
}

// Close mobile menu on Escape key
document.addEventListener('keydown', (e) => {
    if (e.key === 'Escape' && navMenu.classList.contains('show-menu')) {
        navMenu.classList.remove('show-menu');
        navToggle.classList.remove('active');
        navToggle.focus();
    }
});

/* ===================================
   STATISTICS COUNTER ANIMATION
   =================================== */

function animateCounter(element, target, duration = 2000) {
    let current = 0;
    const increment = target / (duration / 16); // 60fps

    const updateCounter = () => {
        current += increment;
        if (current < target) {
            element.textContent = Math.floor(current) + (element.textContent.includes('%') ? '%' : '+');
            requestAnimationFrame(updateCounter);
        } else {
            element.textContent = target + (element.textContent.includes('%') ? '%' : '+');
        }
    };

    updateCounter();
}

// Observe stats section and animate counters
const statsObserver = new IntersectionObserver((entries) => {
    entries.forEach(entry => {
        if (entry.isIntersecting) {
            const number = entry.target.querySelector('.stat__number');
            const text = number.textContent;
            const hasPercent = text.includes('%');
            const hasPlus = text.includes('+');
            const value = parseFloat(text.replace(/[^0-9.]/g, ''));

            if (!number.dataset.animated) {
                number.dataset.animated = 'true';
                number.textContent = '0' + (hasPercent ? '%' : hasPlus ? '+' : '');
                animateCounter(number, value);
            }

            statsObserver.unobserve(entry.target);
        }
    });
}, { threshold: 0.5 });

document.querySelectorAll('.stat').forEach(stat => {
    statsObserver.observe(stat);
});

/* ===================================
   PRELOAD CRITICAL RESOURCES
   =================================== */

// Preconnect to external domains if needed
const preconnectLinks = [];
preconnectLinks.forEach(url => {
    const link = document.createElement('link');
    link.rel = 'preconnect';
    link.href = url;
    document.head.appendChild(link);
});

/* ===================================
   ERROR HANDLING
   =================================== */

window.addEventListener('error', (e) => {
    console.error('An error occurred:', e.message);
    // Could send error to analytics or logging service
});

/* ===================================
   CONSOLE WELCOME MESSAGE
   =================================== */

console.log('%c Sys Djam Soft House ',
    'background: #000; color: #fff; font-size: 20px; font-weight: bold; padding: 10px;');
console.log('%c Inovação, Segurança e Performance em Tecnologia ',
    'background: #1a1a1a; color: #a0a0a0; font-size: 14px; padding: 5px;');
console.log('%c Desenvolvido com excelência técnica ',
    'color: #4a4a4a; font-size: 12px;');

/* ===================================
   INITIALIZE
   =================================== */

document.addEventListener('DOMContentLoaded', () => {
    // Add loaded class to body for CSS transitions
    document.body.classList.add('loaded');

    // Initialize scroll effects
    scrollHeader();
    toggleScrollTop();
    scrollActive();

    console.log('Landing page initialized successfully');
});
